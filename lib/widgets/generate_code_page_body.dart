import 'package:flutter/material.dart';
import 'package:qr_code_app/pages/qr_code_generator.dart';
import 'package:qr_code_app/widgets/custom_navigation_bar_widget.dart';
import 'package:qr_code_app/widgets/custom_title_page_widget.dart';
import 'package:qr_code_app/widgets/grid_icon_item.dart';

class GenerateCodePageBody extends StatelessWidget {
  const GenerateCodePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTitlePageWidget(
          title: 'Generate QR',
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 45),
            child: GridView.count(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3, // عدد الأعمدة
              crossAxisSpacing: 20, // المسافة الأفقية بين العناصر
              mainAxisSpacing: 50, // المسافة الرأسية بين العناصر
              children: List.generate(
                12,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, QrCodeGenerator.pageName,
                          arguments: iconsInfo.keys.elementAt(index));
                    },
                    child: GridIconItem(
                      iconName: iconsInfo.keys.elementAt(index),
                      icon: iconsInfo.values.elementAt(index),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        CustomNavigationBar(),
      ],
    );
  }
}

Map<String, dynamic> iconsInfo = {
  'Text': 'assets/images/textICon.png',
  'Website': 'assets/images/Vectorweb.png',
  'Wi-Fi': Icons.wifi,
  'Event': Icons.event_available,
  'Contact': Icons.perm_contact_cal,
  'Business': Icons.business,
  'Location': Icons.share_location_sharp,
  'WhatsApp': 'assets/images/Vector_3.png',
  'Email': Icons.mail,
  'Twitter': 'assets/images/Vector_i.png',
  'Instagram': 'assets/images/Vector_4.png',
  'Phone': Icons.phone_callback_sharp,
};
