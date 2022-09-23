import 'package:acme/core/constants/app_constants.dart';
import 'package:acme/core/widgets/something_went_wrong.dart';
import 'package:acme/views/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/styles/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstans.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        textTheme: GoogleFonts.workSansTextTheme(),
      ),
      home: const OnboardingScreen(),
    );
  }
}
