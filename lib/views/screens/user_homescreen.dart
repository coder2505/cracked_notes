import 'package:cracked_notes/core/theme/app_colors.dart';
import 'package:cracked_notes/utils/timer_circles.dart';
import 'package:flutter/material.dart';

class UserHomescreen extends StatefulWidget {
  const UserHomescreen({super.key});

  @override
  State<UserHomescreen> createState() => _UserHomescreenState();
}

class _UserHomescreenState extends State<UserHomescreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.green_counter,
                  border: BoxBorder.all(color: AppColors.green_trans_counter),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                height: height * 0.12,
                width: width,

                child: Row(
                  spacing: 10,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: 100,
                          child: CustomPaint(
                            painter: TimerCircles(),
                            size: Size(200, 300),
                          ),
                        ),
                        Positioned(
                            left: 38,
                            top: 20,
                            child: Text("23\n58", style: TextStyle(fontSize: 22),)),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        
                        Text("The Countdown has begun."),
                        Text("Can you finish a problem before it ends?")
                        
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
