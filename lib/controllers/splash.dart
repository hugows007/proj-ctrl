import 'dart:async';

import 'package:get/get.dart';
import 'package:proj_ctrl/core/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Timer(
      Duration(seconds: 2),
          () => Get.offAllNamed(AppRoutes.LOGIN),
    );
    super.onReady();
  }
}
