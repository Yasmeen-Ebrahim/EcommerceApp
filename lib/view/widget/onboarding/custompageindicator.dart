import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../controller/onboardingcontroller.dart';
import '../../../core/constant/colors.dart';
import '../../../data/datasource/static/static.dart';

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(builder: (controller){
      return  SmoothPageIndicator(
        controller: controller.smoothPageController,
        count: onBoardinglist.length,
        effect: WormEffect(
            dotWidth: 30,
            dotHeight: 10,
            activeDotColor: AppColors.primaryColor
        ),
        onDotClicked: (val){
          controller.dotIndicator(val);
        },
      );
    });
  }
}
