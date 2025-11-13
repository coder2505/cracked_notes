import 'package:cracked_notes/core/theme/app_colors.dart';
import 'package:cracked_notes/views/screens/achievements_screen.dart';
import 'package:cracked_notes/views/screens/user_homescreen.dart';
import 'package:cracked_notes/views/screens/user_stats_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../viewmodel/user_provider.dart';

class NavBarHolder extends ConsumerStatefulWidget {
  const NavBarHolder({super.key});

  @override
  ConsumerState<NavBarHolder> createState() => _NavBarHolderState();
}

class _NavBarHolderState extends ConsumerState<NavBarHolder> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(userProvider.notifier).fetchUserData("purpleCrayon");
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);

    return Material(
      child: user.when(
        data: (data) {
          return PersistentTabView(
            tabs: [
              PersistentTabConfig(
                screen: UserHomescreen(user: data),
                item: ItemConfig(icon: Icon(Icons.home), title: "Home"),
              ),
              PersistentTabConfig(
                screen: UserStatsScreen(userModel: data),
                item: ItemConfig(icon: Icon(Icons.person), title: "User"),
              ),
              PersistentTabConfig(
                screen: AchievementsScreen(user: data,),
                item: ItemConfig(
                  icon: Icon(Icons.star),
                  title: "Achievements",
                ),
              ),
            ],
            navBarBuilder: (navBarConfig) => Style1BottomNavBar(
              navBarConfig: navBarConfig,
              navBarDecoration: NavBarDecoration(
                color: AppColors.background_black,
              ),
            ),
          );
        },
        error: (e, st) {
          print("ERROR WHILE FETCHING $e");
          return Scaffold(body: Center(child: Text("error")));
        },
        loading: () =>
            Scaffold(body: Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
