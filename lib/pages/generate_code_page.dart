import 'package:flutter/material.dart';
import 'package:qr_code_app/widgets/generate_code_page_body.dart';

class GenerateCodePage extends StatelessWidget {
  const GenerateCodePage({super.key});
  static String pageName = 'GenerateCodePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(51, 51, 51, 0.84),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: GenerateCodePageBody(),
        ),
      ),
    );
  }
}
