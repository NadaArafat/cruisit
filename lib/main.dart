import 'package:cruisit/features/authentication/views/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const CruisitApp());
}

class CruisitApp extends StatelessWidget {
  const CruisitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpView(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.light,
        textTheme: GoogleFonts.rubikTextTheme(),
      ),
    );
  }
}
