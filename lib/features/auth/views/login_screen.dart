import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:vidhyasetu_app/core/config/app_theme.dart';
import 'package:vidhyasetu_app/core/widgets/custom_button.dart';
import 'package:vidhyasetu_app/core/widgets/custom_text_button.dart';
import 'package:vidhyasetu_app/core/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: AppTheme.primaryColor,
        //   elevation: 0,
        //   title: Text(
        //     'Login',
        //     style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        //       fontSize: 24,
        //       fontWeight: FontWeight.w800,
        //       color: AppTheme.backgroundColor,
        //     ),
        //   ),
        // ),
        backgroundColor: AppTheme.backgroundColor,
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome Back!',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.primaryColor,
                ),
              ),
              Text(
                'Login to access your study material',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(fontSize: 18),
              ),
              SizedBox(height: 20),
              CustomTextfield(
                controller: emailController,
                icon: Icon(UniconsLine.envelope),
                labelText: 'Email',
                isObscure: false,
              ),
              CustomTextfield(
                controller: passwordController,
                icon: Icon(UniconsLine.lock),
                labelText: 'Password',
                isObscure: true,
              ),
              CustomButton(buttonText: "Login"),

              CustomTextButton(buttonText: 'Forgot Password'),
            ],
          ),
        ),
      ),
    );
  }
}
