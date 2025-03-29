import 'dart:ui';

import 'package:ecommerceproject/core/constant/apptheme.dart';
import 'package:ecommerceproject/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController{

  late Locale language ;
  MyServices myServices = Get.find();

  ThemeData apptheme = englishTheme;

  changLang(String codeLang){
    Locale local = Locale(codeLang);
    myServices.sharedPreferences.setString("lang", codeLang);

    codeLang == "ar" ? apptheme = arabicTheme : apptheme = englishTheme ;
    Get.changeTheme(apptheme);

    Get.updateLocale(local);
  }

  @override
  void onInit() {
    if(myServices.sharedPreferences.getString("lang") == "ar") {
      language = Locale("ar") ;
      apptheme = arabicTheme ;
    }else if(myServices.sharedPreferences.getString("lang") == "en") {
      language = Locale("en");
      apptheme = englishTheme ;
    }else {
      language = Locale(Get.deviceLocale!.languageCode);
      apptheme = englishTheme ;
    }
    super.onInit();
  }
}

