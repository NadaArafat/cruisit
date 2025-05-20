import 'package:cruisit/features/authentication/views/widgets/third_party_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/styles.dart';
import 'my_text_field.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          MyTextField(),
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
