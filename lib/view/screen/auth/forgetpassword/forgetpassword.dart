import 'package:ecommerceproject/core/class/statusrequest.dart';
import 'package:ecommerceproject/view/widget/auth/customFormField.dart';
import 'package:ecommerceproject/view/widget/auth/custombody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forgetpassword/forgetpasswordcontroller.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombuttonauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("47".tr),
          titleTextStyle: Theme.of(context).textTheme.bodyLarge,
        ),
      body: GetBuilder<ForgetPasswordControllerImp>(builder: (controller){
        return controller.statusRequest == StatusRequest.loading ?
        Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),) :
        Form(
          key: controller.formState,
          child: ListView(
            children: [
              SizedBox(height: 30,),
              Container(
                  alignment: Alignment.center,
                  child: Text("37".tr , style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 27 , color: AppColors.black))
              ),
              SizedBox(height: 5,),
              CustomBody(body: "39".tr),
              SizedBox(height: 30,),
              Customformfield(
                obscureText: false,
                hinttext: "16".tr,
                labletext: '15'.tr,
                icon: Icons.email_outlined,
                mycontroller: controller.emailController ,
                keyboardtype: TextInputType.emailAddress,
                valid: (val){
                  return validInput(val!, 100, 5, "email");
                },
              ),
              SizedBox(height: 40,),
              CustomButtonAuth(textbutton: '40'.tr,onPresse: (){
                controller.goToVerifyCode();
              },)
            ],
          ),
        );
      },)
    );
  }
}
