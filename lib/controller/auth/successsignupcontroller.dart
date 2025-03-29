import 'package:ecommerceproject/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpcontroller extends GetxController{
  goToLogin();
}

class SuccessSignUpcontrollerImp extends SuccessSignUpcontroller{
  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}

