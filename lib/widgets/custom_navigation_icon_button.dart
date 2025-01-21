import 'package:flutter/material.dart';

class CustomNavigationIconButton extends StatelessWidget {
  const CustomNavigationIconButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    required this.color,
  });
  final String text;
  final IconData icon;
  final void Function() onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
          ),
          Text(
            text,
            style: TextStyle(color: color),
          ),
        ],
      ),
    );
  }
}
