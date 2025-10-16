import 'package:cracked_notes/core/extensions/extensions.dart';
import 'package:cracked_notes/viewmodel/userdata_viewmodel.dart';
import 'package:cracked_notes/views/widgets/user_dashboard_widgets.dart';
import 'package:flutter/material.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {

  @override
  void initState() {
    super.initState();
    UserDataViewModel().callForInfo("manishraja2505");
  }


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
                UserDashboardWidgets.streakContainer(width, height, context),
                Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    spacing: 40,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Problems Solved",
                            style: context.headlineMedium,
                          ),
                          Spacer(),
                          Text("23"),
                        ],
                      ),
                      UserDashboardWidgets.radarChart(),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Recent Activity",
                          style: context.headlineMedium,
                        ),
                      ),

                      UserDashboardWidgets.recentActivity(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
