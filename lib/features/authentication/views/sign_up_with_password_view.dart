import 'package:cruisit/features/authentication/views/widgets/auth_app_bar.dart';
import 'package:cruisit/features/authentication/views/widgets/sign_up_with_password_form.dart';
import 'package:cruisit/utils/constants.dart';
import 'package:cruisit/utils/styles.dart';
import 'package:flutter/material.dart';

class SignUpWithPasswordView extends StatefulWidget {
  const SignUpWithPasswordView({super.key, required this.email});

  final String email;

  @override
  State<SignUpWithPasswordView> createState() => _SignUpWithPasswordViewState();
}

class _SignUpWithPasswordViewState extends State<SignUpWithPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AuthAppBar(),
      backgroundColor: kOffWhite,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 50),
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
            SignUpWithPasswordForm(email: widget.email),
          ],
        ),
      ),
    );
  }
}
