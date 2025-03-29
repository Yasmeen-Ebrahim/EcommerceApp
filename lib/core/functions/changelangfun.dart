import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../services/services.dart';

changeLanguage(partAr , partEn){

  MyServices control = Get.put(MyServices());
  if(control.sharedPreferences.getString("lang") == "ar"){
    return partAr ;
  }else{
    return partEn ;
  }
}