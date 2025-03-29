import 'package:ecommerceproject/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordcontroller extends GetxController{
  goToLogin();
}

class SuccessResetPasswordcontrollerImp extends SuccessResetPasswordcontroller{
  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }


  @override
  void onInit() {

    super.onInit();
  }
}

