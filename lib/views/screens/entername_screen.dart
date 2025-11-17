import 'package:cracked_notes/core/extensions/extensions.dart';
import 'package:cracked_notes/core/theme/app_colors.dart';
import 'package:cracked_notes/viewmodel/ui_stateproviders.dart';
import 'package:cracked_notes/viewmodel/user_basicinfo_viewmodel.dart';
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool show = ref.watch(showContainer);

    final data = ref.watch(userBasicInfoProvider);

    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

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
              Text(
                "Enter your leetcode username",
                style: TextStyle(color: Colors.white),
              ),
              TextField(
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
              AnimatedContainer(
                duration: Duration(seconds: 1),
                decoration: context.containerDecoration,
                width: show ? width : 0,
                height: show ? 200 : 0,
                child: show
                    ? data.when(
                        data: (data) {
                          return ref.read(foundUser)
                              ? Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text.rich(
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
                                      style: TextStyle(
                                        color: AppColors.faded_yellow,
                                      ),
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
                        loading: () =>
                            Center(child: CircularProgressIndicator()),
                      )
                    : SizedBox.shrink(),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    color: Color(0x3d0071FF),
                    border: BoxBorder.all(color: Color(0xff0071FF)),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: IconButton(
                    onPressed: () {

                      ref.read(showContainer.notifier).state = true;
                      FocusScope.of(context).unfocus();


                      if(ref.read(foundUser)){
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
                                onPressed: () {
                                  context.go("/home", extra: _controller.text.trim());
                                },
                                child: Text("Yes its me"),
                              ),
                            ],
                          ),
                        );
                      }else{
                        ref
                            .read(userBasicInfoProvider.notifier)
                            .fetchBasicUserData(_controller.text.trim());
                      }

                    },
                    icon: Icon(Icons.arrow_forward_ios),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
