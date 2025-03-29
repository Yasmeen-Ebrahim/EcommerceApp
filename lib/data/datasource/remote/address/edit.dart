import 'package:get/get.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/serverlinks/serverlink.dart';

class EditAddress {

  Crud control = Get.put(Crud());

  getEditAddressData(String name , String city , String street , String addressId) async {
    var response = await control.postData("${AppServerLinks.serverLink}/address/edit.php",{
      "name"   : name,
      "city"   : city,
      "street" : street,
      "addressid" : addressId ,
    });
    return  response.fold((l) => l, (r) => r) ;
  }

}
