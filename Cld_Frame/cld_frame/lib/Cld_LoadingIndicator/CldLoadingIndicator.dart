import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CldLoadingIndicator extends StatelessWidget {
  final Color? color;
  final double strokeWidth;
  const CldLoadingIndicator({super.key, this.color, this.strokeWidth = 4});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
            color: color ??
                (Get.isDarkMode
                    ? Colors.green
                    : Theme.of(context).primaryColor),
            strokeWidth: strokeWidth));
  }
}
