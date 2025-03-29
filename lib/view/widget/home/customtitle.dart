import 'package:flutter/material.dart';
import '../../../core/constant/colors.dart';

class Customtitle extends StatelessWidget {
  final String title ;
  const Customtitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
          title ,
          style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold , fontSize: 18),)
    );
  }
}
