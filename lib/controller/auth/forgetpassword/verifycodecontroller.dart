import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/handlefunction.dart';
import '../../../data/datasource/remote/auth/forgetpassword/verifycodepassword.dart';

abstract class VerifyCodeController extends GetxController{
  goToResetPassword(String verifycode);
}

class VerifyCodeControllerImp extends VerifyCodeController{

  StatusRequest? statusRequest ;
  VerifyCodePasswordData control = Get.put(VerifyCodePasswordData());
   String? email ;


  @override
  goToResetPassword(String verifycode) async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await control.postVerifyPasswordData(
        email!,
        verifycode
    );
    print("=============================== Controller $response ") ;
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success) {
      if(response['status'] == "success"){
        Get.toNamed(AppRoutes.resetPassword , arguments: {"email" : email});
      }else{
        Get.defaultDialog(title: "Warning" ,titleStyle: TextStyle(color: AppColors.primaryColor,fontWeight: FontWeight.bold), middleText: "Verify Code Not Match") ;
      }
    }
    update();
  }


  @override
  void onInit() {
    email = Get.arguments['email'] ;
    super.onInit();
  }





}

