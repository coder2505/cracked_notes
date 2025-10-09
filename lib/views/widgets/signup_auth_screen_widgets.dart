import 'package:cracked_notes/core/extensions/extensions.dart';
import 'package:cracked_notes/viewmodel/clicknav.dart';
import 'package:cracked_notes/viewmodel/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodel/ui_stateproviders.dart';

class SignupAuthScreenWidgets {
  static List<Widget> topTextHolders(double height, BuildContext context) {
    return [
      Text(
        "Cracked notes title",
        textAlign: TextAlign.center,
        style: context.headlineLarge,
      ),
      const SizedBox(height: 12),
      Text("plz", style: context.titleMedium),
      SizedBox(height: height * 0.05),
    ];
  }

  static List<Widget> bottomInputFields(
    double height,
    BuildContext context,
    TextEditingController email,
    TextEditingController password,
    WidgetRef ref,
  ) {
    return [
      // Email
      TextField(
        controller: email,
        style: context.bodyLarge,
        decoration: InputDecoration(
          labelText: "Email address",
          labelStyle: context.labelStyle,
          prefixIcon: Icon(Icons.email_outlined, color: context.primary),
          contentPadding: EdgeInsets.symmetric(
            vertical: height * 0.035,
            horizontal: 16,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      SizedBox(height: height * 0.03),

      // Password
      TextField(
        controller: password,
        style: context.bodyLarge,
        obscureText: ref.watch(passwordVisibilityProvider),
        decoration: InputDecoration(
          labelText: "Password",
          labelStyle: context.labelStyle,
          prefixIcon: Icon(Icons.lock_outline, color: context.primary),
          suffixIcon: IconButton(
            icon: Icon(
              ref.watch(passwordVisibilityProvider)
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: context.primary,
            ),
            onPressed: () {
              ref.read(passwordVisibilityProvider.notifier).state = !(ref
                  .read(passwordVisibilityProvider.notifier)
                  .state);
            },
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: height * 0.035,
            horizontal: 16,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      SizedBox(height: height * 0.03),

      //Continue button
      SizedBox(height: height * 0.25),
      SizedBox(
        width: double.infinity,
        height: height * 0.1,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: context.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
          ClickNav.clickCreateUser(ref, email.text.toString(), password.text.toString());
          },
          child: Text("Continue", style: context.bodyLarge),
        ),
      ),
    ];
  }
}
