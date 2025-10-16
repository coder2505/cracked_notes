import 'package:cracked_notes/viewmodel/user_data_viewmodel.dart';
import 'package:cracked_notes/views/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClickNav {
  static void clickGetStarted(BuildContext context) {
    SignupScreen.openBottomSheet(context);
  }

  static void clickCreateUser(WidgetRef ref, String email, String password) {
    ref.read(userAuthProvider.notifier).signupBackend(email, password);
  }
}
