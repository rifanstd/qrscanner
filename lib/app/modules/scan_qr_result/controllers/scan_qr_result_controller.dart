import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/values/arguments/route_arguments.dart';

class ScanQrResultController extends GetxController {
  String qrCodeData = "";
  Uint8List? qrCodeImage;

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void initData() {
    qrCodeData = Get.arguments[ScanQrResultArgs.qrCodeData];
    qrCodeImage = Get.arguments[ScanQrResultArgs.qrCodeImage];
  }

  void copyQrCodeData() => Clipboard.setData(ClipboardData(text: qrCodeData));
}
