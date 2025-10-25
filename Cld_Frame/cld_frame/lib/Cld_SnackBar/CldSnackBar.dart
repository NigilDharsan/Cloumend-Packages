import 'package:cld_frame/Cld_Dimensions/CldDimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void CldSnackBar(String? message, {bool isError = true}) {
  if(message != null && message.isNotEmpty) {
    Get.showSnackbar(GetSnackBar(
      backgroundColor: isError ? Colors.red : Colors.green,
      message: message,
      maxWidth: Get.width,
      duration: const Duration(seconds: 2),
      snackStyle: SnackStyle.FLOATING,
      margin: const EdgeInsets.all(CldDimensions.paddingSizeSmall),
      borderRadius: CldDimensions.radiusSmall,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
    ));
  }
}