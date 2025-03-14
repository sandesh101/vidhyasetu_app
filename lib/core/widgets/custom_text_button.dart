import 'package:flutter/material.dart';
import 'package:vidhyasetu_app/core/config/app_theme.dart';

class CustomTextButton extends StatelessWidget {
  final String buttonText;
  final Function()? onPressed;
  final IconData? icon;
  final Color? color;
  final Color? textColor;
  const CustomTextButton({
    super.key,
    required this.buttonText,
    this.onPressed,
    this.icon,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        buttonText,
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
          color: textColor ?? AppTheme.secondaryTextColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
