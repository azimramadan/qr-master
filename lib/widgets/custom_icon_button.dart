import 'package:flutter/material.dart';
import 'package:qr_code_app/constants.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.click,
    required this.icon,
    this.iconSize = 34,
  });
  final double? iconSize;
  final void Function() click;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: iconSize,
      onPressed: click,
      icon: Icon(
        icon,
        color: kPrimaryColor,
      ),
      style: IconButton.styleFrom(
        backgroundColor: Color.fromRGBO(51, 51, 51, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // تحديد الحواف
        ),
      ),
    );
  }
}
