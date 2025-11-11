import 'package:cracked_notes/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class StackedProgressbarTwoVariables extends StatelessWidget {
  final int completed;
  final int total;

  const StackedProgressbarTwoVariables({
    super.key,
    required this.completed,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {

    final double completedPercent = (completed/total);
    final notcompleted = 1 -(completedPercent);

    return Container(
      height: 20,
      decoration: BoxDecoration(
        color: Color(0xff59585C),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          // Easy (green)
          Flexible(
            flex: (completedPercent * 1000).toInt(),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.app_highest_blue_github,
                borderRadius: const BorderRadius.horizontal(left: Radius.circular(40)),
              ),
            ),
          ),
          Flexible(
            flex: (notcompleted * 1000).toInt(),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(right: Radius.circular(40)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
