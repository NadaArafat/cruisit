import 'package:cruisit/features/authentication/views/forgot_password_view.dart';
import 'package:cruisit/features/authentication/views/sign_in_view.dart';
import 'package:cruisit/features/authentication/views/widgets/sign_in_form.dart';
import 'package:cruisit/utils/constants.dart';
import 'package:cruisit/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOffWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(child: SizedBox(height: 100)),
            Text(
              'Sign Up',
              style: Styles.subTitleMedium.copyWith(
                color: kAuthPrimaryColor,
                fontSize: 32,
              ),
            ),
            Flexible(child: SizedBox(height: 30)),
            SignInForm(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have account?  ",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInView(),
                      ),
                    );
                  },
                  child: Text(
                    "Login",
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
    );
  }
}
