import 'package:flutter/material.dart';

class LinePainter extends StatelessWidget {
  final Offset start;
  final Offset end;
  final Color color;
  final double strokeWidth;

  const LinePainter({
    super.key,
    required this.start,
    required this.end,
    this.color = Colors.black,
    this.strokeWidth = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(
        painter: _LineCustomPainter(
          start: start,
          end: end,
          color: color,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}

class _LineCustomPainter extends CustomPainter {
  final Offset start;
  final Offset end;
  final Color color;
  final double strokeWidth;

  _LineCustomPainter({
    required this.start,
    required this.end,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
