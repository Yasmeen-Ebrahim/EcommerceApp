import 'package:flutter/material.dart';
import '../../../core/constant/colors.dart';

class BottomNavigationBarCard extends StatelessWidget {
  final String button ;
  final void Function() onpressed ;
  const BottomNavigationBarCard({super.key, required this.button, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.primaryColor,
      ),
      margin: EdgeInsets.only(left: 15 , right: 15, bottom: 10),
      child:  MaterialButton(
        child: Text(
          button ,
          style: TextStyle(
              color: AppColors.white ,
              fontWeight: FontWeight.bold ,
              fontSize: 15
          ),
        ),
        onPressed: onpressed,
      ),
    );
  }
}
