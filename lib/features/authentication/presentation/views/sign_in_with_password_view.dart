import 'package:cruisit/features/authentication/presentation/views/forgot_password_view.dart';
import 'package:cruisit/features/authentication/presentation/widgets/auth_app_bar.dart';
import 'package:cruisit/features/authentication/presentation/widgets/sign_in_with_password_form.dart';
import 'package:cruisit/utils/constants.dart';
import 'package:cruisit/utils/styles.dart';
import 'package:flutter/material.dart';

class SignInWithPasswordView extends StatelessWidget {
  const SignInWithPasswordView({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AuthAppBar(),
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
              SignInWithPasswordForm(email: email),
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
      ),
    );
  }
}
