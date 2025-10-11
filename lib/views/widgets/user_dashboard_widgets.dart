import 'package:cracked_notes/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

class UserDashboardWidgets {
  static Widget topRow() {
    return Row(
      spacing: 10,
      children: [
        Icon(Icons.people),
        Column(children: [Text("Manish R"), Text("Level 6")]),
        Expanded(child: SizedBox()),
        Container(width: 50, height: 50, color: Colors.grey),
      ],
    );
  }

  static Widget streakContainer(double width, double height, BuildContext context){
    return  Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '14 days on streak!',
            style: context.headlineMedium,
          ),
          SizedBox(
            height: height/7,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildStreakDay(11, false),
                  _buildStreakDay(12, false),
                  _buildStreakDay(13, false),
                  _buildStreakDay(14, true),
                  _buildStreakDay(15, false),
                  _buildStreakDay(16, false),
                  _buildStreakDay(17, false),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle button press
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFFFC7749),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              minimumSize: const Size(double.infinity, 50),
              textStyle: context.bodyLarge,
            ),
            child: const Text('Get a reward'),
          ),
        ],
      ),
    );
  }

  static Widget _buildStreakDay(int day, bool isCurrent) {
    return Container(
      width: 80,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: isCurrent ? Colors.white : const Color(0xFFFB997D),
        borderRadius: BorderRadius.circular(15.0),
        border: isCurrent
            ? Border.all(color: Colors.white, width: 2)
            : Border.all(color: Colors.transparent),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.diamond,
            color: isCurrent ? const Color(0xFFFC7749) : Colors.amber,
            size: 30,
          ),
          const SizedBox(height: 5),
          Text(
            '$day D',
            style: TextStyle(
              color: isCurrent ? const Color(0xFFFC7749) : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

}
