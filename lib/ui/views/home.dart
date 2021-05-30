import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj_ctrl/controllers/home.dart';
import 'package:proj_ctrl/ui/components/circular_loading.dart';
import 'package:proj_ctrl/ui/components/products/products_list.dart';
import 'package:sizer/sizer.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    controller.buildContext = context;

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: controller.homeHelper.isSearching.isTrue
              ? const BackButton()
              : Container(),
          title: controller.homeHelper.isSearching.isTrue
              ? controller.homeHelper.buildSearchField()
              : Text('Bem vindo ao sistema'),
          actions: controller.homeHelper.buildActions(),
        ),
        body: Stack(
          children: [
            controller.homeHelper.isLoading.isTrue
                ? CircularLoadingComponent()
                : ProductsListComponent(
                    productHelper: controller.productHelper,
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
}
