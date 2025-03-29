import 'package:ecommerceproject/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/colors.dart';

class AddAddressMap extends StatelessWidget {
  const AddAddressMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Address"),
      ),
      body: Stack(
        children: [
         Positioned(
           bottom: 10,
           child: Container(
             margin: EdgeInsets.symmetric(horizontal: 70),
             padding: EdgeInsets.symmetric(horizontal: 70),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
                 color: AppColors.primaryColor,
             ),
             child: MaterialButton(
               child: Text(
                 "Continue" ,
                  style: TextStyle(color: AppColors.white),),
                  onPressed: (){
                     Get.toNamed(AppRoutes.addressDetails);
                },
             ),
           ),
         )
        ],
      ),
    );
  }
}
