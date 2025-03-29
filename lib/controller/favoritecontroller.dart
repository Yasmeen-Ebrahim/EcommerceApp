import 'package:ecommerceproject/data/datasource/remote/favorite/viewfavorite.dart';
import 'package:get/get.dart';
import 'package:ecommerceproject/core/class/statusrequest.dart';
import 'package:ecommerceproject/core/services/services.dart';
import 'package:ecommerceproject/data/datasource/remote/favorite/removefavorite.dart';
import '../core/functions/handlefunction.dart';
import '../data/datasource/remote/favorite/addfavorite.dart';

abstract class FavoriteController extends GetxController{
  addInFavorite(String itemId);
  removeFromFavorite(String itemId);
  getFavoriteList() ;
  removeFromFavoritePage(String itemId);
}
class FavoriteControllerImp extends FavoriteController{

  AddFavoriteData addController = Get.put(AddFavoriteData());
  RemoveFavoriteData removeController = Get.put(RemoveFavoriteData());
  ViewFavoriteData viewController = Get.put(ViewFavoriteData());

  MyServices myServices = Get.find();

  StatusRequest? statusRequest;
  List myFavoriteList = [];


  @override
  void onInit() {
    getFavoriteList();
    super.onInit();
  }

  @override
  addInFavorite(itemId) async{
    statusRequest = StatusRequest.loading;
    var response = await addController.getAddFavoriteData(myServices.sharedPreferences.getString("id")!, itemId);
    print("=============================== Controller $response ") ;
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success) {
      if(response['status'] == "success"){
        Get.snackbar("notification","item added in favorite list successfully");
        myFavoriteList.clear();
        getFavoriteList();
      }else{
        statusRequest = StatusRequest.noDatafailure ;
      }
    }
    update();
  }


  @override
  removeFromFavorite(itemId) async {
    statusRequest = StatusRequest.loading;
    var response = await removeController.getRemoveFavoriteData(myServices.sharedPreferences.getString("id")!, itemId);
    print("=============================== Controller $response ") ;
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success) {
      if(response['status'] == "success"){
        Get.snackbar("notification","item removed from favorite list successfully");
      }else{
        statusRequest = StatusRequest.noDatafailure ;
      }
    }
    update();
  }

  @override
  removeFromFavoritePage(itemId) async{
    statusRequest = StatusRequest.loading;
    var response = await removeController.getRemoveFavoriteData(myServices.sharedPreferences.getString("id")!, itemId);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status'] == "success"){
        Get.back();
        myFavoriteList.clear();
        getFavoriteList();
      }else{
        statusRequest = StatusRequest.noDatafailure ;
      }
    }
    update();
  }


  @override
  getFavoriteList() async{
    statusRequest = StatusRequest.loading;
    var response = await viewController.getViewFavoriteData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ") ;
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success) {
      if(response['status'] == "success"){
        myFavoriteList.addAll(response['data']);
      }else{
        statusRequest = StatusRequest.noDatafailure ;
      }
    }
    update();
  }

}