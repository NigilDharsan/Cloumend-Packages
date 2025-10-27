import 'package:cld_frame/Cld_Colors/CldColors.dart';
import 'package:cld_frame/Cld_Dimensions/CldDimensions.dart';
import 'package:flutter/material.dart';


class CldButton extends StatelessWidget {
  final Function()? onPressed;
  final String? buttonText;
  final bool? transparent;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? fontSize;
  final double? radius;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final TextStyle? style;
  final Color? backgroundColor;
  final Color? leftIconColor;
  final Color? rightIconColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? elevation;

  const CldButton({
    super.key,
    this.onPressed,
    @required this.buttonText,
    this.transparent = false,
    this.margin,
    this.width,
    this.height,
    this.fontSize,
    this.radius = 5,
    this.leftIcon,
    this.style,
    this.backgroundColor,
    this.leftIconColor,
    this.rightIcon,
    this.rightIconColor,
    this.borderColor,
    this.borderWidth,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      elevation: elevation,
      backgroundColor: transparent == true
          ? Colors.transparent
          : (backgroundColor ?? CldColors.primaryColor),
      minimumSize: Size(
        width ?? MediaQuery.of(context).size.width,
        height ?? 45,
      ),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius!),
        side: BorderSide(
          color: borderColor ?? Colors.transparent,
          width: borderWidth ?? 0,
        ),
      ),
    );

    return Center(
      child: SizedBox(
        width: width ?? MediaQuery.of(context).size.width,
        child: Padding(
          padding: margin ?? EdgeInsets.zero,
          child: ElevatedButton(
            onPressed: onPressed,
            style: buttonStyle,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (leftIcon != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: CldDimensions.paddingSizeExtraSmall),
                    child: Icon(
                      leftIcon,
                      color: transparent!
                          ? leftIconColor
                          : Colors.white,
                      size: 18,
                    ),
                  ),
                Text(
                  buttonText ?? '',
                  textAlign: TextAlign.center,
                  style: style,
                ),
                if (rightIcon != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: CldDimensions.paddingSizeExtraSmall),
                    child: Icon(
                      rightIcon,
                      color: transparent!
                          ? rightIconColor
                          : Colors.white,
                      size: 18,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
