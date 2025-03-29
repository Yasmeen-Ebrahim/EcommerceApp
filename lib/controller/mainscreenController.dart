import 'package:ecommerceproject/view/screen/homepage.dart';
import 'package:ecommerceproject/view/screen/offers/offerspage.dart';
import 'package:ecommerceproject/view/screen/settings/settingspage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart' ;

abstract class MainScreenController extends GetxController{
  changePages(index) ;
}
class MainScreenControllerImp extends MainScreenController{

  int currentIndex = 0 ;

  List<IconData> icons = [
    Icons.home ,
    Icons.settings ,
    Icons.discount_outlined ,
    Icons.notifications_active_outlined
  ];

  List listPages = [
    HomePage(),
    SettingsPage(),
    OffersItems(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("notifications screen"))
      ],
    ),
  ] ;

  @override
  changePages(index) {
    currentIndex = index ;
    update();
  }
}