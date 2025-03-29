import 'package:get/get.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/serverlinks/serverlink.dart';

class ArchivedOrders {

  Crud control = Get.put(Crud());

  getArchivedOrders(String userId) async {
    var response = await control.postData("${AppServerLinks.serverLink}/order/archive.php",{
      "userid" : userId
    });
    return  response.fold((l) => l, (r) => r) ;
  }

}