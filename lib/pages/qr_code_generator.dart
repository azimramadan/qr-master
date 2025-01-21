import 'package:flutter/material.dart';
import 'package:qr_code_app/widgets/background_widget.dart';
import 'package:qr_code_app/widgets/qr_code_generator_body.dart';

class QrCodeGenerator extends StatelessWidget {
  static String pageName = 'QrCodeGenerator';

  const QrCodeGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      body: BackgroundWidget(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: QrCodeGeneratorBody(arguments: arguments),
        ),
      ),
    );
  }
}
