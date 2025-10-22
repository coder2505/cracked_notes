import 'package:cracked_notes/core/theme/app_colors.dart';
import 'package:cracked_notes/views/screens/challenges_screen.dart';
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
      ref.read(userProvider.notifier).fetchUserData("manishraja2505");
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);


    // design format
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: UserStatsScreen(),
          // screen: UserHomescreen(user: data),
          item: ItemConfig(icon: Icon(Icons.home), title: "Home"),
        ),
        PersistentTabConfig(
          screen: UserStatsScreen(),
          item: ItemConfig(icon: Icon(Icons.person), title: "User"),
        ),
        PersistentTabConfig(
          screen: ChallengesScreen(),
          item: ItemConfig(
            icon: Icon(Icons.military_tech),
            title: "Challenges",
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(color: AppColors.background_black),
      ),
    );

    // COMMENTING OUT FOR DESIGN CHANGES
    // return Material(
    //   child: user.when(
    //     data: (data) {
    //       return PersistentTabView(
    //         tabs: [
    //           PersistentTabConfig(
    //             screen: UserStatsScreen(),
    //             // screen: UserHomescreen(user: data),
    //             item: ItemConfig(icon: Icon(Icons.home), title: "Home"),
    //           ),
    //           PersistentTabConfig(
    //             screen: UserStatsScreen(),
    //             item: ItemConfig(icon: Icon(Icons.person), title: "User"),
    //           ),
    //           PersistentTabConfig(
    //             screen: ChallengesScreen(),
    //             item: ItemConfig(
    //               icon: Icon(Icons.military_tech),
    //               title: "Challenges",
    //             ),
    //           ),
    //         ],
    //         navBarBuilder: (navBarConfig) => Style1BottomNavBar(
    //           navBarConfig: navBarConfig,
    //           navBarDecoration: NavBarDecoration(
    //             color: AppColors.background_black,
    //           ),
    //         ),
    //       );
    //     },
    //     error: (e, st) => Scaffold(body: Center(child: Text("error"))),
    //     loading: () =>
    //         Scaffold(body: Center(child: CircularProgressIndicator())),
    //   ),
    // );
  }
}
