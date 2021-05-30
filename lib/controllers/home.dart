import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj_ctrl/bindings/home.dart';
import 'package:proj_ctrl/controllers/helpers/home.dart';
import 'package:proj_ctrl/controllers/helpers/product.dart';
import 'package:proj_ctrl/services/product.dart';

class HomeController extends GetxService {
  static HomeController get to {
    if (Get.isRegistered<HomeController>()) {
      return Get.find();
    } else {
      HomeBinding.startBindingHome();
      return Get.find();
    }
  }

  @override
  void onReady() {
    homeHelper.isLoading.value = true;
    productService.submitListProducts().then((value) => {
      productHelper.products.value = List.castFrom(value),
      homeHelper.isLoading.value = false,
    });
    super.onReady();
  }

  final HomeHelper homeHelper;
  final ProductService productService;
  final ProductHelper productHelper;

  BuildContext? buildContext;

  HomeController({
    required this.homeHelper,
    required this.productService,
    required this.productHelper,
  });
}
