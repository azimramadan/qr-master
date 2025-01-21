import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_app/services/image_service.dart';
import 'package:qr_code_app/widgets/animated_icon_switcher.dart';

class CameraActionsBar extends StatefulWidget {
  const CameraActionsBar({
    super.key,
    required this.controller,
  });
  final MobileScannerController controller;

  @override
  State<CameraActionsBar> createState() => _CameraActionsBarState();
}

class _CameraActionsBarState extends State<CameraActionsBar> {
  bool isFlashOn = false;
  bool isFrontCamera = false;
  File? selectedImage;

  final ImageService _imageService = ImageService();

  void toggleFlash() {
    setState(() {
      isFlashOn = !isFlashOn;
      widget.controller.toggleTorch(); // تفعيل أو إيقاف الفلاش
    });
  }

  void switchCamera() {
    setState(() {
      isFlashOn = false;
      isFrontCamera = !isFrontCamera;
      widget.controller.switchCamera(); // تبديل الكاميرا
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () async {
              await _imageService.pickImageFromGallery(context);
            },
            icon: Icon(
              Icons.image,
              color: Colors.white,
              size: 30,
            ),
          ),
          AnimatedIconSwitcher(
            onPressed: toggleFlash,
            keyValue: isFlashOn,
            icon_1: Icons.flash_on,
            icon_2: Icons.flash_off,
          ),
          AnimatedIconSwitcher(
            onPressed: switchCamera,
            keyValue: isFrontCamera,
            icon_1: Icons.camera_front,
            icon_2: Icons.camera_rear,
          ),
        ],
      ),
    );
  }
}
