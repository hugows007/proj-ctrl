import 'package:get/get.dart';
import 'package:proj_ctrl/bindings/home.dart';
import 'package:proj_ctrl/bindings/login.dart';
import 'package:proj_ctrl/bindings/splash.dart';
import 'package:proj_ctrl/ui/views/home.dart';
import 'package:proj_ctrl/ui/views/login.dart';
import 'package:proj_ctrl/ui/views/product.dart';
import 'package:proj_ctrl/ui/views/splash.dart';

abstract class AppRoutes {
  static const SPLASH = '/splash';
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const PRODUCT = '/product';

  static final defaultTransition = Transition.native;

  static String internal(String route) {
    return HOME + route;
  }

  static get routes {
    return [
      GetPage(
        name: AppRoutes.SPLASH,
        page: () => SplashView(),
        transition: defaultTransition,
      ),
      GetPage(
        name: AppRoutes.LOGIN,
        page: () => LoginView(),
        transition: defaultTransition,
        binding: LoginBinding(),
      ),
      GetPage(
        name: AppRoutes.HOME,
        page: () => HomeView(),
        transition: defaultTransition,
        binding: HomeBinding(),
        children: [
          GetPage(
            name: AppRoutes.PRODUCT,
            page: () => ProductView(),
          )
        ],
      )
    ];
  }
}
