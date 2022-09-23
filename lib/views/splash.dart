import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../core/constants/app_constants.dart';
import '../core/constants/assets.dart';
import '../core/styles/app_text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              AppAssets.splashAnimation,
              animate: true,
              alignment: Alignment.center,
              repeat: true,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            AppConstans.appName,
            style: AppTextStyles.logoStyle,
          ),
        ],
      ),
    );
  }
}
