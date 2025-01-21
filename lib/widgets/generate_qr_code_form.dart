import 'package:flutter/material.dart';
import 'package:qr_code_app/constants.dart';
import 'package:qr_code_app/widgets/qr_code_form_fields.dart';

class GenerateQRCodeForm extends StatelessWidget {
  const GenerateQRCodeForm({
    super.key,
    required this.arguments,
  });

  final String arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      decoration: BoxDecoration(
        color: Color.fromRGBO(59, 59, 59, 0.78),
        borderRadius: BorderRadius.circular(12),
        border: Border.symmetric(
            horizontal: BorderSide(width: 2.5, color: kPrimaryColor)),
      ),
      child: QRCodeFormFields(arguments: arguments),
    );
  }
}
