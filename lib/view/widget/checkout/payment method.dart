import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class PaymentMethod extends StatelessWidget {
  final String name ;
  final bool isActive ;
  const PaymentMethod({super.key, required this.name, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(name , style: isActive == true ? TextStyle(color: AppColors.white) : TextStyle(color: AppColors.primaryColor),),
      decoration : BoxDecoration(
        color: isActive == true ? AppColors.primaryColor : AppColors.background,
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      padding: EdgeInsets.only(top: 5 , bottom: 5 , left: 13),
      margin: EdgeInsets.symmetric(horizontal: 25),
    );
  }
}
