import 'package:get/get.dart';
import 'package:proj_ctrl/controllers/splash.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    startBindingSplash();
  }

  static void startBindingSplash() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
  }
}
