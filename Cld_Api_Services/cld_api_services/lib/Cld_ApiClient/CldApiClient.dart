import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';



class ApiClient {
  final String appBaseUrl;
  final SharedPreferences sharedPreferences;
  final Future<void> Function()? onTokenExpired;
  final String? masterUrl;
  final String? loginUrl;
  final String? smartFloBaseUrl;
  final bool enableLogging;

  static const String noInternetMessage = 'Connection to API server failed';
  final int timeoutInSeconds = 30;

  String? token;
  late Map<String, String> _mainHeaders;
  late Map<String, String> _getmainHeaders;

  ApiClient({
    required this.appBaseUrl,
    required this.sharedPreferences,
    this.onTokenExpired,
    this.masterUrl,
    this.loginUrl,
    this.smartFloBaseUrl,
    this.enableLogging = false,
  }) {
    token = sharedPreferences.getString('token');
    postUpdateHeader(token);
    getUpdateHeader(token);
  }

  void _log(String message) {
    if (enableLogging) {
      print('[ApiClient] $message');
    }
  }

  void postUpdateHeader(String? token) {
    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
      'Accept-Language': sharedPreferences.getString('language_code') ?? 'en',
    };
  }

  void getUpdateHeader(String? token) {
    _getmainHeaders = {
      'Authorization': 'Bearer $token',
      'Accept-Language': sharedPreferences.getString('language_code') ?? 'en',
    };
  }

  Future<http.Response> _handleHttp(http.Response response) async {
    if (response.statusCode == 401 && onTokenExpired != null) {
      await onTokenExpired!();
    }
    return response;
  }

  Future<Response> getData(String uri, {Map<String, String>? headers}) async {
    try {
      final url = Uri.parse(appBaseUrl + uri);
      _log('GET $url');
      _log('HEADER: $headers');
      final response = await http
          .get(url, headers: headers ?? _getmainHeaders)
          .timeout(Duration(seconds: timeoutInSeconds));
      _log('Response ${response.statusCode}: ${response.body}');
      await _handleHttp(response);
      return _handleResponse(response);
    } catch (e) {
      _log('GET error: $e');
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> postData(String uri, dynamic body, {Map<String, String>? headers}) async {
    try {
      final url = Uri.parse(appBaseUrl + uri);
      _log('POST $url\nBody: ${jsonEncode(body)}');
      _log('HEADER: $headers');
      final response = await http
          .post(url, body: jsonEncode(body), headers: headers ?? _mainHeaders)
          .timeout(Duration(seconds: timeoutInSeconds));
      _log('Response ${response.statusCode}: ${response.body}');
      await _handleHttp(response);
      return _handleResponse(response);
    } catch (e) {
      _log('POST error: $e');
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> postLoginData(String uri, dynamic body,
      {Map<String, String>? headers}) async {
    try {
      final url = Uri.parse((loginUrl ?? appBaseUrl) + uri);
      _log('POST LOGIN $url\nBody: $body');
      _log('HEADER: $headers');
      final response = await http
          .post(url, body: body, headers: headers)
          .timeout(Duration(seconds: timeoutInSeconds));
      _log('Response ${response.statusCode}: ${response.body}');
      return _handleResponse(response);
    } catch (e) {
      _log('Login POST error: $e');
      return  Response(statusCode: 1, statusText: ApiClient.noInternetMessage);
    }
  }


  Future<Response> patchData(String uri, dynamic body, {Map<String, String>? headers}) async {
    try {
      final url = Uri.parse(appBaseUrl + uri);
      _log('PATCH $url\nBody: ${jsonEncode(body)}');
      _log('HEADER: $headers');
      final response = await http
          .patch(url, body: jsonEncode(body), headers: headers ?? _mainHeaders)
          .timeout(Duration(seconds: timeoutInSeconds));
      _log('Response ${response.statusCode}: ${response.body}');
      await _handleHttp(response);
      return _handleResponse(response);
    } catch (e) {
      _log('PATCH error: $e');
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> putData(String uri, dynamic body, {Map<String, String>? headers}) async {
    try {
      final url = Uri.parse(appBaseUrl + uri);
      _log('PUT $url\nBody: ${jsonEncode(body)}');
      _log('HEADER: $headers');
      final response = await http
          .put(url, body: jsonEncode(body), headers: headers ?? _mainHeaders)
          .timeout(Duration(seconds: timeoutInSeconds));
      _log('Response ${response.statusCode}: ${response.body}');
      await _handleHttp(response);
      return _handleResponse(response);
    } catch (e) {
      _log('PUT error: $e');
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> deleteData(String uri, {Map<String, String>? headers}) async {
    try {
      final url = Uri.parse(appBaseUrl + uri);
      _log('DELETE $url');
      _log('HEADER: $headers');
      final response = await http
          .delete(url, headers: headers ?? _mainHeaders)
          .timeout(Duration(seconds: timeoutInSeconds));
      _log('Response ${response.statusCode}: ${response.body}');
      return _handleResponse(response);
    } catch (e) {
      _log('DELETE error: $e');
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> postMultipartData(String uri, Map<String, String> body,
      List<MultipartBody>? multipartBody, File? otherFile,
      {Map<String, String>? headers}) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(appBaseUrl + uri));
      request.headers.addAll(headers ?? _mainHeaders);
      request.fields.addAll(body);
      _log('POST Multipart $uri\nFields: $body');
      _log('HEADER: $headers');
      if (otherFile != null) {
        final bytes = await otherFile.readAsBytes();
        request.files.add(http.MultipartFile(
          'submitted_file',
          Stream.value(bytes),
          bytes.length,
          filename: basename(otherFile.path),
        ));
        _log('Attached file: ${otherFile.path}');
      }

      if (multipartBody != null) {
        for (var part in multipartBody) {
          final file = File(part.file.path);
          final bytes = await file.readAsBytes();
          request.files.add(http.MultipartFile(
            part.key!,
            Stream.value(bytes),
            bytes.length,
            filename: basename(file.path),
          ));
          _log('Attached file: ${file.path}');
        }
      }

      final response = await http.Response.fromStream(await request.send());
      _log('Response ${response.statusCode}: ${response.body}');
      return _handleResponse(response);
    } catch (e) {
      _log('Multipart POST error: $e');
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<bool> isTokenExpired(String token) async {
    try {
      final payload = Jwt.parseJwt(token);
      final exp = DateTime.fromMillisecondsSinceEpoch(payload['exp'] * 1000);
      return DateTime.now().isAfter(exp);
    } catch (e) {
      _log('JWT decode error: $e');
      if (onTokenExpired != null) await onTokenExpired!();
      return true;
    }
  }

  Response _handleResponse(http.Response response) {
    dynamic body;
    try {
      body = jsonDecode(response.body);
    } catch (_) {
      body = response.body;
    }

    return Response(
      body: body,
      bodyString: response.body,
      headers: response.headers,
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
    );
  }
}

class Response {
  final dynamic body;
  final String? bodyString;
  final Map<String, String>? headers;
  final int? statusCode;
  final String? statusText;

  Response({
    this.body,
    this.bodyString,
    this.headers,
    this.statusCode,
    this.statusText,
  });
}

class MultipartBody {
  final String? key;
  final XFile file;

  MultipartBody(this.key, this.file);
}
