import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../widgets/signup_auth_screen_widgets.dart';

class SignupScreen extends ConsumerStatefulWidget {


  final double height;
  const SignupScreen(this.height, {super.key});


  static void openBottomSheet(BuildContext context) {
    showMaterialModalBottomSheet(context: context, builder: (context) {
      return SignupScreen(MediaQuery.of(context).size.height);
    });
  }

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: SizedBox(
        height: height*0.85,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 24,
              bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...SignupAuthScreenWidgets.topTextHolders(widget.height, context),
                ...SignupAuthScreenWidgets.bottomInputFields(
                    widget.height,
                    context,
                    emailController,
                    passwordController,
                    ref
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
