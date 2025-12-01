import 'package:cracked_notes/views/screens/entername_screen.dart';
import 'package:cracked_notes/views/screens/landing_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../views/screens/nav_bar_holder.dart';

class Routes{

  final BuildContext context;
  final bool hasloggedin;
  final String username;

  Routes({required this.context, required this.hasloggedin,required this.username, });


  late final GoRouter router = GoRouter(

    redirect: (BuildContext context, GoRouterState state){
      print(hasloggedin);
      print(username);
      if(hasloggedin && username.isNotEmpty){
        return '/home';
      }

      return null;
    },

    initialLocation: '/welcomeScreen',

    routes: <RouteBase>[
      GoRoute(
        path: '/welcomeScreen',
        builder: (BuildContext context, GoRouterState state) {
          return LandingScreen();
        },
      ),
      GoRoute(
        path: '/enterNameScreen',
        builder: (BuildContext context, GoRouterState state) {
          return EnternameScreen();
        },
      ),
      GoRoute(
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return NavBarHolder();
        },
      ),
    ],
  );


}