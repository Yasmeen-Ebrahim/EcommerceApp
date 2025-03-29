import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/serverlinks/serverlink.dart';

class SearchData {

  Crud control = Get.put(Crud());

  postSearchData(String searchName) async {
    var response = await control.postData("${AppServerLinks.serverLink}/search.php",{
      "search" : searchName
    });
    return  response.fold((l) => l, (r) => r) ;
  }

}
