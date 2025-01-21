import 'package:flutter/material.dart';

class CustomTitlePageWidget extends StatelessWidget {
  const CustomTitlePageWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
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
