import 'package:cruisit/features/authentication/presentation/views/sign_up_view.dart';
import 'package:cruisit/features/authentication/presentation/widgets/sign_in_form.dart';
import 'package:cruisit/utils/constants.dart';
import 'package:cruisit/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kOffWhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Text(
                'Sign In',
                style: Styles.subTitleMedium.copyWith(
                  color: kAuthPrimaryColor,
                  fontSize: 32,
                ),
              ),
              SizedBox(height: 30),
              SignInForm(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have account?  ",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpView(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: Styles.subTitleMedium.copyWith(
                        color: kAuthPrimaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
