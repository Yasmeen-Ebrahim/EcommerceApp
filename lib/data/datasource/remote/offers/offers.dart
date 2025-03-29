import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/serverlinks/serverlink.dart';

class OffersData {

  Crud control = Get.put(Crud());

  postOffersData(String userid) async {
    var response = await control.postData("${AppServerLinks.serverLink}/offers/offers.php",{
      "userid" : userid.toString()
    });
    return  response.fold((l) => l, (r) => r) ;
  }

}
