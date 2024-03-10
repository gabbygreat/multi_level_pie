import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multi_level_pie/multi_level_pie.dart';

void main() {
  // Define a test group for MultiLevelChart tests
  group('MultiLevelChart Widget Tests', () {
    // A test case to ensure the MultiLevelChart widget can be created with MultiLevelChartInfo.
    testWidgets('MultiLevelChart is created with provided MultiLevelChartInfo',
        (WidgetTester tester) async {
      // Define test MultiLevelChartInfo data
      final chartInfo = [
        MultiLevelPieChartInfo(
          startAngle: 70,
          percentage: 80,
          label: 'Test Label 1',
          foregroundColor: Colors.blue,
        ),
        MultiLevelPieChartInfo(
          startAngle: 150,
          percentage: 50,
          label: 'Test Label 2',
          foregroundColor: Colors.green,
        ),
      ];

      // Create the MultiLevelChart widget using MaterialApp for proper theme context
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: MultiLevelPieChart(
            chartSize: 200,
            chartInfo: chartInfo,
          ),
        ),
      ));

      // Verify the MultiLevelChart widget is in the widget tree
      expect(find.byType(MultiLevelPieChart), findsOneWidget);

      // Optionally, verify specific properties, such as the number of MultiLevelChartInfo
      // This example simply checks for the presence of the MultiLevelChart widget
    });
  });
}
