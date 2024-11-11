import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qrscanner/app/core/values/arguments/route_arguments.dart';
import 'package:qrscanner/app/routes/app_pages.dart';

class ScanQrController extends GetxController with WidgetsBindingObserver {
  final MobileScannerController mobileScannerController = MobileScannerController(
    autoStart: false,
    useNewCameraSelector: true,
    returnImage: true,
  );

  StreamSubscription<Object?>? _subscription;

  String qrCodeData = '';
  Uint8List? qrCodeImage;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    _subscription = mobileScannerController.barcodes.listen(_onQrCodeDetected);
    unawaited(mobileScannerController.start());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  Future<void> onClose() async {
    WidgetsBinding.instance.removeObserver(this);
    unawaited(_subscription?.cancel());
    _subscription = null;
    await mobileScannerController.dispose();
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        return;
      case AppLifecycleState.resumed:
        _subscription = mobileScannerController.barcodes.listen(_onQrCodeDetected);
        unawaited(mobileScannerController.start());
      case AppLifecycleState.inactive:
        unawaited(_subscription?.cancel());
        _subscription = null;
        unawaited(mobileScannerController.stop());
    }
  }

  void _onQrCodeDetected(BarcodeCapture? capture) {
    if (capture == null) {
      return;
    }

    qrCodeData = capture.barcodes.firstOrNull?.displayValue ?? '';
    qrCodeImage = capture.image;

    Get.log(qrCodeData);

    if (qrCodeData.isNotEmpty && qrCodeImage != null) {
      Get.offAndToNamed(Routes.SCAN_QR_RESULT, arguments: {
        ScanQrResultArgs.qrCodeData: qrCodeData,
        ScanQrResultArgs.qrCodeImage: qrCodeImage,
      });
    }
  }
}
