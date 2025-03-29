import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/serverlinks/serverlink.dart';

class LoginData {

  Crud control = Get.put(Crud());

  postLoginData(String email , String password) async {
    var response = await control.postData("${AppServerLinks.serverLink}/auth/login.php",{
      "email" : email ,
      "password" : password
    });
    return  response.fold((l) => l, (r) => r) ;
  }

}