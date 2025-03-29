import 'package:get/get.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/serverlinks/serverlink.dart';

class ViewAddress {

  Crud control = Get.put(Crud());

  getViewAddressData(String userId) async {
    var response = await control.postData("${AppServerLinks.serverLink}/address/view.php",{
     "userid" : userId
    });
    return  response.fold((l) => l, (r) => r) ;
  }

}