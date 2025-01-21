import 'package:flutter/material.dart';
import 'package:qr_code_app/widgets/custom_app_bar.dart';
import 'package:qr_code_app/widgets/generate_qr_code_form.dart';

class QrCodeGeneratorBody extends StatelessWidget {
  const QrCodeGeneratorBody({
    super.key,
    required this.arguments,
  });

  final String arguments;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        CustomAppBar(
          iconSize: 30,
          click: () {
            Navigator.pop(context);
          },
          text: arguments,
        ),
        Expanded(
          child: Center(
            child: GenerateQRCodeForm(arguments: arguments),
          ),
        )
      ],
    );
  }
}
