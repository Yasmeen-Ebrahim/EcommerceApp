import 'package:ecommerceproject/core/class/statusrequest.dart';
import 'package:ecommerceproject/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';
import '../../../core/functions/handlefunction.dart';
import '../../../data/datasource/remote/auth/forgetpassword/checkemail.dart';

abstract class ForgetPasswordController extends GetxController{
  goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController{

  GlobalKey <FormState> formState = GlobalKey();

  late TextEditingController emailController ;

  StatusRequest? statusRequest ;
  CheckEmailData control = Get.put(CheckEmailData());


  @override
  goToVerifyCode() async {
    if(formState.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await control.postCheckEmailData(
          emailController.text
      );
      print("=============================== Controller $response ") ;
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success) {
        if(response['status'] == "success"){
          Get.toNamed(AppRoutes.verifyCode , arguments: {"email": emailController.text});
        }else{
          Get.defaultDialog(title: "Warning" ,titleStyle: TextStyle(color: AppColors.primaryColor,fontWeight: FontWeight.bold), middleText: "Email Not Found") ;
        }
      }
      update();
    }else{
      print("not valid");
    }
  }


  @override
  void onInit() {
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose() ;
    super.dispose();
  }


}

