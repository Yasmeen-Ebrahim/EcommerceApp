import 'package:ecommerceproject/core/class/statusrequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../../core/constant/colors.dart';
import '../../../controller/auth/verifycodesignupcontoller.dart';
import '../../widget/auth/custombody.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {

     Get.put(VerifyCodeSignUpControllerImp());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("41".tr),
        titleTextStyle: Theme.of(context).textTheme.bodyLarge,
      ),
      body: GetBuilder<VerifyCodeSignUpControllerImp>(builder: (controller) {
        return controller.statusRequest == StatusRequest.loading ?
           Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),) :
        ListView(
          children: [
            SizedBox(height: 30),
            Container(
                alignment: Alignment.center,
                child: Text("42".tr , style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 27 , color: AppColors.black))
            ),
            SizedBox(height: 5,),
            CustomBody(body: "43".tr),
            SizedBox(height: 30),
            OtpTextField(
              fieldWidth: 50,
              numberOfFields: 5,
              borderColor: Color(0xFF512DA8),
              showFieldAsBox: true,
              onCodeChanged: (String code) {
              },
              onSubmit: (String verificationCode){
                controller.goToSuccessSignUp(verificationCode);
              }, // end onSubmit
            ),
            SizedBox(height: 40,),
            TextButton(
                onPressed: (){
                  controller.resendVerifyCode();
                },
                child: Text("Resend Verify Code" , style: TextStyle(color: AppColors.primaryColor , fontSize: 16),)
            )
          ],
        );
      },)
    );
  }
}