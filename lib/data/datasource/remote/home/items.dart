import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/serverlinks/serverlink.dart';

class ItemsData {

  Crud control = Get.put(Crud());

  postItemsData(String categoryid , String userid) async {
    var response = await control.postData("${AppServerLinks.serverLink}/item.php",{
      "categoryid" : categoryid.toString(),
      "userid" : userid.toString()
    });
    return  response.fold((l) => l, (r) => r) ;
  }

}
