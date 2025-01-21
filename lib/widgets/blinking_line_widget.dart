import 'package:flutter/material.dart';
import 'package:qr_code_app/constants.dart';

class BlinkingLine extends StatefulWidget {
  const BlinkingLine({super.key});

  @override
  State<BlinkingLine> createState() => _BlinkingLineState();
}

class _BlinkingLineState extends State<BlinkingLine>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 450), // مدة التأثير
    )..repeat(reverse: true);

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.ease, // إضافة تأثير سلس
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Opacity(
          opacity: animation.value,
          child: Container(
            width: 275,
            height: 2,
            color: kPrimaryColor, // لون الخط
          ),
        );
      },
    );
  }
}
