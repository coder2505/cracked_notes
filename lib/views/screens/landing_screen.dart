import 'dart:math' as math;

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cracked_notes/core/theme/app_colors.dart';
import 'package:cracked_notes/views/screens/entername_screen.dart';
import 'package:cracked_notes/views/widgets/landing_screen_widgets/custom_circles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation, drawAnimation;
  late AnimationController controller, drawController;

  double opacity = 0;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 30),
      vsync: this,
    );
    drawController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    animation = Tween<double>(begin: 0, end: math.pi * 2).animate(controller);

    drawAnimation = Tween<double>(begin: 0, end: 1).animate(drawController);

    controller.repeat();
    drawController.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    drawController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    // circle takes 3 seconds
    // text takes 2.8 seconds

    return Scaffold(
      backgroundColor: AppColors.secondary_black_outline,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: SizedBox(
              width: width,
              height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedBuilder(
                          animation: animation,
                          builder: (BuildContext context, Widget? child) {
                            return SizedBox(
                              child: CustomPaint(
                                painter: customCircles(
                                  rotationDegrees: animation.value,
                                  progress: drawAnimation.value,
                                ),
                                willChange: true,
                                isComplex: true,
                                size: Size(width, height * 0.3),
                              ),
                            );
                          },
                        ),
                        FutureBuilder(
                          future: Future.delayed(Duration(seconds: 3)),
                          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(child: SizedBox()),
                                      AnimatedTextKit(
                                        animatedTexts: [
                                          TypewriterAnimatedText(
                                            'Show Up Daily,',
                                            textStyle: TextStyle(
                                              color: AppColors.faded_yellow,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w800,
                                              fontSize: 40,
                                            ),
                                            speed: Duration(milliseconds: 100),
                                          ),
                                        ],
                                        totalRepeatCount: 1,
                                        pause: Duration(milliseconds: 0),
                                      ),
                                      Expanded(child: SizedBox()),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(child: SizedBox()),
                                      FutureBuilder(
                                        future: Future.delayed(
                                          Duration(milliseconds: 2000),
                                        ),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.done) {
                                            return AnimatedTextKit(
                                              animatedTexts: [
                                                TyperAnimatedText(
                                                  'Ship ',
                                                  textStyle: TextStyle(
                                                    color:
                                                        AppColors.faded_yellow,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 40,
                                                  ),
                                                  speed: Duration(
                                                    milliseconds: 100,
                                                  ),
                                                ),
                                              ],
                                              totalRepeatCount: 1,
                                              pause: Duration(milliseconds: 0),
                                            );
                                          }
                                          return SizedBox.shrink();
                                        },
                                      ),
                                      // "Progress." starts after "Show Up Daily," + "Ship " completes
                                      // 2000ms + (5 characters * 100ms) = 2500ms delay
                                      FutureBuilder(
                                        future: Future.delayed(
                                          Duration(milliseconds: 2500),
                                        ),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.done) {
                                            return AnimatedTextKit(
                                              animatedTexts: [
                                                TypewriterAnimatedText(
                                                  'Progress.',
                                                  textStyle: TextStyle(
                                                    color: AppColors
                                                        .app_highest_blue_github,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 40,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                                  speed: Duration(
                                                    milliseconds: 100,
                                                  ),
                                                ),
                                                TypewriterAnimatedText(
                                                  'Growth.',
                                                  textStyle: TextStyle(
                                                    color: AppColors
                                                        .app_highest_blue_github,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 40,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                                  speed: Duration(
                                                    milliseconds: 90,
                                                  ),
                                                ),
                                                TypewriterAnimatedText(
                                                  'Success.',
                                                  textStyle: TextStyle(
                                                    color: AppColors
                                                        .app_highest_blue_github,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 40,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                                  speed: Duration(
                                                    milliseconds: 90,
                                                  ),
                                                ),
                                              ],
                                              totalRepeatCount: 1,
                                              pause: Duration(milliseconds: 0),
                                            );
                                          }
                                          return SizedBox.shrink();
                                        },
                                      ),
                                      Expanded(child: SizedBox()),
                                    ],
                                  ),
                                ],
                              );
                            }

                            return SizedBox.shrink();
                          },
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: FutureBuilder(
                        future: Future.delayed(Duration(seconds: 10)),
                        builder:
                            (
                              BuildContext context,
                              AsyncSnapshot<dynamic> snapshot,
                            ) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return Container(
                                  height: 75,
                                  width: 75,
                                  decoration: BoxDecoration(
                                    color: Color(0x3d0071FF),
                                    border: BoxBorder.all(
                                      color: Color(0xff0071FF),
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      context.go("/enterNameScreen");
                                    },
                                    icon: Icon(Icons.arrow_forward_ios),
                                    color: Colors.white,
                                  ),
                                );
                              }
                              return SizedBox.shrink();
                            },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
