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

  String? password;
  String? email;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool showRequiredError = false;
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'this field is required';
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters';
              }
              return null;
            },
            onFieldSubmitted: (value) {
              setState(() {
                password = value;
              });
            },
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'this field is required';
              }
              if (value != password) {
                return 'Passwords do not match';
              }
              return null;
            },
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
          if (showRequiredError)
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "this field is required",
                    style: TextStyle(color: kThirdColor, fontSize: 14),
                  ),
                ),
              ],
            ),
          SizedBox(height: 10),
          AuthButton(
            text: "Sign Up",
            onTap: () {
              if (!_formKey.currentState!.validate()) {
                return;
              }

              if (!checkValue) {
                setState(() {
                  showRequiredError = true;
                });
                return;
              }
              setState(() {
                showRequiredError = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Sign Up completed successfully")),
              );
              FocusScope.of(context).unfocus();
            },
          ),
        ],
      ),
    );
  }
}
