import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_app/constants.dart';
import 'package:qr_code_app/cubits/qr_history_cubit/qr_history_cubit.dart';
import 'package:qr_code_app/models/qr_model.dart';
import 'package:qr_code_app/pages/display_qr_code_page.dart';

class ImageService {
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> pickImageFromGallery(BuildContext context) async {
    final returnedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (returnedImage != null) {
      final File selectedImage = File(returnedImage.path);

      // فحص الصورة لمعرفة ما إذا كانت تحتوي على QR code
      final barcodeCapture =
          await MobileScannerController().analyzeImage(returnedImage.path);

      // التحقق من وجود باركود في الكائن المرجع
      if (barcodeCapture != null && barcodeCapture.barcodes.isNotEmpty) {
        final barcode = barcodeCapture.barcodes.first;
        BlocProvider.of<QrHistoryCubitCubit>(context).addInScanBox(
          QrModel(
            await convertFileToUint8List(selectedImage),
            date: DateFormat().add_yMEd().format(
                  DateTime.now(),
                ),
            qrData: barcode.rawValue!,
          ),
        );
        Navigator.pushNamed(context, DisplayQrCodePage.pageName,
            arguments: [barcode.rawValue, selectedImage]);
      } else {
        // إذا لم تكن تحتوي على QR code، نعرض رسالة للمستخدم
        _showNoQRCodeDialog(context);
      }
    }
  }

  void _showNoQRCodeDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color.fromRGBO(51, 51, 51, 1),
        title: Text(
          'No QR Code Found',
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          'The selected image does not contain a QR code.',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'OK',
              style: TextStyle(color: kPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }

  Future<Uint8List> convertFileToUint8List(File file) async {
    // قراءة الملف كـ Uint8List
    Uint8List bytes = await file.readAsBytes();
    return bytes;
  }
}
