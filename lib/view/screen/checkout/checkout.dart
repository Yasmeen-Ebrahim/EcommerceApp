import 'package:ecommerceproject/controller/checkout/checkoutcontroller.dart';
import 'package:ecommerceproject/core/class/statusrequest.dart';
import 'package:ecommerceproject/core/constant/colors.dart';
import 'package:ecommerceproject/view/widget/checkout/delliverytype.dart';
import 'package:ecommerceproject/view/widget/checkout/useraddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/checkout/bottomnavigationbar.dart';
import '../../widget/checkout/payment method.dart';

class CheckOut extends GetView<CheckoutControllerImp> {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(CheckoutControllerImp());

    return Scaffold(
      bottomNavigationBar: BottomNavigationBarCheckout(
        text: 'Checkout',
        onCheckout: () {
          controller.checkout();
        },
      ),
      appBar: AppBar(
        title: Text("CheckOut"),
      ),
      body: GetBuilder<CheckoutControllerImp>(builder: (controller){
        return ListView(
          children: [
            //payment method
            Container(
              margin: EdgeInsets.only(top: 30 , left: 20 , bottom: 10),
              child: Text("Choose Payment Method" , style: TextStyle(color: AppColors.primaryColor , fontWeight: FontWeight.bold , fontSize: 17),),
            ),
            Container(
              child : Column(
                children: [
                  InkWell(
                      child: PaymentMethod(
                        name: 'Cash', isActive: controller.paymentMethod == "Cash" ? true : false,
                      ),
                    onTap: (){
                        controller.paymentFunction("Cash");
                    },
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                      child: PaymentMethod(
                        name: 'Payment Cards', isActive: controller.paymentMethod == "Payment Cards" ? true : false,
                      ),
                    onTap: (){
                        controller.paymentFunction("Payment Cards");
                    },
                  )
                ],
              ),
            ),
            SizedBox(height: 25,),
            //delivery type
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 20 , bottom: 10),
              child: Text("Choose Delivery Type" , style: TextStyle(color: AppColors.primaryColor , fontWeight: FontWeight.bold , fontSize: 17),),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  InkWell(
                      child: DeliveryType(isActive: controller.deliveryType == "Delivery" ? true : false, image: "assets/images/delivery.png", name: "Delivery"),
                    onTap: (){
                        controller.deliveryTypeFunction("Delivery");
                        controller.viewUserAddresses();
                    },
                  ),
                  SizedBox(width: 12,),
                  InkWell(
                      child: DeliveryType(isActive: controller.deliveryType == "Drive Thru" ? true : false, image: "assets/images/drive.png", name: "Drive Thru"),
                    onTap: (){
                        controller.deliveryTypeFunction("Drive Thru");
                        //controller.addressList.clear();
                    },
                  ),
                ],
              ),
            ),
            //shipping address
          if(controller.deliveryType == "Delivery") controller.statusRequest == StatusRequest.loading ?
              Column(children: [SizedBox(height: 70,),CircularProgressIndicator(color: AppColors.primaryColor)],):Column(
             children: [
               Container(
                 alignment: Alignment.topLeft,
                 margin: EdgeInsets.only(top: 25 , left: 20 , bottom: 10),
                 child: Text("Shipping Address" , style: TextStyle(color: AppColors.primaryColor , fontWeight: FontWeight.bold , fontSize: 17),),
               ),
               ...List.generate(
                   controller.addressList.length, (i){
                 return InkWell(
                     onTap: (){
                       controller.chooseAddress(controller.addressList[i]['address_id']);
                     },
                     child: UserAddress(
                         isActive: controller.addressId == controller.addressList[i]['address_id'] ? true : false,
                         title: "${controller.addressList[i]['address_name']}",
                         location: "${controller.addressList[i]['address_city'] } , ${controller.addressList[i]['address_street']}")
                 );
               })
             ],
           )
          ],
        );
      },),
    );
  }
}
