import 'package:cruisit/features/authentication/data/view%20models/manager/auth_cubit.dart';
import 'package:cruisit/features/authentication/presentation/widgets/auth_button.dart';
import 'package:cruisit/features/authentication/presentation/widgets/my_text_field.dart';
import 'package:cruisit/features/authentication/presentation/widgets/show_snackbar.dart';
import 'package:cruisit/features/explore/presentation/views/explore_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInWithPasswordForm extends StatefulWidget {
  SignInWithPasswordForm({super.key, required this.email});

  String email;

  @override
  State<SignInWithPasswordForm> createState() => _SignInWithPasswordFormState();
}

class _SignInWithPasswordFormState extends State<SignInWithPasswordForm> {
  bool obscureText = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  String? password;

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
            hintText: "Enter password",
            icon: "assets/icons/lock.png",
            obscureText: obscureText,
            onFieldSubmitted: (value) {
              setState(() {
                password = value;
              });
            },
            suffixIconButton: IconButton(
              icon: Icon(Icons.remove_red_eye_outlined, color: Colors.grey),
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'this field is required';
              }
              return null;
            },
          ),
          SizedBox(height: 30), //250),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is SignInSuccess) {
                showSnackbar(
                  context: context,
                  message: "Sign In completed successfully",
                );
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ExploreView()),
                  (route) => false,
                );
              } else if (state is SignInError) {
                if (state.message == 'user-not-found' ||
                    state.message == 'wrong-password') {
                  showSnackbar(
                    context: context,
                    message: "Invalid email or password",
                  );
                } else {
                  // showSnackbar(
                  //   context: context,
                  //   message: "Something went wrong, please try again.",
                  // );
                }
              }
              isLoading = state is SignInLoading;
            },
            builder: (context, state) {
              return AuthButton(
                isLoading: isLoading,
                text: "Sign in",
                onTap: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  await BlocProvider.of<AuthCubit>(context).signInWithPassword(
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
