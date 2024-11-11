import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qrscanner/app/core/utils/extensions/qr_image_extensions.dart';

class GenerateQrController extends GetxController {
  final GlobalKey<FormState> qrFormKey = GlobalKey<FormState>();
  final TextEditingController qrTextController = TextEditingController();

  final qrData = "".obs;
  final qrImage = Rxn<QrImage>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    qrTextController.dispose();
    super.onClose();
  }

  void generateQr() {
    if (qrFormKey.currentState!.validate()) {
      qrFormKey.currentState!.save();
      qrData.value = qrTextController.text;

      final QrCode qrCode = QrCode.fromData(
        data: qrData.value,
        errorCorrectLevel: QrErrorCorrectLevel.H,
      );
      qrImage.value = QrImage(qrCode);
    }
  }

  Future<void> saveQr(BuildContext context) async {
    if (qrImage.value != null) {
      final path = await qrImage.value!.exportAsImage(context);
      Get.snackbar(
        "Success",
        "QR Code saved to $path",
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
    }
  }
}
