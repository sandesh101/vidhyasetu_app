import 'package:flutter/material.dart';
import 'package:vidhyasetu_app/core/config/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function()? onPressed;
  final IconData? icon;
  final Color? color;
  final Color? textColor;
  const CustomButton({
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: color ?? AppTheme.primaryColor,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Center(
            child: Text(
              buttonText,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: textColor ?? Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
