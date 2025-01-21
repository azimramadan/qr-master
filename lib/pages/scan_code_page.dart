import 'package:flutter/material.dart';
import 'package:qr_code_app/widgets/scan_code_page_body.dart';

class ScanCodePage extends StatelessWidget {
  const ScanCodePage({super.key});
  static String pageName = 'ScanCodePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScanCodePageBody(),
      ),
    );
  }
}
