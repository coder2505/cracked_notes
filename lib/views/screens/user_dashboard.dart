import 'package:cracked_notes/views/widgets/user_dashboard_widgets.dart';
import 'package:flutter/material.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 20,
              children: [
                UserDashboardWidgets.topRow(),
                UserDashboardWidgets.streakContainer(width,height, context),

                Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding:const EdgeInsets.all(20.0) ,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Problems Solved"),

                          Spacer(),
                          Text("23")

                        ],
                      )
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
