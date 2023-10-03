import 'package:fi/common/color_sheme.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

class CustomArcPainter extends CustomPainter {
  final double start;
  final double end;
  final double width;
  final double blurwidth;

  CustomArcPainter({
    this.start = 0,
    required this.end,
    this.width = 10,
    this.blurwidth = 10,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2);

    var gradiendColor = LinearGradient(
      colors: [TColor.secondary, TColor.secondary50],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    Paint activePaint = Paint()..shader = gradiendColor.createShader(rect);

    activePaint.style = PaintingStyle.stroke;
    activePaint.strokeWidth = width;
    activePaint.strokeCap = StrokeCap.round;

    Paint backgroundPaint = Paint();
    backgroundPaint.color = TColor.gray60;
    backgroundPaint.style = PaintingStyle.stroke;
    backgroundPaint.strokeWidth = width;
    backgroundPaint.strokeCap = StrokeCap.round;

    Paint shadowPaint = Paint()
      ..color = TColor.secondary.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = width + blurwidth
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

    var startVal = 135.0 + start;

    canvas.drawArc(
        rect, radians(startVal), radians(270), false, backgroundPaint);

    //Draw Shadow Arc
    Path path = Path();
    path.addArc(rect, radians(startVal), radians(end));
    canvas.drawPath(path, shadowPaint);

    canvas.drawArc(rect, radians(startVal), radians(end), false, activePaint);
  }

  @override
  bool shouldRepaint(CustomArcPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CustomArcPainter oldDelegate) => false;
}
