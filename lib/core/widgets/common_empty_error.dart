import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../styles/app_text_styles.dart';

class CommonEmptyError extends StatelessWidget {
  const CommonEmptyError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Text(
          AppConstans.emptyList,
          style: AppTextStyles.aBee24Black,
        ),
      ),
    );
  }
}
