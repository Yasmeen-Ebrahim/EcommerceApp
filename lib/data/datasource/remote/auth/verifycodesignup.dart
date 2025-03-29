import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/serverlinks/serverlink.dart';

class VerifySignUpData {

  Crud control = Get.put(Crud());

  postVerifySignUpData(String email , String verifycode) async {
    var response = await control.postData("${AppServerLinks.serverLink}/auth/verifycode.php",{
      "email" : email ,
      "verifycode" : verifycode
    });
    return  response.fold((l) => l, (r) => r) ;
  }

}