import 'package:ecommerceproject/controller/itemdetailscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';

class ItemTitle extends GetView<ItemDetailsControllerImp> {
  const ItemTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Text("${controller.itemDatails.itemsName}" ,
        style: TextStyle(
            color: AppColors.primaryColor ,
            fontSize: 22 ,
            fontWeight: FontWeight.bold
        ),),
    );
  }
}
