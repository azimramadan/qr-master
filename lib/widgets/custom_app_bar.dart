import 'package:flutter/material.dart';
import 'package:qr_code_app/widgets/custom_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.click,
    required this.text,
    this.iconSize = 34,
  });
  final void Function() click;
  final String text;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          iconSize: iconSize,
          click: click,
          icon: Icons.navigate_before,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: 'Itim',
            fontSize: 32,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
