import 'package:flutter/material.dart';

class DataCleaningUser{

  static List<Map<String, dynamic>> sortProblemCounts(Map<String, dynamic> data) {
    // 1. Safely navigate to the tagProblemCounts object
    final tagCounts = data['data']['matchedUser']?['tagProblemCounts'] as Map<String, dynamic>?;

    if (tagCounts == null) {
      debugPrint('Error: Could not find tagProblemCounts in the input data.');
      return [];
    }

    // List of category keys to iterate over
    const categories = ['advanced', 'intermediate', 'fundamental'];
    List<Map<String, dynamic>> allSkills = [];

    // 2. Extract and flatten the lists from all categories
    for (final category in categories) {
      // Safely cast the list of skills for the current category
      final skillList = tagCounts[category] as List<dynamic>?;

      if (skillList != null) {
        // Add all skill maps to the combined list
        allSkills.addAll(skillList.map((item) => item as Map<String, dynamic>));
      }
    }

    // 3. Sort the combined list
    // The sort function compares two elements, 'a' and 'b'.
    // Returning b - a achieves descending order (highest first).
    allSkills.sort((a, b) {
      // Ensure 'problemsSolved' fields are treated as integers for comparison
      final solvedA = a['problemsSolved'] as int;
      final solvedB = b['problemsSolved'] as int;

      // Descending order: Compare b against a
      return solvedB.compareTo(solvedA);
    });

    return allSkills;
  }
  static String formatSubmissionTime(String? timestampSeconds) {
    // Helper function to get the three-letter month abbreviation
    String getMonthAbbreviation(int month) {
      const months = [
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
      ];
      // Dart months are 1-based (1=January, 12=December)
      // We use month - 1 to get the 0-based index.
      return months[month - 1];
    }

    DateTime dateTime;

    // Check for null or empty input
    if (timestampSeconds != null && timestampSeconds.isNotEmpty) {
      // Attempt to parse the timestamp string to an integer (seconds)
      final tsSeconds = int.tryParse(timestampSeconds) ?? 0;

      // Convert seconds to milliseconds and create the DateTime object
      dateTime = DateTime.fromMillisecondsSinceEpoch(tsSeconds * 1000);
    } else {
      // Fallback to the current time if the input is null or invalid
      dateTime = DateTime.now();
    }

    // Format components: hour:minute, day month
    // padLeft(2, '0') ensures the hour/minute are two digits (e.g., 09:05)
    String hour = dateTime.hour.toString().padLeft(2, '0');
    String minute = dateTime.minute.toString().padLeft(2, '0');
    String day = dateTime.day.toString();
    String monthAbbr = getMonthAbbreviation(dateTime.month);

    // Final formatted string, e.g., "14:30, 16 Oct"
    return '$hour:$minute, $day $monthAbbr';
  }
}