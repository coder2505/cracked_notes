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
}