import 'package:get/get.dart';
import 'package:proj_ctrl/bindings/login.dart';
import 'package:proj_ctrl/controllers/helpers/login.dart';
import 'package:proj_ctrl/services/login.dart';

class LoginController extends GetxController {
  static LoginController get to {
    if (Get.isRegistered<LoginController>()) {
      return Get.find();
    } else {
      LoginBinding.startBindingLogin();
      return Get.find();
    }
  }

  final LoginHelper loginHelper;
  final LoginService loginService;

  LoginController({
    required this.loginHelper,
    required this.loginService,
  });
}
