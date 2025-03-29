import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class BottomNavigationBarCheckout extends StatelessWidget {
  final String text ;
  final void Function()? onCheckout ;
  const BottomNavigationBarCheckout({super.key, required this.text, required this.onCheckout});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 8),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 2),
        textColor: AppColors.white,
        child: Text(text),
        onPressed: onCheckout,
      ),
    );
  }
}
