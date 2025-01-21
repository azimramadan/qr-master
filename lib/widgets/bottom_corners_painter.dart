import 'package:flutter/material.dart';
import 'package:qr_code_app/constants.dart';

class BottomCornersPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint cornerPaint = Paint()
      ..color = kPrimaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    double cornerLength = 50;
    double cornerRadius = 24;

    // الزاوية السفلية اليسرى
    Path bottomLeftCorner = Path()
      ..moveTo(0, size.height - cornerLength)
      ..lineTo(0, size.height - cornerRadius)
      ..arcToPoint(
        Offset(cornerRadius, size.height),
        radius: Radius.circular(cornerRadius),
        clockwise: false,
      )
      ..moveTo(cornerRadius, size.height)
      ..lineTo(cornerLength, size.height);
    canvas.drawPath(bottomLeftCorner, cornerPaint);

    // الزاوية السفلية اليمنى
    Path bottomRightCorner = Path()
      ..moveTo(size.width, size.height - cornerLength)
      ..lineTo(size.width, size.height - cornerRadius)
      ..arcToPoint(
        Offset(size.width - cornerRadius, size.height),
        radius: Radius.circular(cornerRadius),
      )
      ..moveTo(size.width - cornerRadius, size.height)
      ..lineTo(size.width - cornerLength, size.height);
    canvas.drawPath(bottomRightCorner, cornerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
