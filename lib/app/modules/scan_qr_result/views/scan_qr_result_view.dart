import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/scan_qr_result_controller.dart';
import '../local_widgets/qr_code_data_section.dart';
import '../local_widgets/qr_code_image_section.dart';

class ScanQrResultView extends GetView<ScanQrResultController> {
  const ScanQrResultView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Scan QR Result',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(minHeight: Get.height, minWidth: Get.width),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "QR Code Data",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              QRCodeDataSection(
                data: controller.qrCodeData,
                onCopyIconClicked: controller.copyQrCodeData,
              ),
              const SizedBox(height: 20),
              const Text(
                "QR Code Image",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              if (controller.qrCodeImage != null) QRCodeImageSection(imageData: controller.qrCodeImage!),
            ],
          ),
        ),
      ),
    );
  }
}
