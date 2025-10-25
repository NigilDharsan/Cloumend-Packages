
import 'package:cld_frame/Cld_Dimensions/CldDimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CldTextFormField extends StatefulWidget {
  final String? hintText;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final String? title;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final bool? isPassword;
  final bool? isShowBorder;
  final bool? isAutoFocus;
  final Function(String)? onSubmit;
  final bool? isEnabled;
  final int? maxLines;
  final bool? isShowSuffixIcon;
  final TextCapitalization? capitalization;
  final Function(String text)? onChanged;
  final String? countryDialCode;
  final String? suffixIconUrl;
  final Widget? prefixIcon;
  final double? borderRadius;
  final Color? fillColor;
  final String? Function(String?)? onValidate;
  final Color? suffixIconColorOffVisibility;
  final Color? suffixIconColorVisibility;
  final IconData? suffixVisibilityIcon;
  final IconData? suffixOffVisibilityIcon;
  final Widget? suffixIcon;
  final bool? enabled;
  final Color? enableBorderColor;
  final Color? focusedBorderColor;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;

  const CldTextFormField({
    super.key,
    this.hintText = '',
    this.style,
    this.hintStyle,
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.isShowSuffixIcon = false,
    this.onSubmit,
    this.capitalization = TextCapitalization.none,
    this.isPassword = false,
    this.isShowBorder = false,
    this.isAutoFocus = false,
    this.countryDialCode,
    this.suffixIconUrl,
    this.onChanged,
    this.onValidate,
    this.prefixIcon,
    this.borderRadius = CldDimensions.radiusSmall,
    this.fillColor,
    this.title,
    this.suffixIconColorVisibility,
    this.suffixIconColorOffVisibility,
    this.suffixVisibilityIcon,
    this.suffixOffVisibilityIcon,
    this.suffixIcon,
    this.enableBorderColor,
    this.focusedBorderColor,
    this.enabled,
    this.inputFormatters,
    this.autovalidateMode,
  });

  @override
  CldTextFormFieldState createState() => CldTextFormFieldState();
}

class CldTextFormFieldState extends State<CldTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines,
      controller: widget.controller,
      focusNode: widget.focusNode,
      inputFormatters: widget.inputFormatters,
      style: widget.style,
      textInputAction: widget.inputAction,
      keyboardType: widget.inputType,
      cursorColor: Theme.of(context).hintColor,
      textCapitalization: widget.capitalization!,
      enabled: widget.isEnabled,
      autofocus: widget.isAutoFocus!,
      autovalidateMode: widget.autovalidateMode,
      autofillHints: widget.inputType == TextInputType.name
          ? [AutofillHints.name]
          : widget.inputType == TextInputType.emailAddress
          ? [AutofillHints.email]
          : widget.inputType == TextInputType.phone
          ? [AutofillHints.telephoneNumber]
          : widget.inputType == TextInputType.streetAddress
          ? [AutofillHints.fullStreetAddress]
          : widget.inputType == TextInputType.url
          ? [AutofillHints.url]
          : widget.inputType == TextInputType.visiblePassword
          ? [AutofillHints.password]
          : null,
      obscureText: widget.isPassword! ? _obscureText : false,
      decoration: InputDecoration(
        enabled: widget.enabled ?? false,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius!),
          borderSide: const BorderSide(style: BorderStyle.none, width: 0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius!),
          borderSide: BorderSide(color: widget.enableBorderColor ?? Colors.grey.shade200),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius!),
          borderSide: BorderSide(
              color: Colors.red), // Red border when there's an error
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius!),
          borderSide: BorderSide(
              color: Colors.red), // Red border when focused on error
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius!),
          borderSide: BorderSide(
              color: widget.focusedBorderColor ?? Colors.grey.shade200), // Normal border when focused
        ),
        isDense: true,
        filled: true,
        fillColor: widget.fillColor ?? Theme.of(context).cardColor,
        contentPadding: EdgeInsets.all(CldDimensions.paddingSizeSmall),
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        prefixIcon: widget.prefixIcon,

        suffixIcon: widget.isPassword!
            ? IconButton(
          splashRadius: 20,
          icon: Icon(
              _obscureText ? widget.suffixOffVisibilityIcon : widget.suffixVisibilityIcon,
              color: (_obscureText ? widget.suffixIconColorOffVisibility : widget.suffixIconColorVisibility) ?? Theme.of(context).hintColor.withOpacity(0.3)),
          onPressed: _toggle,
        )
            : widget.suffixIcon,
      ),
      onFieldSubmitted: (text) => widget.nextFocus != null
          ? FocusScope.of(context).requestFocus(widget.nextFocus)
          : widget.onSubmit != null
          ? widget.onSubmit!(text)
          : null,
      onChanged: widget.onChanged,
      validator: widget.onValidate != null ? widget.onValidate! : null,
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}



Widget CvsDatePicker(
    {
      TextEditingController? Controller,
      String? Function(String?)? onValidate,
      void Function(String)? onChanged,
      String? hintText,
      FocusNode? focusNode,
      void Function()? onTap,
      Color? borderColor,
      TextStyle? hintStyle,
      Color? fillColor,
      TextStyle? pickerStyle,
      Widget? suffixIcon,
      Widget? prefixIcon,
      double? radius,
      EdgeInsetsGeometry? contentPadding,
    }) {
  return TextFormField(
    controller: Controller,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    onTap: onTap,
    readOnly: true,
    focusNode: focusNode,
    keyboardType: TextInputType.number,
    maxLength: 15,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 10),
        borderSide: BorderSide(color: borderColor ?? Colors.grey.shade200),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 10),
        borderSide: BorderSide(color: borderColor ?? Colors.grey.shade200),
      ),
      counterText: "",
      hintText: hintText,
      suffixIcon:suffixIcon,
      prefixIcon:prefixIcon,
      hintStyle: hintStyle,
      errorMaxLines: 3,
      contentPadding: contentPadding ?? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 2.0, right: 2.0),
      fillColor: fillColor,
      filled: true,
    ),
    validator: onValidate,
    onChanged: onChanged,
    textInputAction: TextInputAction.next,
    style: pickerStyle
  );
}

Widget CvsCommentField(
    {
      TextEditingController? Controller,
      String? Function(String?)? onValidate,
      void Function(String)? onChanged,
      String? hintText,
      FocusNode? focusNode,
      void Function()? onTap,
      Color? borderColor,
      TextStyle? hintStyle,
      Color? fillColor,
      TextStyle? pickerStyle,
      Widget? suffixIcon,
      Widget? prefixIcon,
      double? radius,
      EdgeInsetsGeometry? contentPadding,
      List<TextInputFormatter>? inputFormatters,
      AutovalidateMode? autovalidateMode
    }) {
  return Container(
    // height: 50,
    child: TextFormField(
      controller: Controller,
      textCapitalization: TextCapitalization.none,
      maxLines: 5,
      minLines: 3,
      focusNode: focusNode,
      keyboardType: TextInputType.multiline,
      autovalidateMode: autovalidateMode,
      validator: onValidate,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        hintText: hintText,
        hintStyle: hintStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? Colors.grey.shade200),
          borderRadius: BorderRadius.circular(radius ?? 10),
        ),
        fillColor: fillColor,
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon
      ),
      onChanged: onChanged,
      textInputAction: TextInputAction.next,
      style: pickerStyle,
    ),
  );
}