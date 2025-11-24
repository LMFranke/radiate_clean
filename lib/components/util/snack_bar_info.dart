import 'package:flutter/material.dart';

class SnackBarInfo {

  SnackBarInfo({
    required String text,
    required BuildContext context,
    required Color textColor,
    required Color backgroundColor,
  }) {
    _snackBarInfo(text, context, textColor, backgroundColor);
  }

  void _snackBarInfo(String text, BuildContext context, Color textColor, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
          ),
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
    );
  }
}
