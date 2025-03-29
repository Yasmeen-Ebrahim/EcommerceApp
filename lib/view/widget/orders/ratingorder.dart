import 'package:ecommerceproject/core/constant/colors.dart';
import 'package:flutter/material.dart';

import '../../../core/functions/ratingfunction.dart';

class RateOrder extends StatelessWidget {
  const RateOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rating"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            color: AppColors.primaryColor,
            child: MaterialButton(
              child: Text("Set your Rate" , style: TextStyle(color: AppColors.white),),
              onPressed: (){
                showRatingDialog(context);
              },
            ),
          ),
        ],
      )
    );
  }
}
