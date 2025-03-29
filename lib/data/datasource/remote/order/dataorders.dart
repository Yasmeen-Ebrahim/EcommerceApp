import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/serverlinks/serverlink.dart';

class OrdersData {

  Crud control = Get.put(Crud());

  postOrdersData(String userId) async {
    var response = await control.postData("${AppServerLinks.serverLink}/order/pending.php",{
      "userid" : userId
    });
    return  response.fold((l) => l, (r) => r) ;
  }

}
