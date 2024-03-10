import 'package:flutter/material.dart';

import 'model.dart';
import 'utils.dart';

class CirclePercentage extends CustomPainter {
  CirclePercentage({
    this.width = 3,
    required this.chartInfo,
    this.smallestPercentage = 30,
  });
  final List<MultiLevelPieChartInfo> chartInfo;
  final double width;
  final int smallestPercentage;

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;

    for (var i in chartInfo) {
      final position = chartInfo.indexOf(i) + 1;

      var backgroundPaint = Paint()
        ..color = i.backgroundColor ?? Colors.grey
        ..style = PaintingStyle.stroke
        ..strokeWidth = width;
      var foregroundPaint = Paint()
        ..color = i.foregroundColor ?? Colors.red
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = width;

      canvas.drawArc(
        Rect.fromCenter(
          center: Offset(centerX, centerY),
          width: size.width * position / chartInfo.length,
          height: size.height * position / chartInfo.length,
        ),
        0.toRadians(),
        360.toRadians(),
        false,
        backgroundPaint,
      );
      canvas.drawArc(
        Rect.fromCenter(
          center: Offset(centerX, centerY),
          width: size.width * position / chartInfo.length,
          height: size.height * position / chartInfo.length,
        ),
        (i.startAngle ?? 0).toRadians(),
        ((i.percentage / 100) * 360).toRadians(),
        false,
        foregroundPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class PercentagePainter extends CustomPainter {
  PercentagePainter({
    this.width = 3,
    required this.info,
  });
  final MultiLevelPieChartInfo info;
  final double width;

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;

    var backgroundPaint = Paint()
      ..color = info.backgroundColor ?? Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    var foregroundPaint = Paint()
      ..color = info.foregroundColor ?? Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(centerX, centerY),
        width: size.width,
        height: size.height,
      ),
      0.toRadians(),
      360.toRadians(),
      false,
      backgroundPaint,
    );
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(centerX, centerY),
        width: size.width,
        height: size.height,
      ),
      0.toRadians(),
      360.toRadians(),
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
