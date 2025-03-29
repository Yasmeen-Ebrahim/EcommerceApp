import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../core/class/crud.dart';
import '../../../../../core/constant/serverlinks/serverlink.dart';

class CheckEmailData {

  Crud control = Get.put(Crud());

  postCheckEmailData(String email) async {
    var response = await control.postData("${AppServerLinks.serverLink}/forgetpassword/checkemail.php",{
      "email" : email ,
    });
    return  response.fold((l) => l, (r) => r) ;
  }

}