import 'package:cracked_notes/viewmodel/gorouter/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model/shared_prefs.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  bool isLogged = await UserPrefs.getLoginStatus();
  String name = await UserPrefs.getUsername();

  runApp(ProviderScope(child: MyApp(hasloggedin: isLogged, username: name)));
}

class MyApp extends StatelessWidget {

  final bool hasloggedin;
  final String username;

  const MyApp({super.key, required this.hasloggedin, required this.username});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: Routes(context: context, hasloggedin:hasloggedin, username: username).router, debugShowCheckedModeBanner: false,);
  }
}
