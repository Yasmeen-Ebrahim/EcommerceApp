import 'package:get/get.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/serverlinks/serverlink.dart';

class AddFavoriteData {

  Crud control = Get.put(Crud());

  getAddFavoriteData(String userId , String itemId) async {
    var response = await control.postData("${AppServerLinks.serverLink}/favorite/favoriteadd.php",{
      "userid" : userId,
      "itemid" : itemId
    });
    return  response.fold((l) => l, (r) => r) ;
  }

}
