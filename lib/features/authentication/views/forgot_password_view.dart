import 'package:cruisit/utils/constants.dart';
import 'package:cruisit/utils/styles.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Column(
        children: [
          Flexible(child: SizedBox(height: 100)),
          Text(
            'Forgot Password',
            style: Styles.subTitleMedium.copyWith(
              color: kAuthPrimaryColor,
              fontSize: 32,
            ),
          ),
          Flexible(child: SizedBox(height: 30)),
        ],
      ),
    );
  }
}
