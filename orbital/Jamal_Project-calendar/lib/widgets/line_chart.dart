import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:jamal_v1/model/line_titles.dart';

class LineChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: LineTitles.getTitleData(),
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 8,
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              spots: [
                FlSpot(0, 2.5),
                FlSpot(1, 2),
                FlSpot(2, 3),
                FlSpot(3, 2.5),
                FlSpot(4, 4),
                FlSpot(5, 3),
                FlSpot(6, 4.5),
              ],
              colors: [Colors.white70, Colors.white],
              barWidth: 3,
            ),
          ],
        ),
      );
}
