import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CldNetworkImage extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final String? placeholder;
  const CldNetworkImage(
      {super.key,
        required this.image,
        this.height,
        this.width,
        this.fit = BoxFit.cover,
        this.placeholder});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      height: height,
      width: width,
      fit: fit,
      placeholder: (context, url) => Image.asset(placeholder ?? "",
          height: height,
          width: width,
          fit: fit,
          cacheHeight: height?.toInt(),
          cacheWidth: width?.toInt()),
      errorWidget: (context, url, error) => Image.asset(placeholder ?? "",
          height: height,
          width: width,
          fit: fit,
          cacheHeight: height?.toInt(),
          cacheWidth: width?.toInt()),
    );
  }
}


class CldAssetImage extends StatelessWidget {
  final String assetPath;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;

  const CldAssetImage({
    super.key,
    required this.assetPath,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Image.asset(
        assetPath,
        fit: fit ?? BoxFit.contain,
        color: color,
      ),
    );
  }
}




class CldAssetSvg extends StatelessWidget {
  final String assetPath;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;

  const CldAssetSvg({
    super.key,
    required this.assetPath,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: SvgPicture.asset(
        assetPath,
        fit: fit ?? BoxFit.contain,
        color: color,
      ),
    );
  }
}


class CldCircleAvatar extends StatelessWidget {
  final double radius;
  final String imageUrl;
  final Color backgroundColor;
  final Widget? placeholder;
  final BoxFit fit;

  const CldCircleAvatar({
    super.key,
    required this.imageUrl,
    this.radius = 16,
    this.backgroundColor = Colors.transparent,
    this.placeholder,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      backgroundImage: NetworkImage(imageUrl),
      child: placeholder,
    );
  }
}

