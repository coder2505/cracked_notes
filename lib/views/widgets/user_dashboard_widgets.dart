import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class UserDashboardWidgets {

  static List<Color> piechartcolors =[Color(0xff9999ff),Color(0xff993366), Color(0xffffffcc),Color(0xffccffff), Color(0xff660066)];

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

  static Widget radarChart(List<Map<String, dynamic>> skillStats) {
    //{tagName: Array, tagSlug: array, problemsSolved: 46}
    List<RadarEntry> problemSolved = List.generate(
      8,
      (index) =>
          RadarEntry(value: skillStats[index]["problemsSolved"].toDouble()),
    );
    List<String> titlesList = List.generate(
      8,
      (index) =>
          "${skillStats[index]["tagName"]}\n${problemSolved[index].value.toInt()}",
    );

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
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
          getTitle: (index, angle) {
            return RadarChartTitle(text: titlesList[index]);
          },
          tickCount: 1,
          ticksTextStyle: const TextStyle(
            color: Colors.transparent,
            fontSize: 10,
          ),
          tickBorderData: const BorderSide(color: Colors.grey, width: 2),
          gridBorderData: const BorderSide(color: Colors.grey, width: 1),
        ),
        duration: const Duration(milliseconds: 150),
        curve: Curves.linear,
      ),
    );
  }

  static Widget pieChart(List<Map<String, dynamic>> langStats) {
    //{ "languageName": "Java","Solved": 85 },

    return SizedBox(
      height: 250,
      child: Row(
        children: [
          Expanded(
            child: PieChart(
              PieChartData(
                borderData: FlBorderData(show: false),
                sectionsSpace: 0,
                centerSpaceRadius: 0,
                sections: returnPieList(langStats),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 10,
            children: List.generate(
              langStats.length,
              (index) => makealist(langStats[index]["languageName"]),
            ),
          ),
        ],
      ),
    );
  }

  static List<PieChartSectionData> returnPieList(
    List<Map<String, dynamic>> data,
  ) {
    List<PieChartSectionData> list = [];
    for (Map language in data) {
      list.add(
        accToLang(language["languageName"], language["Solved"].toDouble()),
      );
    }

    return list;
  }

  static PieChartSectionData accToLang(String name, double value) {
    switch (name) {
      case "Java":
        return PieChartSectionData(
          color: piechartcolors[0],
          value: value,
          title: name,
          radius: 100,
          titleStyle: TextStyle(
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            color: const Color(0x00ffffff),
          ),
        );

      case "Python3":
        return PieChartSectionData(
          color: piechartcolors[1],
          value: value,
          title: name,
          radius: 100,
          titleStyle: TextStyle(
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            color: const Color(0x00ffffff),
          ),
          // badgeWidget: SizedBox(
          //   height: 50,
          //   child: Image.asset('assets/lang_icons/python.png'),
          // ),
        );

      case "C++":
        return PieChartSectionData(
          color: piechartcolors[2],
          value: value,
          title: name,
          radius: 100,
          titleStyle: TextStyle(
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            color: const Color(0x00ffffff),
          ),
          // badgeWidget: SizedBox(
          //   height: 50,
          //   child: Image.asset('assets/lang_icons/c++.png'),
          // ),
        );
    }

    return PieChartSectionData(
      color: Color(0xE8772E80),
      value: value,
      title: name,
      radius: 100,
      titleStyle: TextStyle(
        fontSize: 16,
        fontFamily: 'Inter',
        fontWeight: FontWeight.bold,
        color: const Color(0xffffffff),
      ),
    );
  }

  static Widget makealist(String name) {
    switch (name) {
      case 'Java':
        return buildColoredLabel(
          img: Image.asset('assets/lang_icons/java.png'),
          index: 0,
        );
      case 'Python3':
        return buildColoredLabel(
          img: Image.asset('assets/lang_icons/python.png'),
          index: 1,
        );

      case 'C++':
        return buildColoredLabel(
          img: Image.asset('assets/lang_icons/c++.png'),
          index: 2,
        );
    }

    return SizedBox();
  }

  static Widget buildColoredLabel({
    required Image img,
    required int index,
    double iconSize = 16.0,
  }) {
    return Row(
      // Aligns the text and the icon vertically in the center
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min, // Take up only the space needed
      children: [
        // 1. The Colored Square Icon
        Container(
          width: iconSize,
          height: iconSize,
          decoration: BoxDecoration(
            color: piechartcolors[index],
            // Optional: Add rounded corners if desired
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),

        // Add some horizontal spacing between the icon and the text
        const SizedBox(width: 8.0),

        // 2. The Text Label
        SizedBox(height: 40, child: img),
      ],
    );
  }
}
