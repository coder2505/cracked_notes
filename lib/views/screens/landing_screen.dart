import 'package:cracked_notes/core/theme/app_colors.dart';
import 'package:cracked_notes/views/widgets/landing_screen_widgets/custom_circles.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;


    return Scaffold(
      backgroundColor: AppColors.secondary_black_outline,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Stack(
            children: [

              Center(
                child: SizedBox(
                  child: CustomPaint(
                  painter : customCircles(),
                    size: Size(width, height *0.3),
                  ),
                ),
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: AppColors.faded_yellow,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                      fontSize: 40,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: "Show Up Daily,\nShip "),
                      TextSpan(
                        text: "Progress.",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: AppColors.app_highest_blue_github,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
