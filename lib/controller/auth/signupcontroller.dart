import 'package:ecommerceproject/core/constant/colors.dart';
import 'package:ecommerceproject/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlefunction.dart';
import '../../data/datasource/remote/auth/signup.dart';

abstract class SignUpController extends GetxController{
  signup();
  gotoLogin();
}

class SignUpControllerImp extends SignUpController{

  GlobalKey <FormState> formState = GlobalKey();


  SignupData control = Get.put(SignupData());
  StatusRequest statusRequest = StatusRequest.none ;

  late TextEditingController usernameController ;
  late TextEditingController emailController ;
  late TextEditingController phoneController ;
  late TextEditingController passwordController ;

  bool isShowPassword = true ;

  showPassword(){
    isShowPassword = !isShowPassword ;
    update();
  }

  @override
  gotoLogin() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  signup() async {
    if(formState.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await control.postSignupData(
          usernameController.text,
          passwordController.text,
          emailController.text,
          phoneController.text
      );
      print("=============================== Controller $response ") ;
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success) {
        if(response['status'] == "success"){
          Get.toNamed(AppRoutes.verifyCodeSignUp , arguments: {"email" : emailController.text});
        }else{
          Get.defaultDialog(title: "Warning" ,titleStyle: TextStyle(color: AppColors.primaryColor,fontWeight: FontWeight.bold), middleText: "Email or Phone Exists") ;
        }
      }
      update();
    }else{
      print("not valid");
    }
  }

  @override
  void onInit() {
    usernameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}