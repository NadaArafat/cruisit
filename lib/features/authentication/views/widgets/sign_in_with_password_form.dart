import 'package:cruisit/features/authentication/views/widgets/auth_button.dart';
import 'package:cruisit/features/authentication/views/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class SignInWithPasswordForm extends StatefulWidget {
  const SignInWithPasswordForm({super.key, required this.email});

  final String email;

  @override
  State<SignInWithPasswordForm> createState() => _SignInWithPasswordFormState();
}

class _SignInWithPasswordFormState extends State<SignInWithPasswordForm> {
  bool obscureText = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          MyTextField(
            hintText: "Enter e-mail address",
            icon: "assets/icons/email.png",
            initialValue: widget.email,
            onFieldSubmitted: (value) {
              setState(() {
                email = value;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'this field is required';
              }
              if (!RegExp(
                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
              ).hasMatch(value)) {
                return 'Please enter a valid email address, ex: example@gmail.com';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          MyTextField(
            hintText: "Enter password",
            icon: "assets/icons/lock.png",
            obscureText: obscureText,
            suffixIconButton: IconButton(
              icon: Icon(Icons.remove_red_eye_outlined, color: Colors.grey),
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'this field is required';
              }
              return null;
            },
          ),
          SizedBox(height: 30), //250),
          AuthButton(
            text: "Sign in",
            onTap: () {
              if (!_formKey.currentState!.validate()) {
                return;
              }
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Sign in completed successfully")),
              );
              FocusScope.of(context).unfocus();
            },
          ),
        ],
      ),
    );
  }
}
