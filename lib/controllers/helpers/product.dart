import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:proj_ctrl/constants/args.dart';
import 'package:proj_ctrl/core/routes/app_routes.dart';
import 'package:proj_ctrl/data/model/product.dart';
import 'package:proj_ctrl/services/product.dart';
import 'package:sizer/sizer.dart';

class ProductHelper {
  TextEditingController entryController = TextEditingController();
  TextEditingController exitController = TextEditingController();
  MoneyMaskedTextController valueController = MoneyMaskedTextController(
    leftSymbol: 'R\$ ',
    decimalSeparator: ',',
    precision: 2,
  );

  TextEditingController marketController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  MaskTextInputFormatter maskEntry =
      MaskTextInputFormatter(mask: '##########', initialText: '0');
  MaskTextInputFormatter maskExit =
      MaskTextInputFormatter(mask: '##########', initialText: '0');
  MaskTextInputFormatter maskDate =
      MaskTextInputFormatter(mask: '##/##/####', initialText: '0');

  final products = List.empty().obs;
  final isLoading = false.obs;
  final market = 'Loja A'.obs;

  List<ProductDto> productsToSend = [];

  double amount = 0;
  double count = 0;

  int? productIndex;
  ProductDto? productSelected;

  List<String> markets = ['Loja A', 'Loja B', 'Loja C', 'Loja D'];

  void sendToServer({
    required ProductService productService,
  }) {
    Get.dialog(Card(
      margin: EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 2.0.w),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 4.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0.h),
              child: Text(
                'Entre com as informações para enviar ao servidor',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0.sp,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Obx(
                    () => DropdownButtonFormField(
                      value: market.value,
                      isDense: true,
                      onChanged: (String? newValue) {
                        market.value = newValue!;
                      },
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(top: 10, bottom: 10, left: 3.0.w),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Get.theme.primaryColorDark),
                            gapPadding: 5),
                        counterText: "",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                            borderSide:
                                BorderSide(color: Get.theme.primaryColorDark)),
                        labelText: 'Lojas',
                        labelStyle: TextStyle(
                          letterSpacing: 0,
                          color: Get.theme.primaryColorDark,
                          fontSize: 10.0.sp,
                        ),
                      ),
                      items: markets.map((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 2.0.w,
                ),
                Expanded(
                  child: TextFormField(
                    controller: dateController,
                    inputFormatters: [maskDate],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(top: 10, bottom: 10, left: 3.0.w),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Get.theme.primaryColorDark),
                          gapPadding: 5),
                      counterText: "",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                          borderSide:
                              BorderSide(color: Get.theme.primaryColorDark)),
                      labelText: 'Data',
                      labelStyle: TextStyle(
                        letterSpacing: 0,
                        color: Get.theme.primaryColorDark,
                        fontSize: 10.0.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.0.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0.h),
              child: Text(
                'Quantidade: ${count.toStringAsFixed(0)}     Total: ${getAmount()}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0.sp,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 1.0.h),
              width: double.infinity,
              child: OutlinedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.resolveWith((states) => 10),
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Get.theme.accentColor),
                  foregroundColor: MaterialStateColor.resolveWith(
                      (states) => Get.theme.primaryColorDark),
                ),
                onPressed: () => confirmationSend(),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Enviar para o servidor',
                    style: TextStyle(
                        color: Get.theme.primaryColorDark, fontSize: 15.0.sp),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: Get.back,
              child: Text('Cancelar'),
            ),
          ],
        ),
      ),
    ));
  }

  void confirmationSend() {
    Get.back();

    marketController.text = '';
    dateController.text = '';

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

  void updateProduct({required GlobalKey<FormState> form}) {
    if (form.currentState!.validate()) {
      isLoading.value = true;

      productSelected!.entrada = entryController.text;
      productSelected!.saida = exitController.text;
      productSelected!.preco = valueController.text;

      products[productIndex!].entrada = entryController.text;
      products[productIndex!].saida = exitController.text;
      products[productIndex!].preco = valueController.text;

      amount += valueController.numberValue;
      count += double.parse(entryController.text) -
          double.parse(exitController.text);

      entryController.text = '';
      exitController.text = '';
      valueController.text = '0000';

      productsToSend.add(productSelected!);

      Get.offAllNamed(
        AppRoutes.HOME,
        arguments: Arguments.argAddProduct,
      );

      isLoading.value = false;
    }
  }

  double getHeight(ProductDto productDto) {
    return productDto.entrada != '0' ? 25.0.h : 11.0.h;
  }

  String getAmount() {
    valueController.text = (count * double.parse(amount.toStringAsFixed(2))).toStringAsFixed(2);
    return valueController.text;
  }
}
