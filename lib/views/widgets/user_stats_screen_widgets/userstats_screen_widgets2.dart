import 'package:cracked_notes/views/widgets/user_stats_screen_widgets/helper_widgets.dart';
import 'package:flutter/material.dart';

class UserStatsScreenWidgets2 {
  static Widget BadgeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        helperWidgets.makeBadge(
          "https://assets.leetcode.com/static_assets/others/lg2550.png",
          false,
        ),
        helperWidgets.makeBadge(
          "https://leetcode.com/static/images/badges/dcc-2025-11.png",
          true,
        ),
        helperWidgets.makeBadge(
          "https://leetcode.com/static/images/badges/dcc-2025-12.png",
          true,
        ),
      ],
    );
  }
}
