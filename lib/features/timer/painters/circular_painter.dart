import 'dart:math';

import 'package:flutter/material.dart';

class CircularTimerPainter extends CustomPainter {
  CircularTimerPainter({required this.progress, required this.color, required this.bgColor});

  final double progress;
  final Color color;
  final Color bgColor;

  @override
  void paint(Canvas canvas, Size size) {
    const double strokeWidth = 15;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - strokeWidth / 2;

    final backgroundPaint = Paint()
      ..color = bgColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, backgroundPaint);

    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    canvas
      ..drawCircle(center, radius, backgroundPaint)
      ..drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2,
        2 * -pi * progress,
        false,
        progressPaint,
      );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
