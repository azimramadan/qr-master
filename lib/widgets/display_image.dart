import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_app/constants.dart';

class DisplayImage extends StatelessWidget {
  const DisplayImage({
    super.key,
    required this.barcodeImage,
  });

  final dynamic barcodeImage;

  @override
  Widget build(BuildContext context) {
    if (barcodeImage is File) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 36, vertical: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: kPrimaryColor,
            width: 3.5,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.file(
            barcodeImage,
            height: 250,
            fit: BoxFit.cover,
            // عرض الصورة بحجمها الأصلي مع الحفاظ على النسبة
          ),
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 36, vertical: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: kPrimaryColor,
            width: 3.5,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.memory(
              barcodeImage,
              height: 250,
              fit: BoxFit.fill,
              // عرض الصورة بحجمها الأصلي مع الحفاظ على النسبة
            ),
          ),
        ),
      );
    }
  }
}
