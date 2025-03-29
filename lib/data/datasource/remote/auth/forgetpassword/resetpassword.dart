import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../core/class/crud.dart';
import '../../../../../core/constant/serverlinks/serverlink.dart';


class ResetPasswordData {

  Crud control = Get.put(Crud());

  postResetPasswordData(String email , String password) async {
    var response = await control.postData("${AppServerLinks.serverLink}/forgetpassword/resetpassword.php",{
      "email" : email ,
      "password" : password
    });
    return  response.fold((l) => l, (r) => r) ;
  }

}