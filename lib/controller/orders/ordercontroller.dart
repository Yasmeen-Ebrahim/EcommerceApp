import 'package:ecommerceproject/core/services/services.dart';
import 'package:ecommerceproject/data/datasource/remote/order/dataorders.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlefunction.dart';
import '../../data/datasource/remote/order/deleteorder.dart';
import '../../data/datasource/remote/order/orderdetails.dart';

abstract class OrderDataController extends GetxController{
  getOrders();
  deleteOrders(String orderId);
  specifyStatus(val);
}
class OrderDataControllerImp extends OrderDataController {

  StatusRequest? statusRequest;
  OrdersData ordersData = OrdersData();
  MyServices myServices = Get.find();
  List orders = [];

  OrderDetailsData orderDetailscontroller = Get.put(OrderDetailsData());
  DeleteOrder deleteOrderController = Get.put(DeleteOrder());
  List orderDetailsList = [];

  @override
  getOrders() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.postOrdersData(
        myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        orders.addAll(response['Orders']);
      } else {
        statusRequest == StatusRequest.none ;
      }
    }
    update();
  }


  @override
  deleteOrders(orderId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await deleteOrderController.deleteOrders(orderId);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.back();
        orders.clear();
        getOrders();
      } else {
        Get.snackbar("Error", "There is Wrong");
      }
    }
    update();
  }


  @override
  specifyStatus(val) {
    if(val == 0){
      return "Pending" ;
    }else if(val == 1){
      return "Prepared" ;
    }else if(val == 2){
      return "On the way" ;
    }else if(val == 3){
      return "Archived" ;
    }
  }


  @override
  void onInit() {
    getOrders();
    super.onInit();
  }


}