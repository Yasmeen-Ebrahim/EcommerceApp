import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class customQuestion extends StatelessWidget {
  final String question ;
  final String signupORsignin ;
  final void Function()? onPressed ;
  const customQuestion({super.key, required this.question, required this.signupORsignin, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(question , style: TextStyle(color: AppColors.black),),
          TextButton(
            child: Text(
              signupORsignin ,
              style: TextStyle(color: AppColors.primaryColor),
            ),
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}
