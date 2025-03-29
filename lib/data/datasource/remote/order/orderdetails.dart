import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/serverlinks/serverlink.dart';

class OrderDetailsData {

  Crud control = Get.put(Crud());

  postOrderDetailsData(String orderId) async {
    var response = await control.postData("${AppServerLinks.serverLink}/order/orderdetails.php",{
      "orderid" : orderId
    });
    return  response.fold((l) => l, (r) => r) ;
  }

}