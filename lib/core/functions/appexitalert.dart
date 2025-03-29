import 'dart:io';
import 'package:ecommerceproject/core/constant/colors.dart';
import 'package:flutter/material.dart' ;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Future<bool> alertAppExit(){
   Get.defaultDialog(
     title: "61".tr,
     titleStyle: TextStyle(fontWeight: FontWeight.bold , fontSize: 19,),
     content: Text("62".tr , style: TextStyle(color: AppColors.black , fontWeight: FontWeight.normal),),
     actions: [
       MaterialButton(
         textColor: AppColors.white,
         color: AppColors.primaryColor,
         child: Text("63".tr),
         onPressed: (){
           exit(0);
         },
       ),
       MaterialButton(
         textColor: AppColors.white,
         color: AppColors.primaryColor,
         child: Text("64".tr),
         onPressed: (){
           Get.back();
         },
       )
     ]
  );
   return Future.value(true);
}