import 'package:flutter/material.dart';

import 'model.dart';
import 'paint.dart';

class MultiLevelPieChart extends StatelessWidget {
  final double chartSize;
  final double? startAngle;
  final List<MultiLevelPieChartInfo> chartInfo;
  final bool removeDecimal;
  final double labelCircleSize;
  final double labelRunSpacing;
  final double labelSpacing;
  final TextDirection? textDirection;
  final TextStyle? labelTextStyle;
  final TextStyle? percentTextStyle;
  final bool hidePercentageLabel;

  const MultiLevelPieChart({
    super.key,
    required this.chartSize,
    this.startAngle,
    required this.chartInfo,
    this.removeDecimal = true,
    this.labelCircleSize = 10,
    this.labelRunSpacing = 8,
    this.labelSpacing = 8,
    this.textDirection,
    this.labelTextStyle,
    this.percentTextStyle,
    this.hidePercentageLabel = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: textDirection,
      children: [
        CustomPaint(
          size: Size(chartSize, chartSize),
          painter: CirclePercentage(
            chartInfo: chartInfo,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Wrap(
            runSpacing: labelRunSpacing,
            spacing: labelSpacing,
            children: chartInfo
                .map((e) => MultiLevelPieInfoText(
                      info: e,
                      hidePercentageLabel: hidePercentageLabel,
                      removeDecimal: removeDecimal,
                      size: labelCircleSize,
                      labelTextStyle: labelTextStyle,
                      percentTextStyle: percentTextStyle,
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}

class MultiLevelPieInfoText extends StatelessWidget {
  final MultiLevelPieChartInfo info;
  final double size;
  final bool removeDecimal;
  final TextStyle? labelTextStyle;
  final TextStyle? percentTextStyle;
  final bool hidePercentageLabel;

  const MultiLevelPieInfoText({
    super.key,
    required this.info,
    required this.size,
    required this.removeDecimal,
    required this.labelTextStyle,
    required this.percentTextStyle,
    required this.hidePercentageLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomPaint(
          size: Size(size, size),
          painter: PercentagePainter(
            info: info,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          info.label,
          style: labelTextStyle,
        ),
        if (!hidePercentageLabel) ...[
          const SizedBox(
            width: 5,
          ),
          Text(
            '${removeDecimal ? info.percentage.toInt() : info.percentage}%',
            style: percentTextStyle,
          ),
        ],
      ],
    );
  }
}
