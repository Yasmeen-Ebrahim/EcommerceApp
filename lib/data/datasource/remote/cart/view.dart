import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/serverlinks/serverlink.dart';

class ViewCart {

  Crud control = Get.put(Crud());

  getViewCartData(String userId) async {
    var response = await control.postData("${AppServerLinks.serverLink}/cart/view.php",{
      "userid" : userId,
    });
    return  response.fold((l) => l, (r) => r) ;
  }

}
