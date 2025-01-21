import 'package:flutter/material.dart';

class TextLableWidget extends StatelessWidget {
  const TextLableWidget({super.key, required this.lable});
  final String lable;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            lable,
            style: TextStyle(
              color: Color.fromRGBO(217, 217, 217, 1),
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
