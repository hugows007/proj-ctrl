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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 15.0.h),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 2.0.w),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(2.0.h),
                    child: Form(
                      key: form,
                      child: Column(
                        children: [
                          Container(
                            child: Image.asset(ImageUri.splashLogo),
                            width: 20.0.w,
                            height: 20.0.h,
                          ),
                          TextFormField(
                            controller: controller.loginHelper.loginController,
                            keyboardType: TextInputType.text,
                            onSaved: (_) =>
                                controller.loginHelper.userDto.login =
                                    controller.loginHelper.loginController.text,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 15),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Get.theme.primaryColorDark),
                                  gapPadding: 5),
                              counterText: "",
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                  borderSide: BorderSide(
                                      color: Get.theme.primaryColorDark)),
                              labelText: 'Login',
                              labelStyle: TextStyle(
                                letterSpacing: 0,
                                color: Get.theme.primaryColorDark,
                                fontSize: 10.0.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0.w,
                          ),
                          TextFormField(
                            controller:
                                controller.loginHelper.passwordController,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            onSaved: (_) => controller
                                    .loginHelper.userDto.senha =
                                controller.loginHelper.passwordController.text,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 15),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Get.theme.primaryColorDark),
                                  gapPadding: 5),
                              counterText: "",
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                  borderSide: BorderSide(
                                      color: Get.theme.primaryColorDark)),
                              labelText: 'Senha',
                              labelStyle: TextStyle(
                                letterSpacing: 0,
                                color: Get.theme.primaryColorDark,
                                fontSize: 10.0.sp,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5.0.h),
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.resolveWith(
                                    (states) => 10),
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => Get.theme.accentColor),
                                foregroundColor: MaterialStateColor.resolveWith(
                                    (states) => Get.theme.primaryColorDark),
                              ),
                              onPressed: () => controller.loginHelper.authUser(
                                  form: form,
                                  loginService: controller.loginService,
                                  loginController: controller),
                              child: Text(
                                'Entrar',
                                style: TextStyle(
                                    color: Get.theme.primaryColorDark,
                                    fontSize: 15.0.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
