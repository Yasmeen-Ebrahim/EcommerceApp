import 'package:ecommerceproject/core/class/statusrequest.dart';
import 'package:ecommerceproject/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/constant/colors.dart';
import '../../../core/functions/handlefunction.dart';
import '../../../data/datasource/remote/auth/forgetpassword/resetpassword.dart';

abstract class ResetPasswordController extends GetxController{
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController{

  GlobalKey <FormState> formState = GlobalKey();

  late TextEditingController passwordController ;
  late TextEditingController confirmpasswordController ;

  String? email ;
  StatusRequest? statusRequest ;
  ResetPasswordData control = Get.put(ResetPasswordData());

  bool isShowPassword = true ;

  showPassword(){
    isShowPassword = !isShowPassword ;
    update();
  }

  bool isShowPassword2 = true ;

  showPassword2(){
    isShowPassword2 = !isShowPassword2 ;
    update();
  }


  @override
  goToSuccessResetPassword() async{
    if(formState.currentState!.validate()){
      if(passwordController.text != confirmpasswordController.text){
        Get.defaultDialog(title: "Warning" ,titleStyle: TextStyle(color: AppColors.primaryColor,fontWeight: FontWeight.bold), middleText: "try again") ;
      }else{
        statusRequest = StatusRequest.loading;
        update();
        var response = await control.postResetPasswordData(
            email!,
            passwordController.text
        );
        print("=============================== Controller $response ") ;
        statusRequest = handlingData(response);
        if(statusRequest == StatusRequest.success) {
          if(response['status'] == "success"){
            Get.offAllNamed(AppRoutes.successResetPassword);
          }else{
            Get.defaultDialog(title: "Warning" ,titleStyle: TextStyle(color: AppColors.primaryColor,fontWeight: FontWeight.bold), middleText: "Email or password not correct") ;
          }
        }
        update();
      }
    }else{
      print("not valid");
    }

  }



  @override
  void onInit() {
    passwordController = TextEditingController();
    confirmpasswordController = TextEditingController();

    email = Get.arguments['email'] ;

    super.onInit();
  }

  @override
  void dispose() {
    passwordController.dispose() ;
    confirmpasswordController.dispose() ;
    super.dispose();
  }


}

