import 'package:flutter/material.dart';
import 'package:qr_code_app/constants.dart';
import 'package:qr_code_app/pages/scan_code_page.dart';

class WelcomePage extends StatelessWidget {
  static String pageName = 'WelcomePage';

  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff333333),
      body: Column(
        children: [
          Spacer(),
          Image.asset('assets/images/image_splash.png'),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 50.0, bottom: 30, right: 50),
            child: Text(
              'Go and enjoy our features for free and make your life easy with us.',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 34, left: 30, right: 30),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                backgroundColor: kPrimaryColor,
                minimumSize: Size(double.infinity, 55),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, ScanCodePage.pageName);
              },
              child: Row(
                children: [
                  Spacer(),
                  Text(
                    'Let’s Start',
                    style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward,
                    color: Color(0xff333333),
                    size: 25,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
