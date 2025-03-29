import 'package:ecommerceproject/controller/auth/logincontroller.dart';
import 'package:ecommerceproject/core/class/statusrequest.dart';
import 'package:ecommerceproject/core/constant/colors.dart';
import 'package:ecommerceproject/core/functions/appexitalert.dart';
import 'package:ecommerceproject/core/functions/validinput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/auth/customFormField.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customquestion.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("12".tr),
        titleTextStyle: Theme.of(context).textTheme.bodyLarge,
      ),
      body: GetBuilder<LoginControllerImp>(builder: (controller) {
        return WillPopScope(
            onWillPop: alertAppExit,
            child: controller.statusRequest == StatusRequest.loading ?
            Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),) :
            Form(
              key: controller.formState,
              child: ListView(
                children: [
                  SizedBox(height: 30,),
                  Container(
                      alignment: Alignment.center,
                      child: Text("13".tr , style: TextStyle(fontWeight: FontWeight.w400 , fontSize: 27 , color: AppColors.black))
                  ),
                  SizedBox(height: 5,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                        textAlign: TextAlign.center,
                        "14".tr,
                        style: TextStyle(
                            color: AppColors.bodytext ,
                            fontSize: 12
                        )
                    ),
                  ),
                  SizedBox(height: 70,),
                  Customformfield(
                    obscureText: false,
                    hinttext: '16'.tr,
                    labletext: '15'.tr,
                    icon: Icons.email_outlined,
                    mycontroller: controller.emailController ,
                    keyboardtype: TextInputType.emailAddress ,
                    valid: (val){
                      return validInput(val!, 100, 5, "email");
                    },
                  ),
                  SizedBox(height: 30,),
                  Customformfield(
                    obscureText: controller.isShowPassword,
                    onTapsecure: (){
                      controller.showPassword();
                    },
                    hinttext: '18'.tr,
                    labletext: '17'.tr,
                    icon: Icons.lock_outline,
                    mycontroller: controller.passwordController,
                    keyboardtype: TextInputType.visiblePassword,
                    valid: (val){
                      return validInput(val!, 120, 5, "password");
                    },
                  ),
                  SizedBox(height: 40,),

                  Container(
                    margin: EdgeInsets.only(right: 25),
                    child: InkWell(
                      onTap: (){
                        controller.goToForgetPassword();
                      },
                      child: Text(
                        "19".tr ,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: AppColors.black,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  CustomButtonAuth(
                    textbutton: '20'.tr,
                    onPresse: (){
                      controller.login();
                    },),
                  SizedBox(height: 40,),
                  customQuestion(
                    question: "21".tr,
                    signupORsignin: '22'.tr,
                    onPressed: (){
                      controller.gotoSignUp();
                    },)
                ],
              ),
            ),
        );
      },)
    );
  }
}
