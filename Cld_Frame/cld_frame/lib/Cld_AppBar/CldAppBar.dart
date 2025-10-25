import 'package:cld_frame/Cld_Dimensions/CldDimensions.dart';
import 'package:flutter/material.dart';

class CldAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool isBackButtonExist;
  final bool isTitleNeeded;
  final Function()? onBackPressed;
  final bool? showCart;
  final bool? centerTitle;
  final Color? bgColor;
  final Color? leadingIconColor;
  final List<Widget>? actions;
  final TextStyle? textstyle;
  final Widget? leading;
  final double? leadingWidth;
  final double? toolbarHeight;
  final Widget? flexibleSpace;
  final Clip? clipBehavior;
  final Widget? titleWidget;
  final double? elevation;
  const CldAppBar(
      {super.key,
        this.title = '',
        this.isBackButtonExist = true,
        this.onBackPressed,
        this.showCart = false,
        this.centerTitle = false,
        this.bgColor,
        this.leadingIconColor,
        this.textstyle,
        this.leadingWidth,
        this.toolbarHeight,
        this.flexibleSpace,
        this.clipBehavior,
        this.leading = const SizedBox(),
        this.actions = const [SizedBox()],
        this.isTitleNeeded = true,
        this.titleWidget,
        this.elevation = 0.0,
      });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: isTitleNeeded == true?Text(
        title!,
        style: textstyle,
      ):titleWidget,
      centerTitle: centerTitle,
      leadingWidth: leadingWidth,
      toolbarHeight: toolbarHeight,
      clipBehavior: clipBehavior,
      automaticallyImplyLeading: false,
      titleSpacing: isBackButtonExist ? 5 : 10,
      flexibleSpace:flexibleSpace,
      leading: isBackButtonExist
          ? IconButton(
        splashRadius: CldDimensions.paddingSizeLarge,
        hoverColor: Colors.transparent,
        icon: Icon(Icons.arrow_back,
            color: leadingIconColor ?? Theme.of(context).primaryColor),
        color: Theme.of(context).textTheme.bodyLarge!.color,
        onPressed: () => onBackPressed != null
            ? onBackPressed!()
            : Navigator.pop(context),
      )
          : leading,
      backgroundColor: bgColor,
      elevation: elevation,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(CldDimensions.preferredSize);
}
