import 'package:get/get.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/serverlinks/serverlink.dart';

class ViewFavoriteData {

  Crud control = Get.put(Crud());

  getViewFavoriteData(String userId) async {
    var response = await control.postData("${AppServerLinks.serverLink}/favorite/favoriteview.php",{
      "userid" : userId
    });
    return  response.fold((l) => l, (r) => r) ;
  }

}