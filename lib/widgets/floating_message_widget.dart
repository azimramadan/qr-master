import 'package:flutter/material.dart';

class FloatingMessageWidget extends StatelessWidget {
  const FloatingMessageWidget({
    super.key,
    required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(1000),
        ),
        child: Text(
          message,
          style: TextStyle(
              color: Color.fromRGBO(51, 51, 51, 0.84), fontFamily: 'Itim'),
        ),
      ),
    );
  }
}
