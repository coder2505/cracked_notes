import 'package:flutter/material.dart';

class StackedProgressBar extends StatelessWidget {
  final int easySolved;
  final int mediumSolved;
  final int hardSolved;
  final int totalProblems;

  const StackedProgressBar({
    super.key,
    required this.easySolved,
    required this.mediumSolved,
    required this.hardSolved,
    required this.totalProblems,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate percentages
    double easyPercent = easySolved / totalProblems;
    double mediumPercent = mediumSolved / totalProblems;
    double hardPercent = hardSolved / totalProblems;

    return Container(
      height: 28,
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          // Easy (green)
          Flexible(
            flex: (easyPercent * 1000).toInt(), // convert to integer proportion
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF00C853),
                borderRadius: const BorderRadius.horizontal(left: Radius.circular(40)),
              ),
            ),
          ),
          // Medium (yellow)
          Flexible(
            flex: (mediumPercent * 1000).toInt(),
            child: Container(color: Color(0xFFFFD600)),
          ),
          // Hard (red)
          Flexible(
            flex: (hardPercent * 1000).toInt(),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffD50000),
                borderRadius: const BorderRadius.horizontal(right: Radius.circular(40)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}