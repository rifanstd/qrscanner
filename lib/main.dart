import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const QRScanner());
}

class QRScanner extends StatelessWidget {
  const QRScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "QR Scanner and Generator",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      themeMode: ThemeMode.light,
      theme: ThemeData.light(
        useMaterial3: true,
      ).copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
    );
  }
}
