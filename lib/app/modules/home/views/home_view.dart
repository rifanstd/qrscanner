import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrscanner/app/core/values/app_icons.dart';

import '../controllers/home_controller.dart';
import '../local_widgets/menu_item.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              const Center(
                child: Text("QR Scanner", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  "Generate and Scan your QR Code",
                ),
              ),
              const SizedBox(height: 64),
              MenuItem(
                title: "Generate QR Code",
                iconPath: AppIcons.generateQr,
                onTap: () {},
              ),
              const SizedBox(height: 20),
              MenuItem(
                title: "Scan QR Code",
                iconPath: AppIcons.scanQr,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
