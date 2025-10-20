import 'package:cracked_notes/views/screens/challenges_screen.dart';
import 'package:cracked_notes/views/screens/community_screen.dart';
import 'package:cracked_notes/views/screens/user_homescreen.dart';
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

    return Material(
      child: user.when(
        data: (data) {
          return PersistentTabView(
            tabs: [
              PersistentTabConfig(
                screen: UserHomescreen(),
                // screen: UserDashboard(),
                item: ItemConfig(icon: Icon(Icons.home), title: "Home"),
              ),
              PersistentTabConfig(
                screen: CommunityScreen(),
                item: ItemConfig(icon: Icon(Icons.people), title: "Community"),
              ),
              PersistentTabConfig(
                screen: ChallengesScreen(),
                item: ItemConfig(
                  icon: Icon(Icons.military_tech),
                  title: "Challenges",
                ),
              ),
            ],
            navBarBuilder: (navBarConfig) =>
                Style1BottomNavBar(navBarConfig: navBarConfig),
          );
        },
        error: (e, st) => Scaffold(body: Center(child: Text("error"))),
        loading: () => Scaffold(body: Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
