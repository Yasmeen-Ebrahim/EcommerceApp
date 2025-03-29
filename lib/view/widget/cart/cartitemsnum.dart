import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CartItemsNum extends StatelessWidget {
  final String card ;
  const CartItemsNum({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 65 , vertical: 7),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(card, style: TextStyle(fontSize : 13 , color: AppColors.primaryColor),),
      ),
    );
  }
}
