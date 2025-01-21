import 'package:flutter/material.dart';
import 'package:qr_code_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    required this.onSaved,
  });

  final String hintText;
  final int? maxLines;
  final Function(String?) onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'faild is required';
        }
        return null;
      },
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color.fromRGBO(217, 217, 217, 0.34),
        ),
        filled: true,
        fillColor: Color.fromRGBO(51, 51, 51, 0.8),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(217, 217, 217, 1),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(217, 217, 217, 1),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      style: TextStyle(color: Colors.white),
    );
  }
}
