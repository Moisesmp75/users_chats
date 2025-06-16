import 'package:go_router/go_router.dart';
import 'package:users_app/models/user.dart';
import 'package:users_app/screens/home_screen.dart';
import 'package:users_app/screens/user_detail.dart';

final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen()
    ),
    GoRoute(
      path: '/chat',
      builder: (context, state) {
        final user = state.extra as User;
        return UserDetail(user: user);
      }
    ),
  ]
);