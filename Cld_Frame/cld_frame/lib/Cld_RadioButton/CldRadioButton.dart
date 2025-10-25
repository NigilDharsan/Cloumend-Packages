import 'package:flutter/material.dart';


class CldRadioButton{

//RADIO BUTTON
Widget  CldTwoRadioButton(
    { int? groupValue1,
       int? groupValue2,
       void Function(int?)? onChanged1,
       void Function(int?)? onChanged2,
       String? radioTxt1,
       String? radioTxt2,
      Color? activeColor,
      Color? focusColor,
      WidgetStateProperty<Color?>? fillColor,
      bool autofocus = false,
      double? splashRadius,
      WidgetStateProperty<Color?>? overlayColor,
      Color? hoverColor,
      VisualDensity? visualDensity,
      TextStyle? Radiostyle,
      double? splitWidth,
    }) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Radio(
        value: 0,
        activeColor: activeColor,
        focusColor: focusColor,
        fillColor:fillColor ,
        autofocus: autofocus,
        splashRadius: splashRadius,
        overlayColor: overlayColor,
        groupValue: groupValue1,
        onChanged: onChanged1,
        hoverColor: hoverColor,
        visualDensity: visualDensity ??  VisualDensity(horizontal: -4, vertical: -4),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
  Padding(
    padding: const EdgeInsets.only(left: 5),
        child: Text(
        radioTxt1 ?? "",
        style: Radiostyle,
       maxLines: 2,
          ),
  ),

      SizedBox(
        width: splitWidth ?? 40,
      ),
      Radio(
        value: 1,
        activeColor: activeColor,
        focusColor: focusColor,
        fillColor:fillColor ,
        autofocus: autofocus,
        splashRadius: splashRadius,
        overlayColor: overlayColor,
        hoverColor: hoverColor,
        visualDensity: visualDensity ??  VisualDensity(horizontal: -4, vertical: -4),
        groupValue: groupValue2,
        onChanged: onChanged2,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Text(
          radioTxt2 ?? "",
          style: Radiostyle,
          maxLines: 2,
        ),
      ),
    ],
  );
}

//MULTIPLE RADIO BUTTON
Widget CldMultiRadioButton(context,
    {required int? groupValue1,
      required int? groupValue2,
      required int? groupValue3,
      required void Function(int?)? onChanged1,
      required void Function(int?)? onChanged2,
      required void Function(int?)? onChanged3,
      required String radioTxt1,
      required String radioTxt2,
      required String radioTxt3,
      Color? activeColor,
      Color? focusColor,
      WidgetStateProperty<Color?>? fillColor,
      bool autofocus = false,
      double? splashRadius,
      WidgetStateProperty<Color?>? overlayColor,
      Color? hoverColor,
      VisualDensity? visualDensity,
      TextStyle? Radiostyle
    }) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Radio(
              value: 0,
              groupValue: groupValue1,
              activeColor: activeColor,
              focusColor: focusColor,
              fillColor:fillColor ,
              autofocus: autofocus,
              splashRadius: splashRadius,
              overlayColor: overlayColor,
              hoverColor: hoverColor,
              visualDensity: visualDensity ??  VisualDensity(horizontal: -4, vertical: -4),
              onChanged: onChanged1,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                radioTxt1 ?? "",
                style: Radiostyle,
                maxLines: 2,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Radio(
              value: 1,
              groupValue: groupValue2,
              onChanged: onChanged1,
              activeColor: activeColor,
              focusColor: focusColor,
              fillColor:fillColor ,
              autofocus: autofocus,
              splashRadius: splashRadius,
              overlayColor: overlayColor,
              hoverColor: hoverColor,
              visualDensity: visualDensity ??  VisualDensity(horizontal: -4, vertical: -4),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                radioTxt1 ?? "",
                style: Radiostyle,
                maxLines: 2,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Radio(
              value: 2,
              groupValue: groupValue3,
              onChanged: onChanged3,
              activeColor: activeColor,
              focusColor: focusColor,
              fillColor:fillColor ,
              autofocus: autofocus,
              splashRadius: splashRadius,
              overlayColor: overlayColor,
              hoverColor: hoverColor,
              visualDensity: visualDensity ??  VisualDensity(horizontal: -4, vertical: -4),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                radioTxt1 ?? "",
                style: Radiostyle,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
}