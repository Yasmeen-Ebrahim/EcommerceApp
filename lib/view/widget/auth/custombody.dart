import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CustomBody extends StatelessWidget {
  final String body ;
  const CustomBody({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
          textAlign: TextAlign.center,
          body,
          style: TextStyle(
              color: AppColors.bodytext ,
              fontSize: 13
          )
      ),
    );
  }
}
