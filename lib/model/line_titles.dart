import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData() {
    final style = TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );

    return FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 30,
        getTextStyles: (_) => style,
        getTitles: (value) {
          value = value % 7;

          switch (value.toInt()) {
            case 1:
              return 'MON';
            case 2:
              return 'TUE';
            case 3:
              return 'WED';
            case 4:
              return 'THU';
            case 5:
              return 'FRI';
            case 6:
              return 'SAT';
            case 0:
              return 'SUN';
          }
          return '';
        },
        margin: 8,
      ),
      rightTitles: SideTitles(showTitles: false),
      leftTitles: SideTitles(
        showTitles: true,
        getTextStyles: (_) => style,
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '100';
            case 3:
              return '300';
            case 5:
              return '500';
          }
          return '';
        },
        reservedSize: 40,
        margin: 24,
      ),
    );
  }
}
