import 'package:ecommerceproject/controller/auth/forgetpassword/resetpasswordcontroller.dart';
import 'package:ecommerceproject/core/class/statusrequest.dart';
import 'package:ecommerceproject/view/widget/auth/customFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombody.dart';
import '../../../widget/auth/custombuttonauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("48".tr),
          titleTextStyle: Theme.of(context).textTheme.bodyLarge,
        ),
      body:GetBuilder<ResetPasswordControllerImp>(builder: (controller){
        return  controller.statusRequest == StatusRequest.loading ?
           Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),) :
        Form(
          key: controller.formState,
          child: ListView(
            children: [
              SizedBox(height: 30,),
              Container(
                  alignment: Alignment.center,
                  child: Text("49".tr , style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 27 , color: AppColors.black))
              ),
              SizedBox(height: 5,),
              CustomBody(body: "50".tr),
              SizedBox(height: 35,),
              Customformfield(
                obscureText: controller.isShowPassword,
                onTapsecure: (){
                  controller.showPassword();
                },
                hinttext: "18".tr,
                labletext: "17".tr,
                icon: Icons.lock_outline,
                mycontroller: controller.passwordController ,
                keyboardtype: TextInputType.visiblePassword,
                valid: (val){
                  return validInput(val!, 120, 5, "password");
                },
              ),
              SizedBox(height: 25,),
              Customformfield(
                obscureText: controller.isShowPassword2,
                onTapsecure: (){
                  controller.showPassword2();
                },
                hinttext: "52".tr,
                labletext: "51".tr,
                icon: Icons.lock_outline,
                mycontroller: controller.confirmpasswordController ,
                keyboardtype: TextInputType.visiblePassword,
                valid: (val){
                  return validInput(val!, 120, 5, "password");
                },
              ),
              SizedBox(height: 40,),
              CustomButtonAuth(textbutton: '53'.tr,onPresse: (){
                controller.goToSuccessResetPassword();
              },)
            ],
          ),
        );
      },)
    );
  }
}