
import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  
  Color get primaryColor => const Color(0xff1AB0FB);
  Color get secondaryColor => const Color(0xff0688C2);
  Color get backgroudColor => const Color(0xffF4F5F7);
  Color get alertColor => const Color(0xfff24e5c);
  Color get grey => const Color(0xff93969b);
  
  ButtonStyle get primaryButtonStyle => ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  

  
}