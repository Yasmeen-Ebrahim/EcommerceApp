import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class DeliveryType extends StatelessWidget {
  final bool isActive ;
  final String image ;
  final String name ;
  const DeliveryType({super.key, required this.isActive, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12 , horizontal: 30),
      color: isActive == true? AppColors.primaryColor : AppColors.background,
      child: Column(
        children: [
          Image.asset(image, width: 55,height: 55,), //color: isActive == true ? Colors.white : ),
          SizedBox(height: 5,),
          Text(name , style: isActive == true ? TextStyle(color: AppColors.white,fontSize: 14) : TextStyle(color: AppColors.primaryColor,fontSize: 14)),
        ],
      ),
    );
  }
}
