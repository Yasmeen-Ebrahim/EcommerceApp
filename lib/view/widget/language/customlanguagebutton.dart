import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class customLanguageButton extends StatelessWidget {
  final String textbutton ;
  final void Function()? onPressed ;
  const customLanguageButton({super.key, required this.textbutton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 8),
        textColor: AppColors.white,
        color: AppColors.primaryColor,
        child: Text(textbutton , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15),),
        onPressed: onPressed,
      ),
    );
  }
}
