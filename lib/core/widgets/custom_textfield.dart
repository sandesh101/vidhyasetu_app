import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vidhyasetu_app/core/config/app_theme.dart';

class CustomTextfield extends StatelessWidget {
  final TextInputType? textInputType;
  final TextEditingController controller;
  final Icon icon;
  final String labelText;
  final bool isObscure;
  final String? Function(String?)? validator;
  final int? maxLines;
  final Function(String)? onChanged;
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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      child: TextFormField(
        onChanged: onChanged,
        keyboardType: textInputType ?? TextInputType.text,
        maxLines: maxLines ?? 1,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: isObscure,
        controller: controller,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide(color: AppTheme.primaryColor),
          ),
          prefixIcon: icon,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
          // hintText: "Email",
          label: Text(
            labelText,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
