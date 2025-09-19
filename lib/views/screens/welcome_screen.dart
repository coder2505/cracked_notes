import 'package:flutter/material.dart';

import '../widgets/welcome_screen_widgets.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: WelcomeScreenWidgets.upperContainerLottieFile(height)),
              Expanded(
                  flex: 2,
                  child: WelcomeScreenWidgets.bottomContainer(context)),
            ],
          ),
        ),
      ),
    );
  }
}
