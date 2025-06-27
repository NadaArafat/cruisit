import 'package:cruisit/features/authentication/data/view%20models/manager/auth_cubit.dart';
import 'package:cruisit/features/authentication/presentation/widgets/auth_button.dart';
import 'package:cruisit/features/authentication/presentation/widgets/my_text_field.dart';
import 'package:cruisit/features/authentication/presentation/widgets/show_snackbar.dart';
import 'package:cruisit/features/explore/presentation/views/explore_view.dart';
import 'package:cruisit/utils/constants.dart';
import 'package:cruisit/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpWithPasswordForm extends StatefulWidget {
  SignUpWithPasswordForm({super.key, required this.email});

  String email;

  @override
  State<SignUpWithPasswordForm> createState() => _SignUpWithPasswordFormState();
}

class _SignUpWithPasswordFormState extends State<SignUpWithPasswordForm> {
  bool checkValue = false;
  bool obscureText1 = true;
  bool obscureText2 = true;

  String? password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool showRequiredError = false;

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          MyTextField(
            hintText: "Enter e-mail address",
            icon: "assets/icons/email.png",
            initialValue: widget.email,
            onFieldSubmitted: (value) {
              setState(() {
                widget.email = value;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'this field is required';
              }
              if (!RegExp(
                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
              ).hasMatch(value)) {
                return 'Please enter a valid email address.\n ex: example@gmail.com';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          MyTextField(
            hintText: "Create a password",
            icon: "assets/icons/lock.png",
            obscureText: obscureText1,
            suffixIconButton: IconButton(
              icon: Icon(Icons.remove_red_eye_outlined, color: Colors.grey),
              onPressed: () {
                setState(() {
                  obscureText1 = !obscureText1;
                });
              },
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'this field is required';
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters';
              }
              return null;
            },
            onFieldSubmitted: (value) {
              setState(() {
                password = value;
              });
            },
          ),
          SizedBox(height: 20),
          MyTextField(
            hintText: "Repeat password",
            icon: "assets/icons/lock.png",
            obscureText: obscureText2,
            suffixIconButton: IconButton(
              icon: Icon(Icons.remove_red_eye_outlined, color: Colors.grey),
              onPressed: () {
                setState(() {
                  obscureText2 = !obscureText2;
                });
              },
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'this field is required';
              }
              if (value != password) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                checkColor: Colors.white,
                fillColor:
                    checkValue
                        ? WidgetStateProperty.all(kAuthPrimaryColor)
                        : WidgetStateProperty.all(Colors.white),
                value: checkValue,
                onChanged: (value) {
                  setState(() {
                    checkValue = !checkValue;
                  });
                },
              ),
              Text(
                "I have read the ",
                style: Styles.pageTitle.copyWith(fontSize: 14),
              ),
              Text(
                "Terms of Service",
                style: Styles.pageTitle.copyWith(
                  fontSize: 14,
                  color: kAuthPrimaryColor,
                ),
              ),
            ],
          ),
          if (showRequiredError)
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "this field is required",
                    style: TextStyle(color: kThirdColor, fontSize: 14),
                  ),
                ),
              ],
            ),
          SizedBox(height: 10),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is SignUpSuccess) {
                showSnackbar(
                  context: context,
                  message: "Sign Up completed successfully",
                );
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ExploreView()),
                  (route) => false,
                );
              } else if (state is SignUpError) {
                if (state.message == 'email-already-in-use') {
                  showSnackbar(
                    context: context,
                    message: "This email is already registered",
                  );
                } else if (state.message == 'weak-password') {
                  showSnackbar(context: context, message: "Weak password");
                } else {
                  showSnackbar(
                    context: context,
                    message: "Something went wrong, please try again.",
                  );
                }
              }
              isLoading = state is SignUpLoading;
            },
            builder: (context, state) {
              return AuthButton(
                isLoading: isLoading,
                text: "Sign Up",
                onTap: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  if (!checkValue) {
                    setState(() {
                      showRequiredError = true;
                    });
                    return;
                  }
                  setState(() {
                    showRequiredError = false;
                  });
                  await BlocProvider.of<AuthCubit>(context).signUpWithPassword(
                    email: widget.email,
                    password: password!,
                  );
                  FocusScope.of(context).unfocus();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
