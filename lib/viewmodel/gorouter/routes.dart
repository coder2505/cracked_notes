import 'package:cracked_notes/views/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../views/screens/home_screen.dart';

class Routes{

  final BuildContext context;

  Routes({required this.context});

  final GoRouter router = GoRouter(

    initialLocation: '/home',

    routes: <RouteBase>[
      GoRoute(
        path: '/welcomeScreen',
        builder: (BuildContext context, GoRouterState state) {
          return const WelcomeScreen();
        },
      ),
      GoRoute(
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
    ],
  );


}