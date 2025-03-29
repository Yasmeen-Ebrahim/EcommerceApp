import 'dart:io';

import 'package:ecommerceproject/controller/orders/ordercontroller.dart';
import 'package:ecommerceproject/core/class/statusrequest.dart';
import 'package:ecommerceproject/core/constant/colors.dart';
import 'package:ecommerceproject/data/model/ordermodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../core/constant/routes.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(OrderDataControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text("My Orders"),
      ),
      body : GetBuilder<OrderDataControllerImp>(builder: (controller){
       return controller.statusRequest == StatusRequest.loading ?
          Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),):
          controller.statusRequest == StatusRequest.none ?
          Center(child: Text("There is no orders yet"))
           : ListView.builder(
          itemCount: controller.orders.length,
          itemBuilder: (context , i){
            return OrdersDataPage(orderModel: OrderModel.fromJson(controller.orders[i]));
          },
        );
      },)
    );
  }
}

class OrdersDataPage extends GetView<OrderDataControllerImp> {
  final OrderModel orderModel ;
  const OrdersDataPage({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5,),
          Card(
            elevation: 6.0,
            child: ListTile(
              title: Text(
                "Order# : ${orderModel.ordersId}" ,
                style: TextStyle(fontSize: 17 , fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12,),
                  Text("Date Time : ${Jiffy.parse('${orderModel.ordersDatetime}').fromNow()}" , style: TextStyle(fontSize: 14 , color: AppColors.bodytext),),
                  Text("Payment Method : ${orderModel.ordersPaymentmethod}" , style: TextStyle(fontSize: 14 , color: AppColors.bodytext),),
                  Text("Delivery Type : ${orderModel.ordersDeliverytype}" , style: TextStyle(fontSize: 14 , color: AppColors.bodytext)),
                  Text("Coupon# : ${orderModel.ordersCoupon}" , style: TextStyle(fontSize: 14 , color: AppColors.bodytext)),
                  Text("Coupon Discount : ${orderModel.ordersCoupondiscount}" , style: TextStyle(fontSize: 14 , color: AppColors.bodytext)),
                  Text("Price : ${orderModel.ordersPrice}\$" , style: TextStyle(fontSize: 14 , color: AppColors.bodytext)),
                  Text("Delivery Price : ${orderModel.ordersPricedelivery}\$" , style: TextStyle(fontSize: 14 , color: AppColors.bodytext)),
                  Text("Status : ${controller.specifyStatus(orderModel.ordersStatus)}" , style: TextStyle(fontSize: 14 , color: AppColors.bodytext)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Price : ${orderModel.ordersTotalorderprice}\$" , style: TextStyle(fontSize: 16 , color: AppColors.primaryColor , fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          IconButton(
                              onPressed: (){
                                Get.toNamed(AppRoutes.orderDetails,arguments: {
                                  "orderDetails" : orderModel
                                });
                              },
                              icon: Icon(
                                Icons.info_outlined ,
                                color: AppColors.primaryColor, size: 25,
                              )
                          ),
                          if(orderModel.ordersStatus == 0) IconButton(
                              onPressed: (){
                                Get.defaultDialog(
                                    title: "Warning",
                                    titleStyle: TextStyle(fontWeight: FontWeight.bold , fontSize: 19,color: AppColors.primaryColor),
                                    content: Text("Are you sure you want to cancel this order?" ,textAlign: TextAlign.center, style: TextStyle(color: AppColors.black),),
                                    actions: [
                                      MaterialButton(
                                        textColor: AppColors.white,
                                        color: AppColors.primaryColor,
                                        child: Text("ok"),
                                        onPressed: (){
                                          controller.deleteOrders(orderModel.ordersId.toString());
                                        },
                                      ),
                                      MaterialButton(
                                        textColor: AppColors.white,
                                        color: AppColors.primaryColor,
                                        child: Text("cancel"),
                                        onPressed: (){
                                          Get.back();
                                        },
                                      )
                                    ]
                                );
                              },
                              icon: Icon(
                                Icons.delete_outline,
                                color: AppColors.primaryColor, size: 25,
                              )
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
