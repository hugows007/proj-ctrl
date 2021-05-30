import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj_ctrl/constants/mock_uri.dart';
import 'package:proj_ctrl/controllers/login.dart';
import 'package:proj_ctrl/core/routes/app_routes.dart';
import 'package:proj_ctrl/data/model/product.dart';
import 'package:proj_ctrl/data/model/user.dart';

class ProductService {
  Future<List<ProductDto>> submitListProducts() async {
    String data = await DefaultAssetBundle.of(Get.overlayContext!)
        .loadString(MockUri.productsMock);
    Iterable l = json.decode(data);
    return List<ProductDto>.from(l.map((model)=> ProductDto.fromJson(model)));
  }

  Future<void> submitListToServer() async {

  }

  Future<void> submitSearchProduct() async {
//    String data = await DefaultAssetBundle.of(Get.overlayContext!)
//        .loadString(MockUri.userAuthMock);
//    List<dynamic> jsonResult = jsonDecode(data);
//    bool logged = jsonResult.any((element) =>
//        UserDto.fromJson(element).login == userDto.login &&
//        UserDto.fromJson(element).senha == userDto.senha);
//
//    if (logged) {
//      Get.offAllNamed(AppRoutes.HOME);
//    }else{
//      Get.showSnackbar(
//        GetBar(
//          messageText: Text(
//            'Usuário ou senha inválidos',
//            style: TextStyle(
//              color: Get.theme.accentColor,
//            ),
//          ),
//          duration: Duration(seconds: 2),
//        ),
//      );
//    }
  }
}
