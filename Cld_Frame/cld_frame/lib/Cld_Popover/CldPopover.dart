import 'dart:async';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

enum PopTransition { scale, other }

enum CldPopDirection { bottom, left, right, top }

// ignore: must_be_immutable
class CldPopover {
  bool isOpened = false;
  Timer? _closeTimer;

  void show({
    required BuildContext context,
    CldPopDirection? popoverDirection,
    required Widget? content,
    final bool? autoClose,
    final int? closeInSec,
    final Color? backgroundColor,
    final Color? barrierColor,
    final double? arrowHeight,
    final double? arrowWidth,
    final double? arrowDxOffset,
    final double? arrowDyOffset,
    final double? contentDxOffset,
    final double? contentDyOffset,
    final double? height,
    final double? width,
    final bool? barrierDismissible,
    final List<BoxShadow>? boxShadow,
    final BoxConstraints? constraints,
    final String? barrierLabel,
    final PopTransition? transition,
    final Duration? transitionDuration,
    Widget Function(Animation<double>, Widget)? popoverTransitionBuilder,
    final double? radius,
  }) {
    _closeTimer?.cancel();

    if (isOpened) {
      Navigator.of(context, rootNavigator: true).pop();
    }

    isOpened = true;

    showPopover(
      backgroundColor: backgroundColor ?? Colors.blue,
      context: context,
      bodyBuilder: (context) =>
          content ??
          const SizedBox(
            height: 25,
            width: 150,
          ),
      direction: popDirection(popoverDirection),
      barrierColor: barrierColor ?? Colors.transparent,
      arrowHeight: arrowHeight ?? 12,
      arrowWidth: arrowWidth ?? 20,
      arrowDxOffset: arrowDxOffset ?? 0,
      arrowDyOffset: arrowDyOffset ?? 0,
      contentDxOffset: contentDxOffset ?? 0,
      contentDyOffset: contentDyOffset ?? 0,
      height: height,
      width: width,
      constraints: constraints,
      barrierLabel: barrierLabel,
      radius: radius ?? 8,
      barrierDismissible: barrierDismissible ?? true,
      popoverTransitionBuilder: popoverTransitionBuilder,
      transitionDuration:
          transitionDuration ?? const Duration(milliseconds: 200),
      transition: popTransition(transition),
      shadow: boxShadow ??
          [const BoxShadow(color: Color(0x1F000000), blurRadius: 5)],
      onPop: () {
        isOpened = false;
        _closeTimer?.cancel();
      },
    );

    if (autoClose == true) {
      _closeTimer = Timer(Duration(seconds: closeInSec ?? 4), () {
        if (isOpened) {
          Navigator.of(context, rootNavigator: true).maybePop();
        }
      });
    }
  }

  PopoverTransition popTransition(PopTransition? transition) {
    switch (transition) {
      case PopTransition.other:
        return PopoverTransition.other;
      default:
        return PopoverTransition.scale;
    }
  }

  PopoverDirection popDirection(CldPopDirection? dir) {
    switch (dir) {
      case CldPopDirection.top:
        return PopoverDirection.top;
      case CldPopDirection.left:
        return PopoverDirection.left;
      case CldPopDirection.right:
        return PopoverDirection.right;
      default:
        return PopoverDirection.bottom;
    }
  }
}
