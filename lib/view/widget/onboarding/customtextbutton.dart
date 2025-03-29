import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/onboardingcontroller.dart';
import '../../../core/constant/colors.dart';
import '../../../data/datasource/static/static.dart';

class Customtextbutton extends GetView<OnBoardingControllerImp> {
  const Customtextbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text("11".tr , style: TextStyle(fontSize: 16 ,color: AppColors.black),),
      onPressed: (){
        controller.skip(onBoardinglist.length - 1 );
      },
    );
  }
}
