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

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController emailController = TextEditingController(
    text: "test@gmail.com",
  );
  final TextEditingController passwordController = TextEditingController(
    text: "Test@123",
  );
  final ScrollController _scrollController = ScrollController();

  // Focus Nodes
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  bool _errorShown = false;

  @override
  void initState() {
    super.initState();
    _emailFocus.addListener(_scrollToFocusedField);
    _passwordFocus.addListener(_scrollToFocusedField);
  }

  @override
  void dispose() {
    _emailFocus.removeListener(_scrollToFocusedField);
    _passwordFocus.removeListener(_scrollToFocusedField);
    _emailFocus.dispose();
    _passwordFocus.dispose();
    emailController.dispose();
    passwordController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // Function to scroll to the focused field
  void _scrollToFocusedField() {
    if (_emailFocus.hasFocus || _passwordFocus.hasFocus) {
      Future.delayed(Duration(milliseconds: 200), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent - 100,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              controller: _scrollController,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage('images/app_logo.png')),
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
                        focusNode: _emailFocus,
                      ),
                      CustomTextfield(
                        controller: passwordController,
                        icon: Icon(UniconsLine.lock),
                        labelText: 'Password',
                        isObscure: true,
                        trailingIcon: Icon(UniconsLine.eye_slash),
                        focusNode: _passwordFocus,
                      ),
                      authState.when(
                        data: (value) {
                          _errorShown = false;
                          return CustomButton(
                            buttonText: "Login",
                            onPressed: () {
                              ref
                                  .read(authProvider.notifier)
                                  .login(
                                    emailController.text,
                                    passwordController.text,
                                  );
                            },
                          );
                        },
                        loading: () {
                          return CircularProgressIndicator();
                        },
                        error: (error, stack) {
                          if (!_errorShown) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              AppSnackbar.show(
                                context,
                                message: error.toString(),
                                type: SnackBarType.error,
                              );
                            });
                            _errorShown = true;
                          }
                          return CustomButton(
                            buttonText: 'Login',
                            onPressed: () {
                              _errorShown = false;
                              ref
                                  .read(authProvider.notifier)
                                  .login(
                                    emailController.text,
                                    passwordController.text,
                                  );
                            },
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?"),
                          SizedBox(width: 15),
                          CustomTextButton(
                            buttonText: "Sign up",
                            onPressed: () => context.go('/signup'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
