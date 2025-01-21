import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_app/cubits/qr_history_cubit/qr_history_cubit.dart';
import 'package:qr_code_app/models/qr_model.dart';
import 'package:qr_code_app/pages/display_qr_code_page.dart';

class BarcodeScannerWidget extends StatelessWidget {
  const BarcodeScannerWidget({
    super.key,
    required this.controller,
  });
  final MobileScannerController controller;

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      controller: controller,
      onDetect: (capture) async {
        final List<Barcode> barcodes = capture.barcodes;
        final Uint8List? image = capture.image;
        if (image != null && barcodes.isNotEmpty) {
          final barcode = barcodes.first;
          BlocProvider.of<QrHistoryCubitCubit>(context).addInScanBox(
            QrModel(
              image,
              date: DateFormat().add_yMEd().format(
                    DateTime.now(),
                  ),
              qrData: barcode.rawValue!,
            ),
          );
          Navigator.pushNamed(context, DisplayQrCodePage.pageName,
              arguments: [barcode.rawValue, image]);
        }
      },
    );
  }
}
