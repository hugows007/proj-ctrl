import 'package:flutter/cupertino.dart';
import 'package:proj_ctrl/controllers/login.dart';
import 'package:proj_ctrl/data/model/user.dart';
import 'package:proj_ctrl/services/login.dart';

class LoginHelper {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UserDto userDto = UserDto();

  Future<void> authUser({
    required GlobalKey<FormState> form,
    required LoginService loginService,
    required LoginController loginController,
  }) async {
    if (form.currentState!.validate()) {
      form.currentState!.save();

      loginService.submitAuthUser(
          controller: loginController, userDto: userDto);
    }
  }
}