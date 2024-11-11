import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(const QRScanner());
}

class QRScanner extends StatelessWidget {
  const QRScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "QR Scanner and Generator",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
