import 'package:get/get.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/serverlinks/serverlink.dart';

class DeleteAddress {

  Crud control = Get.put(Crud());

  getDeleteAddressData(String addressId) async {
    var response = await control.postData("${AppServerLinks.serverLink}/address/delete.php",{
      "addressid" : addressId
    });
    return  response.fold((l) => l, (r) => r) ;
  }

}