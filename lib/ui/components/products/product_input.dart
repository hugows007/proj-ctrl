import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proj_ctrl/controllers/helpers/product.dart';
import 'package:proj_ctrl/ui/components/circular_loading.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class ProductInputComponent extends StatelessWidget {
  final GlobalKey<FormState> form = GlobalKey<FormState>();

  final ProductHelper productHelper;

  ProductInputComponent({
    required this.productHelper,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: form,
              child: Column(
                children: [
                  TextFormField(
                    controller: productHelper.entryController,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 20.0.w,
                  ),
                  TextFormField(
                    controller: productHelper.exitController,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 20.0.w,
                  ),
                  TextFormField(
                    controller: productHelper.valueController,
                    keyboardType: TextInputType.numberWithOptions(
                      signed: true,
                      decimal: true,
                    ),
                  ),
                  SizedBox(
                    height: 20.0.w,
                  ),
                  Text('${DateFormat('dd/MM/yyyy').format(DateTime.now())}'),
                ],
              ),
            ),
            Obx(
              () => Padding(
                padding: EdgeInsets.all(20.0.w),
                child: productHelper.isLoading.isFalse
                    ? OutlinedButton(
                        onPressed: () => productHelper.updateProduct(),
                        child: Text('Registrar'),
                      )
                    : CircularLoadingComponent(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
