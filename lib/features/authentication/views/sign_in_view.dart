import 'package:cruisit/features/authentication/views/forgot_password_view.dart';
import 'package:cruisit/features/authentication/views/widgets/auth_app_bar.dart';
import 'package:cruisit/features/authentication/views/widgets/sign_in_form.dart';
import 'package:cruisit/utils/constants.dart';
import 'package:cruisit/utils/styles.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AuthAppBar(),
      backgroundColor: kOffWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(child: SizedBox(height: 70)),
            Text(
              'Sign In',
              style: Styles.subTitleMedium.copyWith(
                color: kAuthPrimaryColor,
                fontSize: 32,
              ),
            ),
            Flexible(child: SizedBox(height: 30)),
            SignInForm(),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPasswordView(),
                  ),
                );
              },
              child: Center(
                child: Text(
                  "Forgot your password?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
