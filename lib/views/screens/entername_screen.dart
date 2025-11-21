import 'package:cracked_notes/core/extensions/extensions.dart';
import 'package:cracked_notes/core/theme/app_colors.dart';
import 'package:cracked_notes/viewmodel/ui_stateproviders.dart';
import 'package:cracked_notes/viewmodel/user_basicinfo_viewmodel.dart';
import 'package:cracked_notes/views/widgets/enter_name_screen_widgets/enter_name_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EnternameScreen extends ConsumerStatefulWidget {
  const EnternameScreen({super.key});

  @override
  ConsumerState<EnternameScreen> createState() => _EnternameScreenState();
}

class _EnternameScreenState extends ConsumerState<EnternameScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  bool switchButtons = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {


    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: AppColors.background_black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              EnterNameScreenWidgets.enternametitle(),
              TextField(
                enabled: !ref.watch(showContainer),
                focusNode: _focusNode,
                controller: _controller,
                decoration: InputDecoration(
                  hint: Text(
                    "Enter here",
                    style: TextStyle(color: Colors.grey),
                  ),
                  border: OutlineInputBorder(),
                ),
                onEditingComplete: () {
                  FocusScope.of(context).unfocus();
                },
                style: TextStyle(color: Colors.white),
              ),
              EnterNameScreenWidgets.animatedContainer(context, ref, width),
              EnterNameScreenWidgets.buttons(ref, context, _controller),
            ],
          ),
        ),
      ),
    );
  }
}
