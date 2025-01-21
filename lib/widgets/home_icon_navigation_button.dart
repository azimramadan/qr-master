import 'package:flutter/material.dart';
import 'package:qr_code_app/constants.dart';

class HomeIconNavigationButton extends StatelessWidget {
  const HomeIconNavigationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.popUntil(context, (route) => route.isFirst);
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle, // شكل دائري
          boxShadow: [
            BoxShadow(
              color: kPrimaryColor, // لون الظل
              blurRadius: 10.0, // انتشار الظل
              spreadRadius: 2.0, // توسيع الظل
            ),
          ],
        ),
        child: CircleAvatar(
          radius: 35,
          backgroundColor: kPrimaryColor,
          child: Image.asset(
            'assets/images/bi_qr-code-scan.png',
            width: 40,
            height: 40,
          ),
        ),
      ),
    );
  }
}
