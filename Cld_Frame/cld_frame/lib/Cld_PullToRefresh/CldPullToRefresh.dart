import 'package:flutter/material.dart';

class CldPullToRefresh extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;
  final Widget? refreshIndicator;
  final Color? color;
  final Color? backgroundColor;

  const CldPullToRefresh({
    super.key,
    required this.child,
    required this.onRefresh,
    this.refreshIndicator,
    this.color = Colors.green,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 60,
      color: color,
      backgroundColor: backgroundColor,
      strokeWidth: 2.5,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
