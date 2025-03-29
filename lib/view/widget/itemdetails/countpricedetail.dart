import 'package:ecommerceproject/controller/itemdetailscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/colors.dart';

class CountPriceDetail extends GetView<ItemDetailsControllerImp> {
  final void Function()? add ;
  final void Function()? remove ;
  final String count ;
  const CountPriceDetail(this.add, this.remove, this.count, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(onPressed: add, icon: Icon(Icons.add)),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 6),
                  child: Text(count, style: TextStyle(fontSize: 18),
                  )),
              IconButton(onPressed: remove, icon: Icon(Icons.remove)),
            ],
          ),
          Text("${controller.itemDatails.discountPrice}\$" ,
            style: TextStyle(
              fontSize: 25,
              color: AppColors.primaryColor,
            ),)
        ],
      ),
    );
  }
}
