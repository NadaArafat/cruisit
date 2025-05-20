import 'package:cruisit/features/authentication/views/widgets/auth_app_bar.dart';
import 'package:cruisit/features/authentication/views/widgets/auth_button.dart';
import 'package:cruisit/features/authentication/views/widgets/my_text_field.dart';
import 'package:cruisit/utils/constants.dart';
import 'package:cruisit/utils/styles.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(child: SizedBox(height: 100)),
            Text(
              'Forgot Password?',
              style: Styles.subTitleMedium.copyWith(
                color: kAuthPrimaryColor,
                fontSize: 32,
              ),
            ),
            Flexible(child: SizedBox(height: 24)),
            Text(
              "Enter your email to recieve instructions\n to reset your password",
              style: Styles.pageTitle.copyWith(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 24),
            MyTextField(),
            SizedBox(height: 30), //250),
            AuthButton(text: "Send me Now"),
          ],
        ),
      ),
    );
  }
}
