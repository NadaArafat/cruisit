import 'package:cruisit/features/authentication/views/sign_up_with_password_view.dart';
import 'package:cruisit/features/authentication/views/widgets/auth_button.dart';
import 'package:cruisit/features/authentication/views/widgets/my_text_field.dart';
import 'package:cruisit/features/authentication/views/widgets/third_party_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

String? email;
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          MyTextField(
            hintText: 'Enter e-mail address',
            icon: 'assets/icons/email.png',
            onFieldSubmitted: (value) {
              email = value;
              setState(() {});
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email address';
              }
              if (!RegExp(
                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
              ).hasMatch(value)) {
                return 'Please enter a valid email address, ex: example@gmail.com';
              }
              return null;
            },
            initialValue: email,
          ),
          SizedBox(height: 30),
          AuthButton(
            text: "Continue",
            onTap: () {
              if (_formKey.currentState!.validate()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpWithPasswordView(email: email!),
                  ),
                );
                FocusScope.of(context).unfocus();
              }
            },
          ),
          SizedBox(height: 40),
          Row(
            children: [
              Expanded(child: Divider(color: Colors.grey.shade300)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Or continue with",
                  style: GoogleFonts.leagueSpartan(
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Expanded(child: Divider(color: Colors.grey.shade300)),
            ],
          ),
          SizedBox(height: 50),
          ThirdPartyAuthButton(
            color: Colors.white,
            textColor: Colors.black,
            image: "assets/icons/google.png",
            text: "Continue with Gmail",
          ),
          SizedBox(height: 35),
          ThirdPartyAuthButton(
            color: Color(0xff1F1F1F),
            textColor: Colors.white,
            image: "assets/icons/apple.png",
            text: "Continue with Apple",
          ),
          SizedBox(height: 35),
          ThirdPartyAuthButton(
            color: Color(0xff3B5896),
            textColor: Colors.white,
            image: "assets/icons/facebook.png",
            text: "Continue with Facebook",
          ),
        ],
      ),
    );
  }
}
