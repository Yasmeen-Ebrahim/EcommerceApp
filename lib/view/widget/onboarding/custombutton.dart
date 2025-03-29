import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboardingcontroller.dart';
import '../../../core/constant/colors.dart';

class CustomButton extends GetView<OnBoardingControllerImp> {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child:  MaterialButton(
        child: Text("10".tr ,  style: TextStyle( fontSize: 18 , fontWeight: FontWeight.bold ,color: AppColors.white ,),),
        onPressed: (){
          controller.next(controller.currentPage + 1);

        },
      ),
    );
  }
}
