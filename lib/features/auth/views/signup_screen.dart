import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';
import 'package:vidhyasetu_app/core/config/app_theme.dart';
import 'package:vidhyasetu_app/core/widgets/custom_button.dart';
import 'package:vidhyasetu_app/core/widgets/custom_text_button.dart';
import 'package:vidhyasetu_app/core/widgets/custom_textfield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    // Define FocusNodes
    final FocusNode fullNameFocus = FocusNode();
    final FocusNode emailFocus = FocusNode();
    final FocusNode passwordFocus = FocusNode();
    final FocusNode confirmPasswordFocus = FocusNode();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppTheme.backgroundColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              size: 40,
              UniconsLine.angle_left,
              color: AppTheme.primaryColor,
            ),
            onPressed: () {
              context.go('/login');
            },
          ),
          title: Text(
            'Sign Up',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height -
                  MediaQuery.of(context).padding.top,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Join Vedhya Setu',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                  ),
                ),
                Text(
                  'Create an account to get started',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextfield(
                  controller: fullNameController,
                  icon: const Icon(UniconsLine.user),
                  labelText: "Full Name",
                  isObscure: false,
                  focusNode: fullNameFocus,
                ),
                CustomTextfield(
                  controller: emailController,
                  icon: const Icon(UniconsLine.envelope),
                  labelText: "Email",
                  isObscure: false,
                  focusNode: emailFocus,
                ),
                CustomTextfield(
                  controller: passwordController,
                  icon: const Icon(UniconsLine.lock),
                  labelText: "Password",
                  isObscure: true,
                  focusNode: passwordFocus,
                  trailingIcon: const Icon(UniconsLine.eye_slash),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: AppTheme.defaultPadding),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Password must be at least 8 characters long",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: AppTheme.secondaryTextColor,
                      ),
                    ),
                  ),
                ),
                CustomTextfield(
                  controller: confirmPasswordController,
                  icon: const Icon(UniconsLine.lock),
                  labelText: "Confirm Password",
                  isObscure: true,
                  focusNode: confirmPasswordFocus,
                  trailingIcon: const Icon(UniconsLine.eye_slash),
                ),
                const SizedBox(height: 20),
                CustomButton(buttonText: "Sign up"),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    const SizedBox(width: 15),
                    CustomTextButton(
                      buttonText: "Login",
                      onPressed: () => context.go('/login'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
