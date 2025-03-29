import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class TableTitles extends StatelessWidget {
  final String title ;
  const TableTitles({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: EdgeInsets.only(bottom: 12),
        child: Text(
            title ,
            style: TextStyle(
                color: AppColors.primaryColor ,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center)
    );
  }
}
