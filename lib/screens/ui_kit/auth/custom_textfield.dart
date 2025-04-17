import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    Key? key,
    required this.controller,
    this.prefixIconActive = false,
    this.autofocus = true,
    this.enabled = true,
    this.obscureText = false,
    this.textStyle,
    this.hintStyle,
    this.validator,
    this.errorText,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),
    this.hint,
    this.color,
    this.suffixIcon,
    this.inputFormatters,
    this.maxLength = 255,
    this.keyboardType = TextInputType.text,
    this.prefixIconColor,
    this.textFieldBorderRadius = 10,
    this.maxLines = 1,
    this.decoration = const InputDecoration(),
    this.textFieldBorderSide =
        const BorderSide(width: 0, style: BorderStyle.none),
  }) : super(key: key);
  final bool enabled;
  final bool autofocus;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextEditingController controller;
  final Color? color;
  final EdgeInsets? contentPadding;
  final String? hint;
  final int maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final bool prefixIconActive;
  final bool obscureText;
  final Color? prefixIconColor;
  final double textFieldBorderRadius;
  final BorderSide textFieldBorderSide;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final String? errorText;
  final int? maxLines;
  final InputDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      autofocus: autofocus,
      cursorWidth: 1.5,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      autocorrect: false,
      textAlignVertical: TextAlignVertical.bottom,
      maxLines: maxLines,
      minLines: 1,
      maxLength: maxLength,
      decoration: InputDecoration(
        errorText: errorText,
        prefixIcon: prefixIconActive
            ? const AnimatedSwitcher(
                duration: Duration(
                  milliseconds: 1000,
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(Icons.phone_enabled),
                ),
              )
            : null,
        prefixIconColor: prefixIconColor,
        fillColor: color,
        counterText: '',
        alignLabelWithHint: true,
        filled: true,
        isDense: false,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: contentPadding,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 0,
          minHeight: 0,
        ),
        suffixIcon: suffixIcon,
        hintText: hint,
        hintStyle: hintStyle,
        enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(textFieldBorderRadius)),
            borderSide: textFieldBorderSide),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(textFieldBorderRadius)),
          borderSide: textFieldBorderSide,
        ),
      ),
    );
  }
}
