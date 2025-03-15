import 'package:flutter/material.dart';
import 'package:vidhyasetu_app/core/config/app_theme.dart';

class CustomTextfield extends StatelessWidget {
  final TextInputType? textInputType;
  final TextEditingController controller;
  final Icon icon;
  final Icon? trailingIcon;
  final String labelText;
  final Color? labelColor;
  final Color? borderColor;
  final bool isObscure;
  final String? Function(String?)? validator;
  final int? maxLines;
  final Function(String)? onChanged;
  final FocusNode? focusNode;

  const CustomTextfield({
    super.key,
    required this.controller,
    this.textInputType,
    required this.icon,
    required this.labelText,
    required this.isObscure,
    this.validator,
    this.maxLines,
    this.onChanged,
    this.focusNode,
    this.trailingIcon,
    this.labelColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      child: TextFormField(
        focusNode: focusNode, // Assigning the FocusNode
        onChanged: onChanged,
        keyboardType: textInputType ?? TextInputType.text,
        maxLines: maxLines ?? 1,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: isObscure,
        controller: controller,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide(color: borderColor ?? AppTheme.primaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide(
              color: borderColor ?? AppTheme.primaryColor,
            ), // Red color
          ),
          prefixIcon: icon,
          suffixIcon: trailingIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: borderColor ?? AppTheme.primaryColor),
          ),
          label: Text(
            labelText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: labelColor ?? AppTheme.primaryColor,
            ),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
