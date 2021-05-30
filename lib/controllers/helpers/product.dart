import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:proj_ctrl/constants/args.dart';
import 'package:proj_ctrl/core/routes/app_routes.dart';
import 'package:proj_ctrl/data/model/product.dart';
import 'package:proj_ctrl/services/product.dart';
import 'package:sizer/sizer.dart';

class ProductHelper {
  TextEditingController entryController = TextEditingController();
  TextEditingController exitController = TextEditingController();
  TextEditingController valueController = TextEditingController();

  final products = List.empty().obs;
  final isLoading = false.obs;

  List<ProductDto> productsToSend = [];

  int? productIndex;
  ProductDto? productSelected;

  void sendToServer({
    required ProductService productService,
  }) {
    Get.defaultDialog(
      title: 'Enviar para o servidor?',
      middleText: 'As informações serão enviadas ao servidor',
      textCancel: 'Não',
      textConfirm: 'Sim',
      titleStyle: TextStyle(
        color: Get.theme.primaryColorDark,
        fontSize: 16.0.sp,
      ),
      middleTextStyle: TextStyle(
        color: Get.theme.primaryColorDark,
        fontSize: 12.0.sp,
      ),
      confirmTextColor: Get.theme.primaryColorDark,
      cancelTextColor: Get.theme.primaryColorDark,
      onConfirm: () => {
        productService.submitListToServer().then(
              (value) => confirmationSend(),
            ),
      },
    );
  }

  void confirmationSend() {
    Get.back();

    Get.defaultDialog(
      title: '',
      middleText: 'Enviado com sucesso!',
      textConfirm: 'Fechar',
      middleTextStyle: TextStyle(
        color: Get.theme.primaryColorDark,
        fontSize: 16.0.sp,
      ),
      confirmTextColor: Get.theme.primaryColorDark,
      cancelTextColor: Get.theme.primaryColorDark,
      onConfirm: Get.back,
    );
  }

  void sendToInputProduct(index) {
    productIndex = index;
    productSelected = products[index];
    Get.toNamed(
      AppRoutes.internal(AppRoutes.PRODUCT),
      arguments: Arguments.argIsProductInput,
    );
  }

  void updateProduct() {
    isLoading.value = true;

    productSelected!.entrada = entryController.text;
    productSelected!.saida = exitController.text;
    productSelected!.preco = valueController.text;

    products[productIndex!].entrada = entryController.text;
    products[productIndex!].saida = exitController.text;
    products[productIndex!].preco = valueController.text;

    entryController.text = '';
    exitController.text = '';
    valueController.text = '';

    productsToSend.add(productSelected!);

    Duration duration = Duration(seconds: 2);

    Get.showSnackbar(
      GetBar(
        messageText: Text(
          'Alterações registradas com sucesso',
          style: TextStyle(
            color: Get.theme.accentColor,
          ),
        ),
        duration: duration,
      ),
    );

    Timer(
        duration,
        () => {
              Get.offNamed(AppRoutes.HOME),
              isLoading.value = false,
            });
  }
}
