import 'package:get/get.dart';

import '../controllers/scan_qr_result_controller.dart';

class ScanQrResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanQrResultController>(
      () => ScanQrResultController(),
    );
  }
}
