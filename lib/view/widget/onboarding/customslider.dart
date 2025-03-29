import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboardingcontroller.dart';
import '../../../data/datasource/static/static.dart';

class CustomSlider extends GetView<OnBoardingControllerImp>{
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.smoothPageController,
        onPageChanged: (value){
          controller.pageChanged(value);
        },
        itemCount: onBoardinglist.length,
        itemBuilder: (context , i){
          return Column(
            children: [
              SizedBox(height: 20,),
              Image.asset("${onBoardinglist[i].image}" ,height: Get.width, fit: BoxFit.cover,),
              SizedBox(height: 40,),
              Text("${onBoardinglist[i].title}" , style: Theme.of(context).textTheme.titleLarge,),
              SizedBox(height: 20,),
              Container(
                child: Text(
                  textAlign: TextAlign.center,
                  "${onBoardinglist[i].body}",style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          );
        }
    );
  }
}
