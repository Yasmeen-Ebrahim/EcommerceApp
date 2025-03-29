import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/constant/serverlinks/serverlink.dart';

class AddCoupon {

  Crud control = Get.put(Crud());

  getCouponData(String couponName) async {
    var response = await control.postData("${AppServerLinks.serverLink}/coupon/checkcoupon.php",{
      "couponname" : couponName
    });
    return  response.fold((l) => l, (r) => r) ;
  }

}
