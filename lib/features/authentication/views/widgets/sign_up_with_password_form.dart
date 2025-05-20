import 'package:cruisit/features/authentication/views/widgets/auth_button.dart';
import 'package:cruisit/features/authentication/views/widgets/my_text_field.dart';
import 'package:cruisit/utils/constants.dart';
import 'package:cruisit/utils/styles.dart';
import 'package:flutter/material.dart';

class SignUpWithPasswordForm extends StatefulWidget {
  const SignUpWithPasswordForm({super.key, required this.email});

  final String email;

  @override
  State<SignUpWithPasswordForm> createState() => _SignUpWithPasswordFormState();
}

class _SignUpWithPasswordFormState extends State<SignUpWithPasswordForm> {
  bool checkValue = false;
  bool obscureText1 = true;
  bool obscureText2 = true;

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
            hintText: "Create a password",
            icon: "assets/icons/lock.png",
            obscureText: obscureText1,
            suffixIconButton: IconButton(
              icon: Icon(Icons.remove_red_eye_outlined, color: Colors.grey),
              onPressed: () {
                setState(() {
                  obscureText1 = !obscureText1;
                });
              },
            ),
          ),
          SizedBox(height: 20),
          MyTextField(
            hintText: "Repeat password",
            icon: "assets/icons/lock.png",
            obscureText: obscureText2,
            suffixIconButton: IconButton(
              icon: Icon(Icons.remove_red_eye_outlined, color: Colors.grey),
              onPressed: () {
                setState(() {
                  obscureText2 = !obscureText2;
                });
              },
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                checkColor: Colors.white,
                fillColor:
                    checkValue
                        ? WidgetStateProperty.all(kAuthPrimaryColor)
                        : WidgetStateProperty.all(Colors.white),
                value: checkValue,
                onChanged: (value) {
                  setState(() {
                    checkValue = !checkValue;
                  });
                },
              ),
              Text(
                "I have read the ",
                style: Styles.pageTitle.copyWith(fontSize: 14),
              ),
              Text(
                "Terms of Service",
                style: Styles.pageTitle.copyWith(
                  fontSize: 14,
                  color: kAuthPrimaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 10), //250),

          AuthButton(text: "Sign Up", onTap: () {}),
        ],
      ),
    );
  }
}
