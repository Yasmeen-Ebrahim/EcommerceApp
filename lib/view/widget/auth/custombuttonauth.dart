import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CustomButtonAuth extends StatelessWidget {
  final String textbutton ;
  final void Function()? onPresse ;
  const CustomButtonAuth({super.key, required this.textbutton, this.onPresse});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(23)
      ),
      child: MaterialButton(
        child: Text(textbutton , style: Theme.of(context).textTheme.bodySmall,),
        onPressed: onPresse,
      ),
    );
  }
}
