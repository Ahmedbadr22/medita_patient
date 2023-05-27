import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'line_titles.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(LineChartData(
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: LineTitles.getTitleData(),
        minX: 0,
        minY: 0,
        maxX: 11,
        maxY: 8,
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 2.5),
              FlSpot(2, 2),
              FlSpot(4, 3),
              FlSpot(6, 2.5),
              FlSpot(8, 4),
              FlSpot(10, 3),
              FlSpot(12, 4.5),
            ],
            barWidth: 3,
            color: Colors.white54,
          )
        ]));
  }
}
