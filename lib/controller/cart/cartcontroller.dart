import 'package:ecommerceproject/core/class/statusrequest.dart';
import 'package:ecommerceproject/core/services/services.dart';
import 'package:ecommerceproject/data/datasource/remote/cart/coupon.dart';
import 'package:ecommerceproject/data/model/couponmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlefunction.dart';
import '../../data/datasource/remote/cart/add.dart';
import '../../data/datasource/remote/cart/itemcount.dart';
import '../../data/datasource/remote/cart/remove.dart';
import '../../data/datasource/remote/cart/view.dart';

abstract class CartController extends GetxController{
  view();
  add(String idItem);
  remove(String idItem);
  getItemCount(String idItem) ;
  refreshPage();
  checkCoupon();
  goToCheckOutOrder();
}

class CartControllerImp extends CartController {

  TextEditingController? couponController ;
  CouponModel couponModel = CouponModel();
  List couponData = [];
  int couponDiscount = 0 ;
  String? couponName ;
  int couponId = 0  ;
  int totalPrice = 0;
  bool isCheck = false ;


  List viewdata = [];
  List priceCountData = [];
  int price = 0;
  int count = 0 ;
  StatusRequest? statusRequest ;
  MyServices myServices = Get.find();
  AddCart addController = Get.put(AddCart());
  RemoveCart removeController = Get.put(RemoveCart());
  ItemCountCart itemCountController = Get.put(ItemCountCart());
  ViewCart viewController = Get.put(ViewCart());
  AddCoupon addCouponController = Get.put(AddCoupon());

  @override
  add(String idItem) async {
    statusRequest = StatusRequest.loading;
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
  remove(String idItem) async {
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
    var response = await itemCountController.getItemCountCartData(myServices.sharedPreferences.getString("id")!, idItem);
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
  view() async {
    statusRequest = StatusRequest.loading;
    var response = await viewController.getViewCartData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ") ;
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success) {
      if(response['status'] == "success"){
        viewdata.addAll(response['data']);
        priceCountData.addAll(response['price&count']);
        price = priceCountData[0]['totalitemprice'] ;
        count = priceCountData[0]['totalitemcount'] ;
        totalPrice = price ;
      }else{
        statusRequest = StatusRequest.noDatafailure ;
      }
    }
    update();
  }


  @override
  refreshPage() {
    price = 0 ;
    count = 0;
    priceCountData.clear();
    viewdata.clear();
    view();
  }



  @override
  void onInit() {
    view();
    couponController = TextEditingController();
    super.onInit();
  }

  //coupon

  @override
  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    var response = await addCouponController.getCouponData(couponController!.text);
    print("=============================== Controller $response ") ;
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success) {
      if(response['status'] == "success"){
        isCheck = true ;
        couponData.addAll(response['couponData']);
        couponDiscount = couponData[0]['coupon_discount'];
        couponName = couponData[0]['coupon_name'];
        couponId = couponData[0]['coupon_id'];
        totalPrice = price - price * couponDiscount ~/ 100 ;
      }else{
        isCheck = false ;
        Get.snackbar(
          snackPosition: SnackPosition.BOTTOM,
            "message",
            "coupon is not valid"
        );
      }
    }
    update();
  }

  @override
  goToCheckOutOrder() {
    Get.toNamed(AppRoutes.checkOut , arguments: {
      "priceOrder" : totalPrice ,
      "coupon" : couponId,
      "couponDiscount" : couponDiscount
    });
  }


}