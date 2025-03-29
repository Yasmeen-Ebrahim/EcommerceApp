import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/serverlinks/serverlink.dart';

class ResendData {

  Crud control = Get.put(Crud());

  postResendData(String email) async {
    var response = await control.postData("${AppServerLinks.serverLink}/auth/resendverifycode.php",{
      "email" : email ,
    });
    return  response.fold((l) => l, (r) => r) ;
  }

}