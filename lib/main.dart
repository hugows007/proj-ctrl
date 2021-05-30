import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proj_ctrl/core/app.dart';
import 'package:proj_ctrl/core/handlers/exception.dart';

void main() {
  runZonedGuarded<Future<void>>(
        () async {
      WidgetsFlutterBinding.ensureInitialized();
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

      FlutterError.onError = (FlutterErrorDetails details) {
        Zone.current.handleUncaughtError(details.exception, details.stack!);
      };
      runApp(ControllApp());
    },
        (Object error, StackTrace stackTrace) async {
      ExceptionHandler(error, stackTrace);
    },
  );
}
