import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class ColorOptions extends StatelessWidget {
  final String colorname ;
  final Color namecolor ;
  final Color containercolor ;
  final double margin ;
  const ColorOptions({super.key, required this.colorname, required this.namecolor, required this.containercolor, required this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(colorname , style: TextStyle(color: namecolor , fontWeight: FontWeight.bold),),
      decoration: BoxDecoration(
          color: containercolor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.grey)
      ),
      margin: EdgeInsets.only(left: margin),
      padding: EdgeInsets.symmetric(horizontal: 27 , vertical: 12),
    );
  }
}
