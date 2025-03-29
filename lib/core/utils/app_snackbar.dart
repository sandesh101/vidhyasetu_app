import 'package:flutter/material.dart';
import 'package:vidhyasetu_app/core/config/app_theme.dart';

class AppSnackbar {
  static show(
    BuildContext context, {
    required String message,
    required SnackBarType type,
  }) {
    Color backgroundColor =
        type == SnackBarType.error
            ? AppTheme.errorColor
            : AppTheme.successColor;
    final cleanedMessage = message.replaceAll('Exception:', '').trim();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
        content: Text(cleanedMessage, style: TextStyle(color: Colors.white)),
        backgroundColor: backgroundColor,
        duration: Duration(seconds: 2),
      ),
    );
  }
}

enum SnackBarType { error, success }
