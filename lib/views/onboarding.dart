import 'package:acme/core/constants/app_constants.dart';
import 'package:acme/core/styles/app_colors.dart';
import 'package:acme/core/widgets/app_button.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 50),
            FadeInRight(
              duration: const Duration(milliseconds: 1500),
              child: Image.network(
                'https://cdn.dribbble.com/users/115278/screenshots/16812737/media/93914b7224e59946c61b9dbde7542628.gif',
                fit: BoxFit.cover,
              ),
            ),
            FadeInUp(
              duration: const Duration(milliseconds: 1000),
              delay: const Duration(milliseconds: 500),
              child: Container(
                padding: const EdgeInsets.only(
                    left: 50, top: 40, right: 20, bottom: 50),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xffFFC3A6).withOpacity(0.5),
                      offset: const Offset(0, -5),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 1000),
                      from: 50,
                      child: const Text(
                        'Reinvent your best \nwith ${AppConstans.appName}!!',
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 1000),
                      from: 60,
                      child: Text(
                        'Let\'s keep your health in check :)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 1000),
                      from: 70,
                      child: const Align(
                        alignment: Alignment.bottomRight,
                        child: AppButton(lable: 'Let\'s get started'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
