import 'package:cruisit/utils/constants.dart';
import 'package:cruisit/utils/styles.dart';
import 'package:flutter/material.dart';

showSnackbar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: Styles.pageTitle.copyWith(color: Colors.white),
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      width: MediaQuery.of(context).size.width * 0.8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      backgroundColor: kAuthPrimaryColor,
    ),
  );
}
