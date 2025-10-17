import 'package:cracked_notes/views/screens/challenges_screen.dart';
import 'package:cracked_notes/views/screens/community_screen.dart';
import 'package:cracked_notes/views/screens/user_dashboard.dart';
import 'package:cracked_notes/views/screens/user_homescreen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class NavBarHolder extends StatefulWidget {
  const NavBarHolder({super.key});

  @override
  State<NavBarHolder> createState() => _NavBarHolderState();
}

class _NavBarHolderState extends State<NavBarHolder> {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: UserHomescreen(),
          // screen: UserDashboard(),
          item: ItemConfig(
            icon: Icon(Icons.home),
            title: "Home",
          ),
        ),
        PersistentTabConfig(
          screen: CommunityScreen(),
          item: ItemConfig(
            icon: Icon(Icons.people),
            title: "Community",
          ),
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
      ),
    );
  }
}
