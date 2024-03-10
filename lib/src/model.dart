import 'package:flutter/material.dart';

class MultiLevelPieChartInfo {
  final double? startAngle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double percentage;
  final String label;

  MultiLevelPieChartInfo({
    this.startAngle,
    this.backgroundColor,
    this.foregroundColor,
    required this.percentage,
    required this.label,
  });
}
