import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodel/user_viewmodel.dart';
import '../widgets/welcome_screen_widgets.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  @override
  ConsumerState<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  late double height, width;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    ref.listen<AsyncValue<bool>>(userAuthProvider, (previous, next) {
      next.when(
        data: (isSignedUp) {
          if (isSignedUp) {
            Navigator.pushReplacementNamed(context, '/home');
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Signup failed')));
          }
        },
        loading: () {

        },
        error: (err, st) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Error: $err')));
        },
      );
    });

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: WelcomeScreenWidgets.upperContainerLottieFile(height)),
              Expanded(
                  flex: 2,
                  child: WelcomeScreenWidgets.bottomContainer(context)),
            ],
          ),
        ),
      ),
    );
  }
}
