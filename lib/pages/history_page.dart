import 'package:flutter/material.dart';
import 'package:qr_code_app/widgets/background_widget.dart';
import 'package:qr_code_app/widgets/custom_navigation_bar_widget.dart';
import 'package:qr_code_app/widgets/custom_title_page_widget.dart';
import 'package:qr_code_app/widgets/history_page_body.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});
  static String pageName = 'HistoryPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            children: [
              CustomTitlePageWidget(
                title: 'History',
              ),
              Expanded(
                child: HistoryPageBody(),
              ),
              CustomNavigationBar(),
            ],
          ),
        ),
      ),
    );
  }
}
