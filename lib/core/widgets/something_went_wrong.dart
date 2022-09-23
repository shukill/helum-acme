import 'package:acme/core/constants/app_constants.dart';
import 'package:acme/core/constants/assets.dart';
import 'package:acme/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

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
                MaterialButton(
                  onPressed: () {},
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.orange.shade400,
                  child: const Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
