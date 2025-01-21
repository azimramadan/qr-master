import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_app/widgets/barcode_scanner_widget.dart';
import 'package:qr_code_app/widgets/blinking_line_widget.dart';
import 'package:qr_code_app/widgets/bottom_corners_painter.dart';
import 'package:qr_code_app/widgets/camera_actions_bar.dart';
import 'package:qr_code_app/widgets/custom_navigation_bar_widget.dart';
import 'package:qr_code_app/widgets/top_corners_painter.dart';
import 'package:qr_code_app/widgets/zoom_controls_slider_widget.dart';

class ScanCodePageBody extends StatelessWidget {
  const ScanCodePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MobileScannerController controller = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
      returnImage: true,
      facing: CameraFacing.back,
    );

    return Stack(
      children: [
        BarcodeScannerWidget(
          controller: controller,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            children: [
              CameraActionsBar(
                controller: controller,
              ),
              Spacer(
                flex: 2,
              ),
              CustomPaint(
                size: Size(250, 130),
                painter: TopCornersPainter(),
              ),
              BlinkingLine(),
              CustomPaint(
                size: Size(250, 130),
                painter: BottomCornersPainter(),
              ),
              Spacer(
                flex: 1,
              ),
              ZoomControls(
                controller: controller,
              ),
              Spacer(
                flex: 2,
              ),
              CustomNavigationBar()
            ],
          ),
        ),
      ],
    );
  }
}
