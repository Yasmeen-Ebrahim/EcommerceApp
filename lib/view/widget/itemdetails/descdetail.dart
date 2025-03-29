import 'package:ecommerceproject/controller/itemdetailscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DescDetai extends GetView<ItemDetailsControllerImp> {
  const DescDetai({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Text("${controller.itemDatails.itemsDesc}${controller.itemDatails.itemsDesc}${controller.itemDatails.itemsDesc}${controller.itemDatails.itemsDesc}" ,
        style: TextStyle(

        ),),
    );
  }
}
