import 'package:ecommerceproject/controller/auth/signupcontroller.dart';
import 'package:ecommerceproject/core/constant/routes.dart';
import 'package:ecommerceproject/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/colors.dart';
import '../../../core/functions/appexitalert.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/customFormField.dart';
import '../../widget/auth/customquestion.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("23".tr),
          titleTextStyle: Theme.of(context).textTheme.bodyLarge,
        ),
      body: GetBuilder<SignUpControllerImp>(builder: (controller) {
        return WillPopScope(
          onWillPop: alertAppExit,
          child: HandlingDataPost(
            route: AppRoutes.signUp,
            statusRequest: controller.statusRequest,
            widget: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  SizedBox(height: 30,),
                  Container(
                      alignment: Alignment.center,
                      child: Text("24".tr , style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 27 , color: AppColors.black))
                  ),
                  SizedBox(height: 5,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                        textAlign: TextAlign.center,
                        "25".tr,
                        style: TextStyle(
                            color: AppColors.bodytext ,
                            fontSize: 12
                        )
                    ),
                  ),
                  SizedBox(height: 40,),
                  Customformfield(
                    obscureText: false,
                    hinttext: '27'.tr,
                    labletext: '26'.tr,
                    icon: Icons.person_2_outlined,
                    mycontroller: controller.usernameController,
                    keyboardtype: TextInputType.name,
                    valid: (val){
                      return validInput(val!, 150, 5, "username");
                    },
                  ),
                  SizedBox(height: 23,),
                  Customformfield(
                    obscureText: false,
                    hinttext: '29'.tr,
                    labletext: '28'.tr,
                    icon: Icons.email_outlined,
                    mycontroller: controller.emailController,
                    keyboardtype: TextInputType.emailAddress,
                    valid: (val){
                      return validInput(val!, 100, 5, "email");
                    },
                  ),
                  SizedBox(height: 23,),
                  Customformfield(
                    obscureText: false,
                    hinttext: '31'.tr,
                    labletext: '30'.tr,
                    icon: Icons.phone_android_outlined,
                    mycontroller: controller.phoneController,
                    keyboardtype: TextInputType.phone,
                    valid: (val){
                      return validInput(val!, 20, 11, "phone");
                    },
                  ),
                  SizedBox(height: 23,),
                  Customformfield(
                    obscureText: controller.isShowPassword,
                    onTapsecure: (){
                      controller.showPassword();
                    },
                    hinttext: '33'.tr,
                    labletext: '32'.tr,
                    icon: Icons.lock_outline,
                    mycontroller: controller.passwordController,
                    keyboardtype: TextInputType.visiblePassword,
                    valid: (val){
                      return validInput(val!, 120, 5, "password");
                    },
                  ),
                  SizedBox(height: 30,),
                  CustomButtonAuth(textbutton: "34".tr , onPresse: (){
                    controller.signup();
                  },),
                  SizedBox(height: 17,),
                  customQuestion(question: "35".tr, signupORsignin: '36'.tr,onPressed: (){
                    controller.gotoLogin();
                  },),
                ],
              ),
            ),
          ),
        );
      },)
    );
  }
}
