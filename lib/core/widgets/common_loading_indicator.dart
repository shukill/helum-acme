import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../constants/assets.dart';
import '../styles/app_colors.dart';

class CommonLoadingIndicator extends StatelessWidget {
  const CommonLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: Get.width * 0.5,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: AppColors.pink,
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Center(
          child: Lottie.asset(
            AppAssets.splashAnimation,
            animate: true,
            repeat: true,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
