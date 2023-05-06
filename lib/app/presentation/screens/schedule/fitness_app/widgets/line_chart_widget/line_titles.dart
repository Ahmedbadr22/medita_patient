import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData() {
    const style = TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );

    return FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: (value, meta) {
              value = value % 14;

              switch (value.toInt()) {
                case 1:
                  return const Text('MON', style: style);
                case 4:
                  return const Text('THU', style: style);
                case 7:
                  return const Text('SAT', style: style);
                case 10:
                  return const Text('TUE', style: style);
              }
              return const Text('', style: style);
            },
            //  margin: 8,
          ),
        ),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              switch (value.toInt()) {
                case 1:
                  return const Text('100', style: style);
                case 3:
                  return const Text('300', style: style);
                case 5:
                  return const Text('500', style: style);
              }
              return const Text('', style: style);
            },
            reservedSize: 40,
            //  margin: 24,
          ),
        ));
  }
}
