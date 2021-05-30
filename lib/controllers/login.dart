import 'package:flutter/material.dart';
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

  Future<void> authUser({
    required GlobalKey<FormState> form,
  }) async {
    if (form.currentState!.validate()) {
      form.currentState!.save();

      loginService.submitAuthUser(
          controller: this, userDto: loginHelper.userDto);
    }
  }
}
