import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.lable,
    this.onTap,
  }) : super(key: key);
  final String lable;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap ?? () {},
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.orange.shade400,
      child: Text(
        lable,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
