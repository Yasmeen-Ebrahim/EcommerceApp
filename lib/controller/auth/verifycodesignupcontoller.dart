import 'package:ecommerceproject/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/colors.dart';
import '../../core/functions/handlefunction.dart';
import '../../data/datasource/remote/auth/resendverifycode.dart';
import '../../data/datasource/remote/auth/verifycodesignup.dart';

abstract class VerifyCodeSignUpController extends GetxController{
  goToSuccessSignUp(String verifycode);
  resendVerifyCode() ;
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController{

  String? email ;
  String? loginEmail ;
  StatusRequest? statusRequest ;
  VerifySignUpData control = Get.put(VerifySignUpData());
  ResendData resendController = Get.put(ResendData());

  @override
  goToSuccessSignUp(verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await control.postVerifySignUpData(
        email! ,
        verifycode
    );
    print("=============================== Controller $response ") ;
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success) {
      if(response['status'] == "success"){
        Get.offAllNamed(AppRoutes.successSignUp);
      }else{
        Get.defaultDialog(title: "Warning" ,titleStyle: TextStyle(color: AppColors.primaryColor,fontWeight: FontWeight.bold), middleText: "Verify Code Not Match") ;
      }
    }
    update();
  }

  @override
  resendVerifyCode() {
    resendController.postResendData(loginEmail!);
  }

  @override
  void onInit() {
    email = Get.arguments['email'] ;
    loginEmail = Get.arguments['loginemail'] ;
    super.onInit();
  }

}

