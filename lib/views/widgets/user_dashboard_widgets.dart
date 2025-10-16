import 'package:cracked_notes/core/extensions/extensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class UserDashboardWidgets {
  static final List<Map<String, String>> problems = [
    {
      'title': '1. Two Sum',
      'subtitle': 'Find indices of two numbers that add up to a target.',
    },
    {
      'title': '2. Reverse Linked List',
      'subtitle': 'Reverse a singly linked list using iteration or recursion.',
    },
    {
      'title': '3. Binary Search',
      'subtitle': 'Find the position of a target value within a sorted array.',
    },
    {
      'title': '4. Merge Sort',
      'subtitle': 'Sort an array using the divide and conquer technique.',
    },
    {
      'title': '5. Detect Cycle in Graph',
      'subtitle': 'Check if a directed/undirected graph contains a cycle.',
    },
    {
      'title': '6. Longest Common Subsequence',
      'subtitle':
          'Find the length of the longest subsequence present in both strings.',
    },
  ];

  static Widget topRow(String name) {
    return Row(
      spacing: 10,
      children: [
        Icon(Icons.people),
        Column(children: [Text(name), Text("Level 6")]),
        Expanded(child: SizedBox()),
        Container(width: 50, height: 50, color: Colors.grey),
      ],
    );
  }

  static Widget streakContainer(
    double width,
    double height,
    BuildContext context,
  ) {
    return Container(
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
          Text('14 days on streak!', style: context.headlineMedium),
          SizedBox(
            height: height / 7,
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

  static Widget radarChart(List<Map<String, dynamic>> skillStats) {
    //{tagName: Array, tagSlug: array, problemsSolved: 46}

    List<RadarEntry> problemSolved = List.generate(8,(index)=> RadarEntry(value: skillStats[index]["problemsSolved"].toDouble()));
    List<String> titlesList = List.generate(8,(index)=> "${skillStats[index]["tagName"]}\n${problemSolved[index].value.toInt()}");


    return SizedBox(
      height: 250,
      child: RadarChart(
        RadarChartData(
          dataSets: [
            RadarDataSet(
              fillColor: Colors.blue.withValues(alpha: 0.4),
              borderColor: Colors.blue,
              entryRadius: 4,
              dataEntries: problemSolved,
            ),
          ],
          radarBackgroundColor: Colors.transparent,
          radarBorderData: const BorderSide(color: Colors.grey),
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 14),
          getTitle: (index, angle) {
            return RadarChartTitle(text: titlesList[index]);
          },
          tickCount: 1,
          ticksTextStyle: const TextStyle(color: Colors.transparent, fontSize: 10),
          tickBorderData: const BorderSide(color: Colors.grey, width: 2),
          gridBorderData: const BorderSide(color: Colors.grey, width: 1),
        ),
        duration: const Duration(milliseconds: 150),
        curve: Curves.linear,
      ),
    );
  }

  static Widget recentActivity() {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        String title = problems[index]['title'] ?? '';
        String subtitle = problems[index]['subtitle'] ?? '';
        return ListTile(title: Text(title), subtitle: Text(subtitle));
      },
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
