import 'package:ecommerceproject/controller/auth/forgetpassword/successresetpasswordcontroller.dart';
import 'package:ecommerceproject/view/widget/auth/custombody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {

    SuccessResetPasswordcontrollerImp controller = SuccessResetPasswordcontrollerImp();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("44".tr),
        titleTextStyle: Theme.of(context).textTheme.bodyLarge,
      ),
      body: ListView(
        children: [
          SizedBox(height: 70,),
          Center(child: Icon(Icons.check_circle_outline , size: 120, color: AppColors.green,)),
          SizedBox(height: 30,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
              child: CustomBody(body: "45".tr)
          ),
          SizedBox(height: 250,),
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(30)
            ),
            child: MaterialButton(
              child: Text("46".tr , style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),),
              onPressed: (){
                controller.goToLogin();
              },
            ),
          )
        ],
      ),
    );
  }
}
