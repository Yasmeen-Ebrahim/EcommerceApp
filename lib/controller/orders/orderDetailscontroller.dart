import 'package:ecommerceproject/data/model/orderdetailsmodel.dart';
import 'package:ecommerceproject/data/model/ordermodel.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlefunction.dart';
import '../../data/datasource/remote/order/orderdetails.dart';

abstract class OrderDetailsController extends GetxController{

  getOrderDetails();

}
class OrderDetailsControllerImp extends OrderDetailsController{
  
  late OrderModel orderDetails ;

  OrderDetailsData orderDetailscontroller = Get.put(OrderDetailsData());
  StatusRequest? statusRequest ;
  List<OrderDetailsModel> orderDetailsList = [];



  @override
  void onInit() {
    orderDetails = Get.arguments['orderDetails'];
    getOrderDetails();
    super.onInit();
  }


  @override
  getOrderDetails() async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderDetailscontroller.postOrderDetailsData(orderDetails.ordersId.toString());
    print("=============================== Controller $response ") ;
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success) {
      if(response["status"] == "success"){
        List data  = (response['orderData']);
        orderDetailsList.addAll(data.map((e) => OrderDetailsModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.noDatafailure;
      }
    }
    update();
  }


}