import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_app/widgets/background_widget.dart';
import 'package:qr_code_app/widgets/custom_action_button.dart';
import 'package:qr_code_app/widgets/custom_app_bar.dart';
import 'package:qr_code_app/widgets/custom_navigation_bar_widget.dart';
import 'package:qr_code_app/widgets/data_display_card.dart';
import 'package:qr_code_app/widgets/display_image.dart';
import 'package:qr_code_app/widgets/floating_message_widget.dart';

class DisplayQrCodePage extends StatelessWidget {
  DisplayQrCodePage({super.key});
  static String pageName = 'ShowQrCodePage';

  // GlobalKey للحصول على موقع CustomNavigationBar
  final GlobalKey navigationBarKey = GlobalKey();

  // دالة نسخ الرابط إلى الحافظة
  void copyToClipboard(String text, BuildContext context) {
    Clipboard.setData(ClipboardData(text: text)).then((_) {
      // إظهار رسالة عائمة فوق CustomNavigationBar
      showFloatingMessage(context, 'Copied to clipboard!');
    });
  }

  // دالة لعرض رسالة عائمة
  void showFloatingMessage(BuildContext context, String message) {
    // الحصول على موقع CustomNavigationBar باستخدام GlobalKey
    final RenderBox renderBox =
        navigationBarKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: offset.dy - 90, // فوق CustomNavigationBar بمقدار 50 بكسل
        left: offset.dx + (renderBox.size.width / 2) - 75, // توسيط الرسالة
        child: FloatingMessageWidget(
          message: message,
        ),
      ),
    );

    // إضافة الرسالة إلى الـOverlay
    Overlay.of(context).insert(overlayEntry);

    // إزالة الرسالة بعد 2 ثانية
    Future.delayed(Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    // استقبال الـ arguments
    final List<dynamic> args =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;

    // استخراج البيانات من arguments
    final dynamic barcodeValue = args[0]; // قيمة الباركود
    final dynamic barcodeImage = args[1]; // الصورة (File أو Uint8List)

    // تحويل barcodeValue إلى List<String> إذا كانت String
    List<String> barcodeList;
    if (barcodeValue is String) {
      barcodeList = [barcodeValue]; // تحويل النص إلى قائمة تحتوي على عنصر واحد
    } else if (barcodeValue is List<String>) {
      barcodeList =
          barcodeValue; // إذا كانت بالفعل List<String>، استخدمها مباشرة
    } else {
      barcodeList = []; // إذا كانت غير معروفة، استخدم قائمة فارغة
    }

    return Scaffold(
      body: BackgroundWidget(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            children: [
              CustomAppBar(
                click: () {
                  Navigator.pop(context);
                },
                text: 'QR Code',
              ),
              Spacer(
                flex: 1,
              ),
              DataDisplayCard(
                textList: barcodeList,
                onCopyPressed: () {
                  // استدعاء دالة النسخ
                  copyToClipboard(barcodeList.join('\n'), context);
                },
              ),
              DisplayImage(barcodeImage: barcodeImage),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  CustomActionButton(
                    barcodeImage: barcodeImage,
                    barcodeValue: barcodeList.join('\n'),
                    text: 'share',
                  ),
                  CustomActionButton(
                    text: 'save',
                  ),
                ],
              ),
              Spacer(
                flex: 6,
              ),
              CustomNavigationBar(
                key: navigationBarKey, // تعيين GlobalKey لـ CustomNavigationBar
              ),
            ],
          ),
        ),
      ),
    );
  }
}
