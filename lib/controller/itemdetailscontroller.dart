import 'package:ecommerceproject/data/model/itemsmodel.dart';
import 'package:get/get.dart';
import '../core/class/statusrequest.dart';
import '../core/functions/handlefunction.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/cart/add.dart';
import '../data/datasource/remote/cart/itemcount.dart';
import '../data/datasource/remote/cart/remove.dart';

abstract class ItemDetailsController extends GetxController{
  initailValues();
  add();
  remove();
  addItems(String idItem);
  removeItems(String idItem);
  getItemCount(String idItem);
}
class ItemDetailsControllerImp extends ItemDetailsController{

  int countItem = 0 ;
  late ItemModel itemDatails ;
  StatusRequest? statusRequest ;
  MyServices myServices = Get.find();
  AddCart addController = Get.put(AddCart());
  RemoveCart removeController = Get.put(RemoveCart());
  ItemCountCart itemCountControllr = Get.put(ItemCountCart());

  @override
  void onInit() {
    initailValues();
    super.onInit();
  }

  @override
  initailValues() async {
    itemDatails = Get.arguments['itemDetail'];
    countItem = await getItemCount(itemDatails.itemsId.toString());
    update();
  }

  addItems(String idItem) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addController.getAddCartData(myServices.sharedPreferences.getString("id")!, idItem);
    print("=============================== Controller $response ") ;
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success) {
      if(response['status'] == "success"){
        Get.snackbar("notification","item added to cart list successfully");
      }else{
        statusRequest = StatusRequest.noDatafailure ;
      }
    }
    update();
  }

  @override
  removeItems(String idItem) async {
    statusRequest = StatusRequest.loading;
    var response = await removeController.getRemoveCartData(myServices.sharedPreferences.getString("id")!, idItem);
    print("=============================== Controller $response ") ;
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success) {
      if(response['status'] == "success"){
        Get.snackbar("notification","item removed from cart list successfully");
      }else{
        statusRequest = StatusRequest.noDatafailure ;
      }
    }
    update();
  }



  @override
  getItemCount(String idItem) async{
    statusRequest = StatusRequest.loading;
    var response = await itemCountControllr.getItemCountCartData(myServices.sharedPreferences.getString("id")!, idItem);
    print("=============================== Controller $response ") ;
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success) {
      if(response['status'] == "success"){
        int itemCount = response['data'];
        return itemCount ;
      }else{
        statusRequest = StatusRequest.noDatafailure ;
      }
    }
    update();
  }

  @override
  add() {
    addItems(itemDatails.itemsId.toString());
    countItem ++ ;
    update();
  }

  @override
  remove() {
    removeItems(itemDatails.itemsId.toString());
    if(countItem > 0){
      countItem -- ;
      update();
    }
  }



}