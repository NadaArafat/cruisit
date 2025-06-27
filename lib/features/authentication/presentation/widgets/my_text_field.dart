import 'package:cruisit/utils/constants.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.onFieldSubmitted,
    this.initialValue,
    this.obscureText = false,
    this.suffixIconButton,
    this.validator,
  });

  final String hintText;
  final String icon;
  final Function(String)? onFieldSubmitted;
  final String? initialValue;
  final bool obscureText;
  final IconButton? suffixIconButton;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onFieldSubmitted,
      initialValue: initialValue,
      obscureText: obscureText,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: kThirdColor, fontSize: 14),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Image.asset(icon, color: Colors.grey),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
          borderRadius: BorderRadius.circular(14),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kAuthPrimaryColor, width: 2),
          borderRadius: BorderRadius.circular(14),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kAuthPrimaryColor, width: 2),
          borderRadius: BorderRadius.circular(14),
        ),
        suffixIcon: suffixIconButton,
      ),
    );
  }
}
