import 'package:get/get.dart';

import '../modules/generate_qr/bindings/generate_qr_binding.dart';
import '../modules/generate_qr/views/generate_qr_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

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
  ];
}
