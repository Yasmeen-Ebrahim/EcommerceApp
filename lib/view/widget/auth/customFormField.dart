import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class Customformfield extends StatelessWidget {
  final String hinttext ;
  final String labletext ;
  final IconData icon ;
  final TextEditingController mycontroller ;
  final TextInputType keyboardtype ;
  final String? Function(String?)? valid ;
  final bool obscureText ;
  final void Function()? onTapsecure ;
  const Customformfield({
    super.key,
    required this.hinttext,
    required this.labletext,
    required this.icon,
    required this.mycontroller,
    required this.keyboardtype,
    required this.valid,
    this.onTapsecure,
    required this.obscureText}
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        validator: valid,
        controller: mycontroller ,
        keyboardType: keyboardtype,
        cursorColor: AppColors.primaryColor,
        obscureText: obscureText,
        decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: TextStyle(color: AppColors.bodytext , fontSize: 14),
            contentPadding: EdgeInsets.symmetric(horizontal: 30 , vertical: 19),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: labletext,
            labelStyle: TextStyle(color: AppColors.bodytext,fontSize: 16),
            suffixIcon:
            InkWell(
                onTap: onTapsecure,
                child: Icon(icon, color: AppColors.bodytext, )
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(40)
            )
        ),
      ),
    );
  }
}
