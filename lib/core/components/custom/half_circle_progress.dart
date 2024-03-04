import 'dart:math' as math;

import 'package:d_demo/core/utils/assets.dart';
import 'package:d_demo/core/utils/m_logger.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProgressItem extends Equatable {
  final double percent;
  final Color? color;

  const ProgressItem({
    required this.color,
    required this.percent,
  });

  @override
  List<Object?> get props => [percent];
}

class HalfCircleProgress extends StatelessWidget {
  final List<ProgressItem> items;
  const HalfCircleProgress({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width * .5;
    return CustomPaint(
      size: Size(size, size * .5),
      painter: _CustomPainter(items: items),
    );
  }
}

class _CustomPainter extends CustomPainter {
  final List<ProgressItem> items;

  const _CustomPainter({
    required this.items,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _drawBackground(canvas, size);
    Paint paint = Paint()
      ..color = MColors.progressBackgroundColor
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;
    double totalPercent = 0;
    for (ProgressItem item in items) {
      paint.color = item.color ?? MColors.primaryColor;
      _drawItem(canvas, size, paint, item.percent, totalPercent);
      totalPercent = totalPercent + item.percent;
    }
    MLogger.log(items.map((e) => e.percent).join(', '));
  }

  void _drawBackground(Canvas canvas, Size size) {
    final w = size.width;
    Paint backgroundPaint = Paint()
      ..color = MColors.progressBackgroundColor
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(w * .5, w * .5),
        height: w,
        width: w,
      ),
      math.pi,
      math.pi,
      false,
      backgroundPaint,
    );
  }

  void _drawItem(
    Canvas canvas,
    Size size,
    Paint paint,
    double currentPercent,
    double totalPercent,
  ) {
    final w = size.width;
    final rect = Rect.fromCenter(
      center: Offset(w * .5, w * .5),
      height: w,
      width: w,
    );
    final startAngle = math.pi + (totalPercent * math.pi);
    final sweepAngle = (currentPercent * math.pi) - .1;
    canvas.drawArc(
      rect,
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _CustomPainter oldDelegate) =>
      oldDelegate.items != items;
}
