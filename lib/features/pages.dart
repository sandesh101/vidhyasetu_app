import 'package:flutter/material.dart';
import 'package:vidhyasetu_app/features/auth/views/login_screen.dart';
import 'package:vidhyasetu_app/features/auth/views/signup_screen.dart';
import 'package:vidhyasetu_app/features/home/views/home_page.dart';

class Pages {
  static const List<Widget> pagesList = [
    HomePage(),
    LoginScreen(),
    SignUpScreen(),
    SignUpScreen(),
    SignUpScreen(),
  ];
}
