import 'package:cruisit/features/authentication/presentation/widgets/auth_app_bar.dart';
import 'package:cruisit/features/authentication/presentation/widgets/auth_button.dart';
import 'package:cruisit/features/authentication/presentation/widgets/my_text_field.dart';
import 'package:cruisit/utils/constants.dart';
import 'package:cruisit/utils/styles.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AuthAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Text(
                'Forgot Password?',
                style: Styles.subTitleMedium.copyWith(
                  color: kAuthPrimaryColor,
                  fontSize: 32,
                ),
              ),
              SizedBox(height: 24),
              Text(
                "Enter your email to recieve instructions\n to reset your password",
                style: Styles.pageTitle.copyWith(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 24),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    MyTextField(
                      hintText: "Enter email address",
                      icon: "assets/icons/email.png",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'this field is required';
                        }
                        if (!RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                        ).hasMatch(value)) {
                          return 'Please enter a valid email address.\nex: example@gmail.com';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30), //250),
                    AuthButton(
                      isLoading: false,
                      text: "Send me Now",
                      onTap: () {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("a mail has been sent to your email"),
                          ),
                        );
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
