import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.labelText,
    this.onChanged,
    this.obSecuredText = false,
    this.suffixIcon,
    this.hint,
    this.prefixIcon,
    this.validator,
    this.onSaved,
    this.textDirection = TextDirection.rtl,
  });

  bool? obSecuredText;

  String? labelText;

  String? hint;

  Function(String)? onChanged;
  void Function(String?)? onSaved;
  Widget? suffixIcon;
  Widget? prefixIcon;
  String? Function(String?)? validator;
  TextDirection? textDirection;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obSecuredText!,
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        fillColor: const Color(0xffFAFAF9),
        filled: true,
        labelText: labelText,
        labelStyle: const TextStyle(color: Color(0xffF9FAFA)),
        hintText: hint,
        hintTextDirection: TextDirection.rtl,
        border: customOutinedBorder(color: Colors.black12),
        enabledBorder: customOutinedBorder(color: Colors.black12),
        focusedBorder: customOutinedBorder(color: Colors.black12),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      cursorColor: Colors.white,
      textDirection: textDirection,
    );
  }

  OutlineInputBorder customOutinedBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: color),
    );
  }
}
