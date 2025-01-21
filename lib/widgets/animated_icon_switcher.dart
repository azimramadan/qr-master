import 'package:flutter/material.dart';

class AnimatedIconSwitcher extends StatelessWidget {
  const AnimatedIconSwitcher({
    super.key,
    required this.onPressed,
    required this.keyValue,
    required this.icon_1,
    required this.icon_2,
  });
  final VoidCallback onPressed;
  final bool keyValue;
  final IconData icon_1, icon_2;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300), // مدة الأنيميشن
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          scale: animation, // أنيميشن الدوران
          child: child,
        );
      },
      child: IconButton(
        key: ValueKey<bool>(keyValue), // مفتاح فريد لتحديث الأيقونة
        onPressed: onPressed,
        icon: Icon(
          keyValue ? icon_1 : icon_2,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
