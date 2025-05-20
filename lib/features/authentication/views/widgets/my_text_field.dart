import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Image.asset("assets/icons/email.png", color: Colors.grey),
        ),
        hintText: "Enter e-mail address",
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
