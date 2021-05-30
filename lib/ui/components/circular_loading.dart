import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircularLoadingComponent extends StatelessWidget {
  CircularLoadingComponent();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Get.theme.primaryColor,
        ),
      ),
    );
  }
}
