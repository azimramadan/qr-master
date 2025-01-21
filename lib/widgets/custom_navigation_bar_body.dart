import 'package:flutter/material.dart';
import 'package:qr_code_app/constants.dart';
import 'package:qr_code_app/pages/generate_code_page.dart';
import 'package:qr_code_app/pages/history_page.dart';
import 'package:qr_code_app/widgets/custom_navigation_icon_button.dart';

class CustomNavigationBarBody extends StatefulWidget {
  const CustomNavigationBarBody({
    super.key,
  });

  @override
  State<CustomNavigationBarBody> createState() =>
      _CustomNavigationBarBodyState();
}

class _CustomNavigationBarBodyState extends State<CustomNavigationBarBody> {
  Color historyIconColor = kIconColor, generateIconColor = kIconColor;
  @override
  Widget build(BuildContext context) {
    String? currentRoute = ModalRoute.of(context)?.settings.name;
    if (currentRoute == HistoryPage.pageName) {
      historyIconColor = kPrimaryColor;
    } else if (currentRoute == GenerateCodePage.pageName) {
      generateIconColor = kPrimaryColor;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: kPrimaryColor,
            width: 2.5,
          ),
        ),
        borderRadius: BorderRadius.circular(12),
        color: Color.fromRGBO(51, 51, 51, 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomNavigationIconButton(
            text: 'Generate',
            icon: Icons.qr_code,
            onTap: () {
              setState(() {});
              Navigator.pushNamedAndRemoveUntil(
                context,
                GenerateCodePage.pageName, // اسم الـ route المراد الانتقال إليه
                (route) => route.isFirst, // الإبقاء على الصفحة الأولى فقط
              );
            },
            color: generateIconColor,
          ),
          CustomNavigationIconButton(
            text: 'History',
            icon: Icons.history,
            onTap: () {
              setState(() {});
              Navigator.pushNamedAndRemoveUntil(
                context,
                HistoryPage.pageName, // اسم الـ route المراد الانتقال إليه
                (route) => route.isFirst, // الإبقاء على الصفحة الأولى فقط
              );
            },
            color: historyIconColor,
          ),
        ],
      ),
    );
  }
}
