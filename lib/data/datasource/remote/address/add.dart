import 'package:get/get.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/serverlinks/serverlink.dart';

class AddAddress {

  Crud control = Get.put(Crud());

  getAddAddressData(String name , String city , String street , String lat , String long , String userId) async {
    var response = await control.postData("${AppServerLinks.serverLink}/address/add.php",{
      "name"   : name,
      "city"   : city,
      "street" : street,
      "lat"    : lat,
      "long"   : long,
      "userid" : userId ,
    });
    return  response.fold((l) => l, (r) => r) ;
  }

}
