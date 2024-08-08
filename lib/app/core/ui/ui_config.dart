import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UiConfig {
  UiConfig._();

  static ThemeData get theme => ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff1AB0FB),
        ),
        colorSchemeSeed: const Color(0xff1AB0FB),
      );
}
