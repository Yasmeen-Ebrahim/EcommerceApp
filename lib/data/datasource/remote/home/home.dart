import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/serverlinks/serverlink.dart';

class HomeData {

  Crud control = Get.put(Crud());

  postHomeData() async {
    var response = await control.postData("${AppServerLinks.serverLink}/home.php",{});
    return  response.fold((l) => l, (r) => r) ;
  }

}
