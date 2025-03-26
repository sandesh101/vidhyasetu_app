import 'package:go_router/go_router.dart';
import 'package:vidhyasetu_app/features/auth/views/login_screen.dart';
import 'package:vidhyasetu_app/features/auth/views/signup_screen.dart';
import 'package:vidhyasetu_app/features/home/views/home_page.dart';
import 'package:vidhyasetu_app/features/main_page.dart';
import 'package:vidhyasetu_app/features/profile/views/profile_setting_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: "/login",
  routes: [
    GoRoute(path: "/login", builder: (context, state) => LoginScreen()),
    GoRoute(path: '/signup', builder: (context, state) => SignUpScreen()),
    GoRoute(path: '/home', builder: (context, state) => HomePage()),
    GoRoute(path: '/main', builder: (context, state) => MainPages()),
    GoRoute(
      path: '/profileSetting',
      builder: (context, state) => ProfileSettingScreen(),
    ),
  ],
);
