import '../constants/app_constants.dart';
import '../constants/assets.dart';
import '../styles/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'app_button.dart';

class SomethingWentWrong extends StatefulWidget {
  const SomethingWentWrong({Key? key}) : super(key: key);

  @override
  _SomethingWentWrongState createState() => _SomethingWentWrongState();
}

class _SomethingWentWrongState extends State<SomethingWentWrong> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(AppAssets.noConnection),
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              ),
            ),
            child: Column(
              children: [
                Text(
                  "Ooops! 😓",
                  style: AppTextStyles.h32w500Black,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  AppConstans.somethingWentWrong,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.p16Black,
                ),
                const SizedBox(
                  height: 60,
                ),
                const AppButton(
                  lable: "Home",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
