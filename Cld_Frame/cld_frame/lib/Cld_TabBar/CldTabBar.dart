import 'package:flutter/material.dart';

class CldTabBar extends StatefulWidget {
  final List<TabItem> tabItem;
  final List<Widget> tabScreens;
  final Color? tabBackgroundColor;
  final Color? tabScreenColor;
  final Color? tabLabelColor;
  final Color? dividerColor;
  final Color? indicatorColor;
  final double? dividerHeight;
  final double? tabHeight;
  final EdgeInsets? tabIconMargin;
  final EdgeInsets? indicatorPadding;
  final Color? unselectedLabelColor;
  final TabBarIndicatorSize? indicatorSize;
  final double? indicatorWeight;
  final EdgeInsets? labelPadding;
  final TabAlignment? tabAlignment;
  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;
  final EdgeInsets? padding;
  final BorderRadius? splashBorderRadius;
  final InteractiveInkFeatureFactory? splashFactory;
  final void Function(int)? onTap;
  final Clip? clipBehavior;
  final double? viewportFraction;
  final double? preferredHeight;
  final BoxDecoration? tabDecoration;
  final BoxDecoration? tabBackgroundDecoration;
  final int initialIndex;
  final ScrollPhysics? physics;
  final TabController? controller;

  const CldTabBar({
    super.key,
    required this.tabItem,
    required this.tabScreens,
    this.tabBackgroundColor,
    this.tabScreenColor,
    this.tabLabelColor,
    this.tabHeight,
    this.tabIconMargin,
    this.dividerColor,
    this.dividerHeight,
    this.indicatorColor,
    this.indicatorPadding,
    this.unselectedLabelColor,
    this.indicatorSize,
    this.indicatorWeight,
    this.labelPadding,
    this.tabAlignment,
    this.labelStyle,
    this.unselectedLabelStyle,
    this.padding,
    this.splashBorderRadius,
    this.splashFactory,
    this.onTap,
    this.clipBehavior,
    this.viewportFraction,
    this.preferredHeight,
    this.tabDecoration,
    this.tabBackgroundDecoration,
    this.initialIndex = 0,
    this.physics,
    this.controller,
  });

  @override
  State<StatefulWidget> createState() => _CldTabBarState();
}

class _CldTabBarState extends State<CldTabBar> {
  @override
  Widget build(BuildContext context) {
    if (widget.controller != null) {
      return _buildTabBarWithController(widget.controller!);
    } else {
      return DefaultTabController(
        length: widget.tabItem.length,
        initialIndex: widget.initialIndex,
        child: Builder(
          builder: (context) {
            final defaultController = DefaultTabController.of(context);
            return _buildTabBarWithController(defaultController);
          },
        ),
      );
    }
  }

  Widget _buildTabBarWithController(TabController controller) {
    return Scaffold(
      backgroundColor: widget.tabScreenColor ?? Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, widget.preferredHeight ?? 56),
        child: Container(
          decoration: widget.tabBackgroundDecoration,
          color: widget.tabBackgroundColor ?? Theme.of(context).primaryColor,
          child: SafeArea(
            bottom: false,
            child: TabBar(
              controller: controller,
              indicator: widget.tabDecoration,
              dividerColor: widget.dividerColor,
              dividerHeight: widget.dividerHeight,
              indicatorColor: widget.indicatorColor,
              indicatorPadding: widget.indicatorPadding ?? EdgeInsets.zero,
              unselectedLabelColor: widget.unselectedLabelColor,
              unselectedLabelStyle: widget.unselectedLabelStyle,
              indicatorSize: widget.indicatorSize,
              indicatorWeight: widget.indicatorWeight ?? 2,
              labelPadding: widget.labelPadding,
              tabAlignment: widget.tabAlignment,
              labelStyle: widget.labelStyle,
              padding: widget.padding,
              enableFeedback: true,
              splashBorderRadius: widget.splashBorderRadius,
              labelColor: widget.tabLabelColor ?? Colors.white,
              splashFactory: widget.splashFactory,
              isScrollable: widget.tabAlignment == TabAlignment.start,
              physics: widget.physics,
              onTap: widget.onTap,
              tabs: widget.tabItem.map((tabItem) {
                if (tabItem.icon != null && (tabItem.lable?.isNotEmpty ?? false)) {
                  return Tab(
                    height: widget.tabHeight,
                    iconMargin: widget.tabIconMargin,
                    icon: tabItem.icon,
                    text: tabItem.lable,
                  );
                } else if (tabItem.icon != null) {
                  return Tab(
                    height: widget.tabHeight,
                    iconMargin: widget.tabIconMargin,
                    icon: tabItem.icon,
                  );
                } else {
                  return Tab(
                    height: widget.tabHeight,
                    text: tabItem.lable ?? '',
                  );
                }
              }).toList(),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller,
        clipBehavior: widget.clipBehavior ?? Clip.antiAlias,
        physics: widget.physics ?? const BouncingScrollPhysics(),
        children: widget.tabScreens,
      ),
    );
  }
}

class TabItem {
  final Icon? icon;
  final String? lable;

  const TabItem({this.icon, this.lable});
}