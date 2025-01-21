import 'package:flutter/material.dart';
import 'package:qr_code_app/widgets/custom_navigation_bar_body.dart';
import 'package:qr_code_app/widgets/home_icon_navigation_button.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomNavigationBarBody(),
        Positioned(
          left: 0,
          right: 0,
          top: -40,
          child: HomeIconNavigationButton(),
        )
      ],
    );
  }
}
