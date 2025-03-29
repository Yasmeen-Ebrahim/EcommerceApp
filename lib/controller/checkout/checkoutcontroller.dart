import 'package:ecommerceproject/core/constant/routes.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlefunction.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/address/view.dart';
import '../../data/datasource/remote/checkout/checkout.dart';

abstract class CheckoutController extends GetxController{
  paymentFunction(String val);
  deliveryTypeFunction(val);
  chooseAddress(val);
  viewUserAddresses();
  checkout();
}
class CheckoutControllerImp extends CheckoutController{

  StatusRequest? statusRequest ;
  MyServices myServices = Get.find();
  ViewAddress viewController = ViewAddress();
  List addressList = [];

  CheckOutData checkoutData = Get.put(CheckOutData());

  String? paymentMethod ;
  String? deliveryType ;
  int? addressId ;
  int deliveryPrice = 25 ;

  late int couponId ;
  late int priceOrder ;
  late int couponDiscount ;

  @override
  void onInit() {
    couponId = Get.arguments['coupon'] ;
    priceOrder = Get.arguments['priceOrder'] ;
    couponDiscount = Get.arguments['couponDiscount'] ;
    super.onInit();
  }



  @override
  paymentFunction(val) {
    paymentMethod = val ;
    update();
  }


  @override
  deliveryTypeFunction(val) {
    deliveryType = val ;
    update();
  }


  @override
  chooseAddress(val) {
    addressId = val ;
    update();
  }

  @override
  viewUserAddresses() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewController.getViewAddressData(
        myServices.sharedPreferences.getString("id")!
    );
    print("=============================== Controller $response ") ;
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success) {
      if(response['status'] == "success"){
        addressList.clear();
        addressList.addAll(response['data']);
      }else{
        statusRequest = StatusRequest.none ;
        update();
      }
    }
    update();
  }


  // checkout orders
  @override
  checkout() async {
    if(paymentMethod == null){
      return Get.snackbar("Error", "choose the payment method , please");
    }
    if(deliveryType == null){
      return Get.snackbar("Error", "choose the delivery type , please");
    }
    if(deliveryType == "Delivery" && addressId == null){
      return Get.snackbar("Error", "choose the address , please");
    }
    if(deliveryType == "Drive Thru"){
      deliveryPrice = 0 ;
    }

    int totalOrderPrice = priceOrder + deliveryPrice ;

    statusRequest = StatusRequest.loading;
    update();
    var response = await checkoutData.postCheckOutData(
        myServices.sharedPreferences.getString("id").toString(),
        paymentMethod!,
        deliveryType!,
        addressId.toString(),
        couponId.toString(),
        couponDiscount.toString(),
        priceOrder.toString(),
        deliveryPrice.toString(),
        totalOrderPrice.toString()
    );
    print("=============================== Controller $response ") ;
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success) {
      if(response['status'] == "success"){
        Get.snackbar("Message", "order added successfully");
        Get.offAllNamed(AppRoutes.homePage);
      }else{
        statusRequest = StatusRequest.none ;
      }
    }
    update();
  }


}