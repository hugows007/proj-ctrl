import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj_ctrl/constants/image_uri.dart';
import 'package:proj_ctrl/controllers/login.dart';
import 'package:sizer/sizer.dart';

class LoginView extends GetView<LoginController> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: form,
                child: Column(
                  children: [
                    Container(
                      child: Image.asset(ImageUri.splashLogo),
                      width: 30.0.w,
                      height: 30.0.h,
                    ),
                    TextFormField(
                      controller: controller.loginHelper.loginController,
                      keyboardType: TextInputType.text,
                      onSaved: (_) => controller.loginHelper.userDto.login =
                          controller.loginHelper.loginController.text,
                    ),
                    SizedBox(
                      height: 20.0.w,
                    ),
                    TextFormField(
                      controller: controller.loginHelper.passwordController,
                      keyboardType: TextInputType.text,
                      onSaved: (_) => controller.loginHelper.userDto.senha =
                          controller.loginHelper.passwordController.text,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0.w),
                child: OutlinedButton(
                  onPressed: () => controller.loginHelper.authUser(form: form, loginService: controller.loginService, loginController: controller),
                  child: Text('Logar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
