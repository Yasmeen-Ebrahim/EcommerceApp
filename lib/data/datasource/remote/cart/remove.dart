import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/serverlinks/serverlink.dart';

class RemoveCart {

  Crud control = Get.put(Crud());

  getRemoveCartData(String userId , String itemId) async {
    var response = await control.postData("${AppServerLinks.serverLink}/cart/remove.php",{
      "userid" : userId,
      "itemid" : itemId
    });
    return  response.fold((l) => l, (r) => r) ;
  }

}
