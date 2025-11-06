import 'package:cracked_notes/core/theme/app_colors.dart';
import 'package:cracked_notes/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodel/ui_stateproviders.dart';
import '../widgets/user_stats_screen_widgets/userstats_screen_widgets.dart';

class RecentActivityScreen extends ConsumerStatefulWidget {
  const RecentActivityScreen(this.userModel, {super.key});

  final UserModel userModel;

  @override
  ConsumerState<RecentActivityScreen> createState() => _RecentActivityScreenState();
}

class _RecentActivityScreenState extends ConsumerState<RecentActivityScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_black,
      appBar: AppBar(
        backgroundColor: AppColors.background_black,
        iconTheme: IconThemeData(color: AppColors.faded_yellow),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                UserstatsScreenWidgets.buttonRow(ref),
            
                ref.read(clickedonAllSubmissions)
                    ? UserstatsScreenWidgets.recentAllActivity(
                        widget.userModel.submissions,true
                      )
                    : UserstatsScreenWidgets.recentAcActivity(
                        widget.userModel.acSubmissions,true
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
