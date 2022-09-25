import 'package:flutter/material.dart';

import 'styles/app_text_styles.dart';

class AppUtilities {
  Future<bool> onWillPop(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Warning!!',
              style: AppTextStyles.work25Black.copyWith(
                color: Colors.redAccent,
              ),
            ),
            content: const Text('Do you want to exit the App?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text(
                  'Yes',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }

  static void navigateTo(BuildContext context, Widget widget, String lable) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => widget,
        settings: RouteSettings(name: lable),
      ),
    );
  }

  static void navigateToReplacment(
      BuildContext context, Widget widget, String lable) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => widget,
        settings: RouteSettings(name: lable),
      ),
    );
  }

  static void getBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}
