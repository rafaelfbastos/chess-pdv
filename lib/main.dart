import 'package:chess_pdv/app/app_module.dart';
import 'package:chess_pdv/app/app_widget.dart';
import 'package:chess_pdv/app/core/config/start_app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future<void> main() async {
  await StartAppConfig().init();
  
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

