import 'package:flutter/material.dart';
import 'package:vidhyasetu_app/core/config/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function()? onPressed;
  final IconData? icon;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final double? width;
  final double? height;
  const CustomButton({
    super.key,
    required this.buttonText,
    this.onPressed,
    this.icon,
    this.color,
    this.textColor,
    this.width,
    this.height,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        child: Container(
          width: width ?? double.infinity,
          height: height ?? 50,
          decoration: BoxDecoration(
            color: color ?? AppTheme.primaryColor,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: AppTheme.primaryColor, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null
                  ? Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      icon,
                      color: textColor ?? AppTheme.backgroundColor,
                      size: 16,
                    ),
                  )
                  : Container(),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  buttonText,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: textColor ?? AppTheme.backgroundColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
