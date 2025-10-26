import 'package:cracked_notes/core/extensions/extensions.dart';
import 'package:cracked_notes/utils/datacleaning_user.dart';
import 'package:cracked_notes/viewmodel/user_provider.dart';
import 'package:cracked_notes/views/widgets/user_dashboard_widgets.dart';
import 'package:cracked_notes/views/widgets/userstats_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserDashboard extends ConsumerStatefulWidget {
  const UserDashboard({super.key});

  @override
  ConsumerState<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends ConsumerState<UserDashboard> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      ref.read(userProvider.notifier).fetchUserData("manishraja2505");
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final user = ref.watch(userProvider);

    return Scaffold(
      body: SafeArea(
        child: user.when(
          data: (data) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 20,
                  children: [
                    UserDashboardWidgets.topRow(data.name),
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
                              Text(data.solved["solvedProblem"].toString()),
                            ],
                          ),
                          UserDashboardWidgets.radarChart(DataCleaningUser.sortProblemCounts(data.skillStats)),

                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Recent Activity",
                              style: context.headlineMedium,
                            ),
                          ),

                          UserstatsScreenWidgets.recentAllActivity(data.submissions),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          error: (e, st) {
            return Center(child: Text("error"));
          },
          loading: () {
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
