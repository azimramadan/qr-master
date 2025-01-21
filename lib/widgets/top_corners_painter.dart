import 'package:flutter/material.dart';
import 'package:qr_code_app/constants.dart';

class TopCornersPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint cornerPaint = Paint()
      ..color = kPrimaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    double cornerLength = 50;
    double cornerRadius = 24;

    // الزاوية العلوية اليسرى
    Path topLeftCorner = Path()
      ..moveTo(0, cornerRadius)
      ..arcToPoint(
        Offset(cornerRadius, 0),
        radius: Radius.circular(cornerRadius),
      )
      ..lineTo(cornerLength, 0)
      ..moveTo(0, cornerRadius)
      ..lineTo(0, cornerLength);
    canvas.drawPath(topLeftCorner, cornerPaint);

    // الزاوية العلوية اليمنى
    Path topRightCorner = Path()
      ..moveTo(size.width - cornerLength, 0)
      ..lineTo(size.width - cornerRadius, 0)
      ..arcToPoint(
        Offset(size.width, cornerRadius),
        radius: Radius.circular(cornerRadius),
      )
      ..moveTo(size.width, cornerRadius)
      ..lineTo(size.width, cornerLength);
    canvas.drawPath(topRightCorner, cornerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
