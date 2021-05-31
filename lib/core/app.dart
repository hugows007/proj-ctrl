import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj_ctrl/bindings/home.dart';
import 'package:proj_ctrl/bindings/splash.dart';
import 'package:proj_ctrl/core/configs/messages.dart';
import 'package:proj_ctrl/core/routes/app_routes.dart';
import 'package:sizer/sizer.dart';

class ControllApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'Aplicativo controle',
          theme: ThemeData(
            unselectedWidgetColor: Color(0xFF0074E4),
            primaryColor: Color(0xFF0074E4),
            primaryColorDark: Color(0xFF455A64),
            accentColor: Colors.white,
            backgroundColor: Color(0xFFF2F2F2),
            errorColor: Colors.red,
          ),
          translations: MessagesConfig(),
          locale: Locale('pt', 'BR'),
          getPages: AppRoutes.routes,
          initialRoute: AppRoutes.SPLASH,
          initialBinding: SplashBinding(),
          enableLog: true,
        );
      },
    );
  }
}
