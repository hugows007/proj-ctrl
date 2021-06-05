import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:proj_ctrl/controllers/helpers/product.dart';
import 'package:proj_ctrl/ui/components/circular_loading.dart';
import 'package:sizer/sizer.dart';

class ProductInputComponent extends StatelessWidget {
  final GlobalKey<FormState> form = GlobalKey<FormState>();

  final ProductHelper productHelper;

  ProductInputComponent({
    required this.productHelper,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 2.0.h),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 2.0.w),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Card(
                elevation: 5,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 2.0.h, horizontal: 5.0.w),
                  child: Form(
                    key: form,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0.h),
                          child: Text(
                            'Informe a quantidade de produtos na entrada, saída e o valor total',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.0.sp,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: productHelper.entryController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            productHelper.maskEntry
                          ],
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
                              borderSide:
                                  BorderSide(color: Get.theme.primaryColorDark),
                            ),
                            labelText: 'Entrada',
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
                          controller: productHelper.exitController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            productHelper.maskExit
                          ],
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                top: 10, bottom: 10, left: 3.0.w),
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
                            labelText: 'Saída',
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
                          controller: productHelper.valueController,
                          keyboardType: TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                top: 10, bottom: 10, left: 3.0.w),
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
                            labelText: 'Valor',
                            labelStyle: TextStyle(
                              letterSpacing: 0,
                              color: Get.theme.primaryColorDark,
                              fontSize: 10.0.sp,
                            ),
                          ),
                        ),
                        Obx(
                          () => productHelper.isLoading.isFalse
                              ? Container(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 5.0.h),
                                  width: double.infinity,
                                  child: OutlinedButton(
                                    style: ButtonStyle(
                                      elevation:
                                          MaterialStateProperty.resolveWith(
                                              (states) => 10),
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) =>
                                                  Get.theme.accentColor),
                                      foregroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) =>
                                                  Get.theme.primaryColorDark),
                                    ),
                                    onPressed: () =>
                                        productHelper.updateProduct(
                                      form: form,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Text(
                                        'Registrar',
                                        style: TextStyle(
                                            color: Get.theme.primaryColorDark,
                                            fontSize: 15.0.sp),
                                      ),
                                    ),
                                  ),
                                )
                              : CircularLoadingComponent(),
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
    );
  }
}
