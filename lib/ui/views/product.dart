
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj_ctrl/constants/args.dart';
import 'package:proj_ctrl/controllers/home.dart';
import 'package:proj_ctrl/ui/components/products/product_input.dart';

class ProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Get.arguments == Arguments.argIsProductInput
          ? ProductInputComponent(
              productHelper: HomeController.to.productHelper,
            )
          : SizedBox(),
    );
  }
}
