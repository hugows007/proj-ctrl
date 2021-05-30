import 'package:get/get.dart';
import 'package:proj_ctrl/controllers/helpers/login.dart';
import 'package:proj_ctrl/controllers/login.dart';
import 'package:proj_ctrl/services/login.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    startBindingLogin();
  }

  static void startBindingLogin() {
    Get.lazyPut<LoginController>(
      () => LoginController(
        loginHelper: LoginHelper(),
        loginService: LoginService(),
      ),
    );
  }
}
