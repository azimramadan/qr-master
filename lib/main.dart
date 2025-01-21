import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:qr_code_app/cubits/create_qr_code_cubit/create_qr_cubit.dart';
import 'package:qr_code_app/cubits/qr_history_cubit/qr_history_cubit.dart';
import 'package:qr_code_app/helpers/shared_preferences_helper.dart';
import 'package:qr_code_app/models/qr_model.dart';
import 'package:qr_code_app/pages/generate_code_page.dart';
import 'package:qr_code_app/pages/history_page.dart';
import 'package:qr_code_app/pages/welcome%20_page.dart';
import 'package:qr_code_app/pages/qr_code_generator.dart';
import 'package:qr_code_app/pages/scan_code_page.dart';
import 'package:qr_code_app/pages/display_qr_code_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(QrModelAdapter());
  await Hive.openBox<QrModel>('qrScanBox');
  await Hive.openBox<QrModel>('qrCreateBox');
  final bool isFirstTime = await SharedPreferencesHelper.checkFirstTime();
  runApp(QRcodeApp(isFirstTime: isFirstTime));
}

class QRcodeApp extends StatelessWidget {
  final bool isFirstTime;
  const QRcodeApp({super.key, required this.isFirstTime});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreateQrCubit(),
        ),
        BlocProvider(
          create: (context) => QrHistoryCubitCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: 'Itim'),
        routes: {
          GenerateCodePage.pageName: (context) => const GenerateCodePage(),
          ScanCodePage.pageName: (context) => const ScanCodePage(),
          DisplayQrCodePage.pageName: (context) => DisplayQrCodePage(),
          QrCodeGenerator.pageName: (context) => QrCodeGenerator(),
          HistoryPage.pageName: (context) => HistoryPage(),
          WelcomePage.pageName: (context) => WelcomePage(),
        },
        initialRoute: isFirstTime
            ? WelcomePage.pageName // أول مرة
            : ScanCodePage.pageName, //ScanCodePage.pageName,
      ),
    );
  }
}
