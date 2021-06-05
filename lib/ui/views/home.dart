import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj_ctrl/constants/args.dart';
import 'package:proj_ctrl/controllers/home.dart';
import 'package:sizer/sizer.dart';

class HomeView extends GetView<HomeController> {


  @override
  Widget build(BuildContext context) {
    controller.buildContext = context;

    return Obx(
      () => Scaffold(
        appBar: controller.homeHelper.buildBar(context),
        body: Stack(
          children: [
            ListView(
              children: controller.homeHelper.isSearching.isTrue
                  ? controller.homeHelper.buildSearchList(
                      productHelper: controller.productHelper,
                    )
                  : controller.homeHelper.buildList(
                      productHelper: controller.productHelper,
                    ),
            ),
            Positioned(
              bottom: 5.0.h,
              right: 5.0.w,
              child: FloatingActionButton(
                child: Icon(
                  Icons.cloud_upload,
                  color: Colors.white,
                ),
                backgroundColor: Colors.green,
                onPressed: () => controller.productHelper.sendToServer(
                  productService: controller.productService,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  HomeView(){
    if(Get.arguments == Arguments.argAddProduct){
      Timer(
        Duration(microseconds: 100),
          () => Get.showSnackbar(
            GetBar(
              messageText: Text(
                'Alterações registradas com sucesso',
                style: TextStyle(
                  color: Get.theme.accentColor,
                ),
              ),
              duration: Duration(seconds: 2),
            ),
          ),
      );
    }
  }
}
