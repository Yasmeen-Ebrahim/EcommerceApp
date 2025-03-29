import 'package:ecommerceproject/core/constant/colors.dart';
import 'package:ecommerceproject/core/constant/routes.dart';
import 'package:ecommerceproject/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SettingsController extends GetxController{
  logOut();
}

class SettingsControllerImp extends SettingsController{

  MyServices myServices = Get.find();

  @override
  logOut() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.login);
  }

  List<Widget> icons = [
     Switch(value: true, onChanged: (val){} , activeColor: Colors.indigo[500]),
     IconButton(onPressed: (){}, icon: Icon(Icons.location_on_outlined , color: Colors.indigo[500],)),
     IconButton(onPressed: (){}, icon: Icon(Icons.help_outline , color: Colors.indigo[500],)),
     IconButton(onPressed: (){}, icon: Icon(Icons.phone_callback_outlined, color: Colors.indigo[500],)),
  ];

  List<String> titles = [
    "Disable Notifications",
    "Address",
    "About Us",
    "Contact Us",
    "Logout"
  ];

}