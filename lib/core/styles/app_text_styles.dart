import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class AppTextStyles {
  static TextStyle logoStyle = GoogleFonts.aBeeZee(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: 28,
  );

  static TextStyle aBee24Black = GoogleFonts.aBeeZee(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: 28,
  );
  static TextStyle work18Pink = GoogleFonts.workSans(
    color: AppColors.pink,
    fontSize: 18,
    letterSpacing: 1.2,
  );
  static TextStyle work25Black = GoogleFonts.workSans(
    color: AppColors.black,
    fontSize: 25,
  );

  static TextStyle textField = const TextStyle(
    fontSize: 22,
    color: Colors.white,
  );

  static TextStyle h32w500Black = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static TextStyle p16Black = const TextStyle(
    color: Colors.black,
    fontSize: 16,
  );
  static TextStyle p12Black = const TextStyle(
    color: Colors.black,
    fontSize: 12,
  );
  static TextStyle h35grey900 = TextStyle(
    fontSize: 35,
    color: Colors.grey.shade900,
    fontWeight: FontWeight.bold,
  );
}
