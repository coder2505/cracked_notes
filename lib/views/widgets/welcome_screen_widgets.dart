import 'package:cracked_notes/core/extensions/extensions.dart';
import 'package:cracked_notes/viewmodel/clicknav.dart';
import 'package:flutter/material.dart';

class WelcomeScreenWidgets {
  static Widget upperContainerLottieFile(double height) {
    return Container(
      height: height * 0.6,
      decoration: BoxDecoration(border: BoxBorder.all(color: Colors.redAccent)),
    );
  }

  static Widget bottomContainer(BuildContext context) {
    double width = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Welcome To Cracked Notes",
          style: context.headlineLarge,
          textAlign: TextAlign.center,
        ),
        Text(
          "Dummy Welcome Screen",
          textAlign: TextAlign.center,
          style: context.bodyLarge,
        ),
        ElevatedButton(
          onPressed: () {
            ClickNav.clickGetStarted(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: context.primary,
            minimumSize: Size(width * 0.8, 60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text("Get Started", style: context.bodyMedium),
        ),
      ],
    );
  }
}
