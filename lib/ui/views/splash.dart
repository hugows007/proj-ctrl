
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj_ctrl/constants/image_uri.dart';
import 'package:proj_ctrl/controllers/splash.dart';
import 'package:sizer/sizer.dart';

class SplashView extends GetView<SplashController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Image.asset(ImageUri.splashLogo),
              Text(
                'Sistema de controle',
                style: TextStyle(
                  fontSize: 16.0.sp,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  SplashView(){
    controller;
  }
}
