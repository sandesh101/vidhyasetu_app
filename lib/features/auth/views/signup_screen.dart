import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';
import 'package:vidhyasetu_app/core/config/app_theme.dart';
import 'package:vidhyasetu_app/core/utils/app_snackbar.dart';
import 'package:vidhyasetu_app/core/widgets/custom_button.dart';
import 'package:vidhyasetu_app/core/widgets/custom_text_button.dart';
import 'package:vidhyasetu_app/core/widgets/custom_textfield.dart';
import 'package:vidhyasetu_app/features/auth/data/providers/auth_provider.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingController emailController = TextEditingController(
    text: "test@gmail.com",
  );
  final TextEditingController fullNameController = TextEditingController(
    text: "Test User",
  );
  final TextEditingController passwordController = TextEditingController(
    text: "password",
  );
  final TextEditingController confirmPasswordController = TextEditingController(
    text: "password",
  );
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

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
                  // focusNode: fullNameFocus,
                ),
                CustomTextfield(
                  controller: emailController,
                  icon: const Icon(UniconsLine.envelope),
                  labelText: "Email",
                  isObscure: false,
                  // focusNode: emailFocus,
                ),
                CustomTextfield(
                  controller: passwordController,
                  icon: const Icon(UniconsLine.lock),
                  labelText: "Password",
                  isObscure: true,
                  // focusNode: passwordFocus,
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
                  // focusNode: confirmPasswordFocus,
                  trailingIcon: const Icon(UniconsLine.eye_slash),
                ),
                const SizedBox(height: 20),
                authState.when(
                  data: (data) {
                    return CustomButton(
                      buttonText: "Sign up",
                      onPressed: () {
                        ref
                            .read(authProvider.notifier)
                            .register(
                              fullNameController.text,
                              emailController.text,
                              passwordController.text,
                            );
                      },
                    );
                  },
                  error: (error, stack) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      AppSnackbar.show(
                        context,
                        message: error.toString(),
                        type: SnackBarType.error,
                      );
                    });
                    return CustomButton(
                      buttonText: 'Sign Up',
                      onPressed: () {
                        ref
                            .read(authProvider.notifier)
                            .register(
                              fullNameController.text,
                              emailController.text,
                              passwordController.text,
                            );
                      },
                    );
                    // return ScaffoldMessenger.of(
                    //   context,
                    // ).showSnackBar(SnackBar(content: Text("$error")));
                    // return Text("Error: $error");
                  },
                  loading: () {
                    return const CircularProgressIndicator();
                  },
                ),
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
