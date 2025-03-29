import 'package:ecommerceproject/core/class/statusrequest.dart';
import 'package:ecommerceproject/core/constant/routes.dart';
import 'package:ecommerceproject/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/colors.dart';
import '../../core/functions/handlefunction.dart';
import '../../core/services/services.dart';

abstract class LoginController extends GetxController{
  login();
  gotoSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController{

  MyServices controller = Get.find();

  GlobalKey <FormState> formState = GlobalKey();

  StatusRequest? statusRequest ;
  LoginData control = Get.put(LoginData());

  late TextEditingController emailController ;
  late TextEditingController passwordController ;

  bool isShowPassword = true;

  showPassword(){
    isShowPassword = !isShowPassword ;
    update();
  }


  @override
  gotoSignUp() {
    Get.offNamed(AppRoutes.signUp);
  }

  @override
  login() async {
    if(formState.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await control.postLoginData(
          emailController.text,
          passwordController.text
      );
      print("=============================== Controller $response ") ;
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success) {
        if(response['status'] == "success"){
          if(response['data']['users_approve'] == 1){
            controller.sharedPreferences.setString("step", "2");
            controller.sharedPreferences.setString("id", response['data']['users_id'].toString());
            controller.sharedPreferences.setString("username", response['data']['users_name']);
            controller.sharedPreferences.setString("email", response['data']['users_email']);
            controller.sharedPreferences.setString("phone", response['data']['users_phone']);
            controller.sharedPreferences.setString("password", response['data']['users_password']);
            Get.offAllNamed(AppRoutes.homePage);
          }else{
            Get.toNamed(AppRoutes.verifyCodeSignUp , arguments: {"loginemail" : emailController.text});
          }
        }else{
          Get.defaultDialog(title: "Warning" ,titleStyle: TextStyle(color: AppColors.primaryColor,fontWeight: FontWeight.bold), middleText: "Email or password not correct") ;
        }
      }
      update();
    }else{
      print("not valid");
    }
  }

  @override
  void onInit() async{
    emailController = TextEditingController();
    passwordController = TextEditingController();
    String? token = await FirebaseMessaging.instance.getToken();
    print(token);
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose() ;
    passwordController.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }
}

