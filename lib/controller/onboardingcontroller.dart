import 'package:ecommerceproject/core/constant/routes.dart';
import 'package:ecommerceproject/core/services/services.dart';
import 'package:ecommerceproject/data/datasource/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController{
  pageChanged(int index);
  next(int index);
  skip(int index) ;
  dotIndicator(int index) ;
}

class OnBoardingControllerImp extends OnBoardingController{

  MyServices myServices = Get.find();

  int currentPage = 0 ;
  late PageController smoothPageController ;

  @override
  pageChanged(int index) {
    currentPage = index ;
    update();
  }

  @override
  next(int index) {
    if(index > onBoardinglist.length - 1){
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoutes.login);
    }
    smoothPageController.jumpToPage(index);
  }


  @override
  skip(int index) {
    smoothPageController.jumpToPage(index);
  }

  @override
  dotIndicator(int index) {
    smoothPageController.jumpToPage(index);
  }

  @override
  void onInit() {
    smoothPageController = PageController();
    super.onInit();
  }



}