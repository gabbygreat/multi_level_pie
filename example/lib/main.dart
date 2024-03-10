import 'package:flutter/material.dart';
import 'package:multi_level_pie/multi_level_pie.dart';

void main() {
  runApp(const MultiLevelPieApp());
}

class MultiLevelPieApp extends StatelessWidget {
  const MultiLevelPieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true, // Enable Material 3 if desired
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Multi Level Pie Example'),
        ),
        body: Center(
          // Center the chart for better presentation
          child: MultiLevelPieChart(
            chartSize: 300, // Increase chart size for better visibility
            chartInfo: [
              MultiLevelPieChartInfo(
                startAngle: 70,
                percentage: 80,
                label: 'CSC 101',
                foregroundColor: Colors.blue,
              ),
              MultiLevelPieChartInfo(
                startAngle: 150,
                percentage: 50,
                foregroundColor: Colors.green,
                label: 'MTH 204',
              ),
              MultiLevelPieChartInfo(
                startAngle: 210,
                percentage: 60,
                foregroundColor: Colors.orange,
                label: 'PHY 101',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
