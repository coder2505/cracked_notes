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

  static Widget radarChart() {
    return SizedBox(
      height: 250,
      child: RadarChart(
        RadarChartData(
          dataSets: [
            RadarDataSet(
              fillColor: Colors.blue.withValues(alpha: 0.4),
              borderColor: Colors.blue,
              entryRadius: 3,
              dataEntries: [
                const RadarEntry(value: 5),
                const RadarEntry(value: 3),
                const RadarEntry(value: 4),
                const RadarEntry(value: 2),
                const RadarEntry(value: 4.5),
              ],
            ),
            RadarDataSet(
              fillColor: Colors.red.withValues(alpha: 0.4),
              borderColor: Colors.red,
              entryRadius: 3,
              dataEntries: [
                const RadarEntry(value: 2),
                const RadarEntry(value: 4),
                const RadarEntry(value: 3),
                const RadarEntry(value: 5),
                const RadarEntry(value: 3.5),
              ],
            ),
          ],
          radarBackgroundColor: Colors.transparent,
          radarBorderData: const BorderSide(color: Colors.grey),
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 14),
          getTitle: (index, angle) {
            const titles = [
              'Arrays',
              'String',
              'Recursion',
              'Dynamic Programming',
              'Stacks',
            ];
            return RadarChartTitle(text: titles[index]);
          },
          tickCount: 5,
          ticksTextStyle: const TextStyle(color: Colors.grey, fontSize: 10),
          tickBorderData: const BorderSide(color: Colors.grey, width: 1),
          gridBorderData: const BorderSide(color: Colors.grey, width: 1),
        ),
        duration: const Duration(milliseconds: 150),
        curve: Curves.linear,
      ),
    );
  }

  static Widget recentActivity() {
    return ListView.builder(
      itemCount: problems.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        String title = problems[index]['title'] ?? '';
        String subtitle = problems[index]['subtitle'] ?? '';

        return Container(
          margin: const EdgeInsets.only(bottom: 8.0),
          // Use margin to add spacing between items
          decoration: BoxDecoration(
            // Using a more readable way to represent the color with opacity.
            color: Colors.black.withOpacity(0.51),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: ListTile(title: Text(title), subtitle: Text(subtitle)),
        );
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
