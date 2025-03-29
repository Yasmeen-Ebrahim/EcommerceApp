import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class ColorDetail extends StatelessWidget {
  const ColorDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          "Color" ,
          style: TextStyle(
              color: AppColors.primaryColor ,
              fontSize: 20 ,
              fontWeight: FontWeight.bold
          ),
        ));
  }
}
