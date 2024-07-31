import 'package:flutter/material.dart';

class UiConfig {
  UiConfig._();

  static ThemeData get theme => ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff1AB0FB),
        ),
        colorSchemeSeed: const Color(0xff1AB0FB),
      );
}
