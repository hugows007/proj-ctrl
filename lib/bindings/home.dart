import 'package:get/get.dart';
import 'package:proj_ctrl/controllers/helpers/home.dart';
import 'package:proj_ctrl/controllers/helpers/product.dart';
import 'package:proj_ctrl/controllers/home.dart';
import 'package:proj_ctrl/services/product.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    startBindingHome();
  }

  static void startBindingHome() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        homeHelper: HomeHelper(),
        productService: ProductService(),
        productHelper: ProductHelper(),
      ),
    );
  }
}
