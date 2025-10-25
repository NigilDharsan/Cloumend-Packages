import 'package:flutter/material.dart';

class CldDropdownField<T> extends StatelessWidget {
  final String? label;
  final T? value;
  final List<T> items;
  final ValueChanged<T?>? onChanged;
  final FormFieldValidator<T>? validator;
  final String? hintText;
  final String Function(T)? displayName;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final double borderRadius;
  final bool isDense;
  final bool? filled;
  final bool? autofocus;
  final bool? isExpanded;
  final EdgeInsets? padding;
  final Color? iconDisabledColor;
  final Color? iconEnabledColor;
  final String? disabledHint;
  final Color? dropdownColor;
  final double? dropdownItemHeight;
  final double? dropdownHeight;
  final TextStyle? lableTextStyle;
  final bool? isCollapsed;
  final int? elevation;
  final int? hintMaxLines;
  final double? defaultIconSize;
  final String? suffixText;
  final String? prefixText;
  final TextStyle? suffixStyle;
  final TextStyle? prefixStyle;
  final double? dropDownFieldHeight;
  final double? dropDownFieldWidth;
  final AlignmentGeometry? selectedItemAlignment;
  final bool? enableBorder;
  final Color? enableBorderColor;
  final Color? focusedBorderColor;
  final Color? defaultIconColor;
  final double? dropdownBorderRadius;
  final String? initialValue;
  final AlignmentGeometry? hintTextAligment;

  const CldDropdownField({
    super.key,
    required this.items,
    required this.onChanged,
    required this.displayName,
    this.label,
    this.value,
    this.validator,
    this.hintText,
    this.contentPadding,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor,
    this.textStyle,
    this.hintStyle,
    this.borderRadius = 12,
    this.isDense = true,
    this.filled,
    this.autofocus,
    this.isExpanded,
    this.padding,
    this.iconDisabledColor,
    this.iconEnabledColor,
    this.disabledHint,
    this.dropdownColor,
    this.dropdownItemHeight,
    this.dropdownHeight,
    this.lableTextStyle,
    this.isCollapsed,
    this.elevation,
    this.hintMaxLines,
    this.defaultIconSize,
    this.prefixText,
    this.suffixText,
    this.dropDownFieldHeight,
    this.dropDownFieldWidth,
    this.prefixStyle,
    this.suffixStyle,
    this.selectedItemAlignment,
    this.enableBorder,
    this.enableBorderColor,
    this.focusedBorderColor,
    this.defaultIconColor,
    this.dropdownBorderRadius,
    this.initialValue,
    this.hintTextAligment,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      autofocus: autofocus ?? false,
      dropdownColor: dropdownColor ?? Colors.white,
      borderRadius: BorderRadius.circular(dropdownBorderRadius ?? 0),
      isExpanded: isExpanded ?? true,
      padding: padding,
      iconDisabledColor: iconDisabledColor,
      iconEnabledColor: iconEnabledColor,
      disabledHint: disabledHint != null ? Text(disabledHint!) : null,
      itemHeight: dropdownItemHeight,
      iconSize: defaultIconSize ?? 24,
      menuMaxHeight: dropdownHeight,
      icon: (prefixIcon == null && suffixIcon == null)
          ? null
          : const SizedBox.shrink(),
      elevation: elevation ?? 4,
      value: value,
      hint: hintText != null
          ? Align(
              alignment: hintTextAligment ?? Alignment.centerLeft,
              child: Text(
                hintText!,
                style: hintStyle ?? TextStyle(color: Colors.grey[600]),
                overflow: TextOverflow.ellipsis,
              ),
            )
          : null,
      items: items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: dropDownFieldWidth ?? 200,
            child: Text(displayName!(item)),
          ),
        );
      }).toList(),
      onChanged: onChanged,
      validator: validator,
      isDense: isDense,
      decoration: InputDecoration(
        enabled: enableBorder ?? true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(style: BorderStyle.none, width: 0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: enableBorderColor ?? Colors.black),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: focusedBorderColor ?? Colors.black),
        ),
        alignLabelWithHint: true,
        constraints: BoxConstraints(
          maxHeight: dropDownFieldHeight ?? double.infinity,
          maxWidth: dropDownFieldWidth ?? double.infinity,
        ),
        isDense: isDense,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        labelText: label,
        labelStyle: lableTextStyle,
        hintMaxLines: hintMaxLines,
        isCollapsed: isCollapsed ?? false,
        suffixText: suffixText,
        prefixText: prefixText,
        suffixStyle: suffixStyle,
        iconColor: defaultIconColor,
        prefixStyle: prefixStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorMaxLines: 2,
        filled: filled ?? false,
        fillColor: fillColor ?? Colors.grey[100],
      ),
      alignment: selectedItemAlignment ?? Alignment.center,
      style: textStyle ?? const TextStyle(color: Colors.black),
    );
  }
}
