import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/onboardingcontroller.dart';
import '../widget/onboarding/custombutton.dart';
import '../widget/onboarding/custompageindicator.dart';
import '../widget/onboarding/customslider.dart';
import '../widget/onboarding/customtextbutton.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(OnBoardingControllerImp());

    return Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: CustomSlider(),
            ),
            Expanded(
              flex: 1,
              child: CustomPageIndicator(),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Customtextbutton(),
                  CustomButton()
                ],
              ),
            )
          ],
        )
    );
  }
}
