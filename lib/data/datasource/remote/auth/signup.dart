import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/serverlinks/serverlink.dart';

class SignupData {

  Crud control = Get.put(Crud());

  postSignupData(String username , String password , String email , String phone) async {
    var response = await control.postData("${AppServerLinks.serverLink}/auth/signup.php",{
      "username" : username ,
      "password" : password ,
      "email" : email ,
      "phone" : phone
    });
    return  response.fold((l) => l, (r) => r) ;
  }

}
