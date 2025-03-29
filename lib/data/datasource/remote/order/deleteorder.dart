import 'package:get/get.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/serverlinks/serverlink.dart';

class DeleteOrder {

  Crud control = Get.put(Crud());

  deleteOrders(String orderId) async {
    var response = await control.postData("${AppServerLinks.serverLink}/order/deleteorder.php",{
      "orderid" : orderId
    });
    return  response.fold((l) => l, (r) => r) ;
  }

}