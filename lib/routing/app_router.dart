import 'package:go_router/go_router.dart';
import 'package:vidhyasetu_app/features/auth/views/login_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: "/login",
  routes: [GoRoute(path: "/login", builder: (context, state) => LoginScreen())],
);
