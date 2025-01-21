import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_app/constants.dart';

class ZoomControls extends StatefulWidget {
  const ZoomControls({super.key, required this.controller});
  final MobileScannerController controller;

  @override
  State<ZoomControls> createState() => _ZoomControlsState();
}

class _ZoomControlsState extends State<ZoomControls> {
  double zoomLevel = 0.0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                zoomLevel = (zoomLevel - 0.1).clamp(0.0, 1.0); // زيادة التكبير
              });
              widget.controller.setZoomScale(zoomLevel);
            },
            icon: Icon(
              Icons.remove,
              color: kIconColor,
            )),
        SliderTheme(
          data: const SliderThemeData(
            trackHeight: 2.0,
            trackShape: RectangularSliderTrackShape(),
            thumbShape: RoundSliderThumbShape(),
            overlayColor: Colors.white,
            overlayShape: RoundSliderOverlayShape(overlayRadius: 15.0),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 145,
            child: Slider(
              activeColor: Colors.white,
              inactiveColor: kIconColor,
              thumbColor: kPrimaryColor,
              value: zoomLevel,
              secondaryActiveColor: kIconColor,
              min: 0,
              max: 1,
              divisions: 250,
              onChanged: (value) {
                setState(() {
                  zoomLevel = value; // تحديث قيمة التكبير
                });
                widget.controller.setZoomScale(value); // تطبيق التكبير
              },
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              setState(() {
                zoomLevel = (zoomLevel + 0.1).clamp(0.0, 1.0); // زيادة التكبير
              });
              widget.controller.setZoomScale(zoomLevel);
            },
            icon: Icon(
              Icons.add,
              color: kIconColor,
            )),
      ],
    );
  }
}
