import 'package:ecommerceproject/core/class/statusrequest.dart';
import 'package:ecommerceproject/core/constant/colors.dart';
import 'package:ecommerceproject/view/widget/cart/cartitemsnum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../controller/cart/cartcontroller.dart';
import '../../widget/cart/bottomnavigationbarcart.dart';
import '../../widget/cart/customcardcart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
      ),
        bottomNavigationBar: GetBuilder<CartControllerImp>(builder: (controller){
          return BottomNavigationBarCart(
            price: '${controller.price}.0',
            discount: '${controller.couponDiscount}',
            shipping: '0.0',
            totalprice: '${controller.totalPrice}.0',
            pressOrder: () {
              controller.goToCheckOutOrder();
            },
            couponControl: controller.couponController!,
            onapply: () {
              controller.checkCoupon();
              },
          );
        },),
        body: ListView(
          children: [
            SizedBox(height: 10,),
            GetBuilder<CartControllerImp>(builder: (controller){
              return CartItemsNum(card: "You Have ${controller.count} Items In Your List");
            }),
            SizedBox(height: 20,),
            GetBuilder<CartControllerImp>(builder: (controller){
              return controller.statusRequest == StatusRequest.loading?
              Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),):
              controller.statusRequest == StatusRequest.noDatafailure ?
              Center(child: Column(children: [SizedBox(height: 100,),  Text("there is no items")],),) :
              ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  ...List.generate(controller.viewdata.length, (i){
                    return Column(
                      children: [
                        CustomCardCart(
                          image: '${controller.viewdata[i]['items_image']}',
                          name: "${controller.viewdata[i]['items_name']}",
                          price: "${controller.viewdata[i]['itemprice']}",
                          count: "${controller.viewdata[i]['itemcount']}",
                          onPresseadd: () async{
                            await controller.add(controller.viewdata[i]['items_id'].toString());
                            controller.refreshPage();
                          },
                          onPresseremove: () async{
                            await controller.remove(controller.viewdata[i]['items_id'].toString());
                            controller.refreshPage();
                          },
                        ),
                        SizedBox(height: 10,),
                      ],
                    );
                  })
                ],
              );
            })
          ],
        ),
    );
  }
}
