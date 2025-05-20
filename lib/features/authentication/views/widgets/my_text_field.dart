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
  });

  final String hintText;
  final String icon;
  final Function(String)? onFieldSubmitted;
  final String? initialValue;
  final bool obscureText;
  final IconButton? suffixIconButton;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onFieldSubmitted,
      initialValue: initialValue,
      obscureText: obscureText,
      decoration: InputDecoration(
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
        suffixIcon: suffixIconButton,
      ),
    );
  }
}
