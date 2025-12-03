import 'package:cracked_notes/core/extensions/extensions.dart';
import 'package:cracked_notes/model/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../viewmodel/ui_stateproviders.dart';
import '../../../viewmodel/user_basicinfo_viewmodel.dart';

class EnterNameScreenWidgets {
  static Widget enternametitle() {
    return Text(
      "Enter your leetcode username",
      style: TextStyle(color: Colors.white),
    );
  }

  static Widget animatedContainer(
    BuildContext context,
    WidgetRef ref,
    double width,
  ) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      decoration: context.containerDecoration,
      width: ref.watch(showContainer) ? width : 0,
      height: ref.watch(showContainer) ? 200 : 0,
      child: ref.watch(showContainer)
          ? ref
                .watch(userBasicInfoProvider)
                .when(
                  data: (data) {
                    return ref.read(foundUser)
                        ? Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text.rich(
                                    TextSpan(
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: AppColors.faded_yellow,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'is that you, ',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextSpan(text: "\n"),
                                        TextSpan(
                                          text: "${data["name"]} ?",
                                          style: TextStyle(
                                            fontSize: 32,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Image.network(data["avatar"]),
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                "Please check the spelling, this user does not exist",
                                style: TextStyle(color: AppColors.faded_yellow),
                              ),
                            ),
                          );
                  },
                  error: (e, st) => Center(
                    child: Text(
                      "Had trouble loading data",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  loading: () => Center(child: CircularProgressIndicator()),
                )
          : SizedBox.shrink(),
    );
  }

  static Widget buttons(
    WidgetRef ref,
    BuildContext context,
    TextEditingController controller,
  ) {
    return Align(
      alignment: Alignment.center,
      child: AnimatedSwitcher(
        duration: Duration(seconds: 1),
        child: ref.watch(foundUser)
            ? Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 20,
                children: [
                  Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                      color: AppColors.app_trans_red,
                      border: BoxBorder.all(color: AppColors.app_red),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: IconButton(
                      onPressed: () {
                        ref.read(showContainer.notifier).state = false;
                        ref.read(foundUser.notifier).state = false;
                      },
                      icon: Icon(Icons.close),
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                      color: AppColors.green_trans_counter,
                      border: BoxBorder.all(color: AppColors.green_counter),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text("Confirm Proceed?"),
                            content: Text("Are you sure this is you ?"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Cancel"),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  await UserPrefs.saveUser(
                                    isLoggedIn: true,
                                    username: ref.read(userName).trim(),
                                  );

                                  if (context.mounted) {
                                    context.go(
                                      "/home",
                                      extra: ref.read(userName).trim(),
                                    );
                                  }
                                },
                                child: Text("Yes its me"),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: Icon(Icons.check),
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            : Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  color: Color(0x3d0071FF),
                  border: BoxBorder.all(color: Color(0xff0071FF)),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: IconButton(
                  onPressed: () {
                    if (controller.text.trim().isNotEmpty) {
                      ref.read(showContainer.notifier).state = true;
                      FocusScope.of(context).unfocus();

                      ref.read(userName.notifier).state = controller.text
                          .trim();

                      ref
                          .read(userBasicInfoProvider.notifier)
                          .fetchBasicUserData(ref.read(userName).trim());
                    } else {
                      //show toast here
                    }
                  },
                  icon: Icon(Icons.arrow_forward_ios),
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
