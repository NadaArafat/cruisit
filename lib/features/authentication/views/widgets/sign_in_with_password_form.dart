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

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          MyTextField(
            hintText: "Enter e-mail address",
            icon: "assets/icons/email.png",
            initialValue: widget.email,
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
          ),
          SizedBox(height: 30), //250),
          AuthButton(text: "Sign in", onTap: () {}),
        ],
      ),
    );
  }
}
