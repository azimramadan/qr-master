import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_code_app/constants.dart';
import 'package:share_plus/share_plus.dart';

class CustomActionButton extends StatelessWidget {
  const CustomActionButton({
    super.key,
    required this.text,
    this.barcodeValue,
    this.barcodeImage,
  });
  final String text;
  final String? barcodeValue;
  final dynamic barcodeImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          iconSize: 34,
          onPressed: () {
            if (text == 'share') {
              shareBarcode(barcodeValue!, barcodeImage);
            } else {}
          },
          icon: Icon(
            text == 'share' ? Icons.share : Icons.save,
            color: Color.fromRGBO(51, 51, 51, 1),
          ),
          style: IconButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // تحديد الحواف
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(fontFamily: 'Itim', color: Colors.white),
        ),
      ],
    );
  }

  // دالة المشاركة
  void shareBarcode(String barcodeValue, dynamic barcodeImage) async {
    if (barcodeImage is File) {
      // إذا كانت الصورة من نوع File
      await Share.shareXFiles(
        [XFile(barcodeImage.path)],
        text: barcodeValue,
      );
    } else if (barcodeImage is Uint8List) {
      // إذا كانت الصورة من نوع Uint8List
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/barcode.png');
      await file.writeAsBytes(barcodeImage);
      await Share.shareXFiles(
        [XFile(file.path)],
        text: barcodeValue,
      );
    } else {
      // إذا لم تكن هناك صورة، شارك النص فقط
      await Share.share(barcodeValue);
    }
  }
}
