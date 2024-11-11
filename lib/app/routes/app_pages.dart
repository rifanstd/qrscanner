import 'package:get/get.dart';

import '../modules/generate_qr/bindings/generate_qr_binding.dart';
import '../modules/generate_qr/views/generate_qr_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/scan_qr/bindings/scan_qr_binding.dart';
import '../modules/scan_qr/views/scan_qr_view.dart';
import '../modules/scan_qr_result/bindings/scan_qr_result_binding.dart';
import '../modules/scan_qr_result/views/scan_qr_result_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.GENERATE_QR,
      page: () => const GenerateQrView(),
      binding: GenerateQrBinding(),
    ),
    GetPage(
      name: _Paths.SCAN_QR,
      page: () => const ScanQrView(),
      binding: ScanQrBinding(),
    ),
    GetPage(
      name: _Paths.SCAN_QR_RESULT,
      page: () => const ScanQrResultView(),
      binding: ScanQrResultBinding(),
    ),
  ];
}
