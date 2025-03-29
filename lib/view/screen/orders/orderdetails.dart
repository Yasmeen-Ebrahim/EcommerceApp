import 'package:ecommerceproject/controller/orders/orderDetailscontroller.dart';
import 'package:ecommerceproject/core/class/statusrequest.dart';
import 'package:ecommerceproject/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/orders/tablerow.dart';
import '../../widget/orders/tabletitles.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(OrderDetailsControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details"),
      ),
      body: GetBuilder<OrderDetailsControllerImp>(builder: (controller){
        return controller.statusRequest == StatusRequest.loading ?
            Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),): ListView(
            children:[
              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12 , vertical: 15),
                    child: Column(
                      children: [
                        Table(
                          children: [
                            TableRow(
                                children: [
                                  TableTitles(title: 'Item',),
                                  TableTitles(title: 'QTY',),
                                  TableTitles(title: 'Price',)
                                ]
                            ),
                            ...List.generate(controller.orderDetailsList.length, ((i){
                                  return  TableRow(
                                    children: [
                                      TableRowInfo(info: '${controller.orderDetailsList[i].itemsName}',),
                                      TableRowInfo(info: '${controller.orderDetailsList[i].itemcount}',),
                                      TableRowInfo(info: '${controller.orderDetailsList[i].itemprice}',),
                                    ]
                                  );
                               })
                            )],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                                "Shipping Price : ${controller.orderDetails.ordersPricedelivery}\$" ,
                                style: TextStyle(
                                    color: AppColors.primaryColor ,
                                    fontWeight: FontWeight.bold
                                )
                                ,textAlign: TextAlign.center
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if(controller.orderDetails.ordersDeliverytype == "Delivery") Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13 , vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Shipping Address" , style: TextStyle(color: AppColors.primaryColor , fontWeight: FontWeight.bold),),
                        Text("${controller.orderDetails.addressCity} ${controller.orderDetails.addressStreet}" , style: TextStyle(fontSize: 14),),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40,),
              Container(
                width: 250,
                height: 250,
                child: Image.asset(
                  "assets/images/delivery.png" ,
                  opacity: AlwaysStoppedAnimation(.10) ,
                  color: AppColors.primaryColor,
                ),
              )
            ]
        );
      },),
    );
  }
}