import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/serverlinks/serverlink.dart';

class CheckOutData {

  Crud control = Get.put(Crud());

  postCheckOutData(String userid , String payment , String type , String address , String coupon ,String couponDiscount, String price , String deliveryPrice , String totalorderPrice) async {
    var response = await control.postData("${AppServerLinks.serverLink}/order/checkout.php",{
      "userid"              :  userid ,
      "paymentmethod"       :  payment ,
      "deliverytype"        :  type ,
      "useraddress"         :  address ,
      "ordercoupon"         :   coupon,
      "ordercoupondiscount" : couponDiscount ,
      "orderprice"          :  price ,
      "orderdeliveryprice"  :  deliveryPrice,
      "totalorderprice"     :  totalorderPrice
    });
    return  response.fold((l) => l, (r) => r) ;
  }

}
