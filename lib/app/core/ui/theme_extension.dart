import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  
  Color get primaryColor => const Color(0xff1AB0FB);
  Color get secondaryColor => const Color(0xff0688C2);
  ButtonStyle get primaryButtonStyle => ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  

  
}