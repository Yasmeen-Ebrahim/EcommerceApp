import 'package:ecommerceproject/controller/itemdetailscontroller.dart';
import 'package:ecommerceproject/core/constant/colors.dart';
import 'package:ecommerceproject/core/constant/routes.dart';
import 'package:ecommerceproject/view/widget/itemdetails/descdetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/itemdetails/bottomnavigationbar.dart';
import '../../widget/itemdetails/coloroptions.dart';
import '../../widget/itemdetails/colottitle.dart';
import '../../widget/itemdetails/countpricedetail.dart';
import '../../widget/itemdetails/imagedetail.dart';
import '../../widget/itemdetails/itemtitle.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar:
      BottomNavigationBarCard(button: 'Go To Card' , onpressed: (){Get.toNamed(AppRoutes.cartPage);},),
      body: GetBuilder<ItemDetailsControllerImp>(builder: (controller){
        return ListView(
          children: [
            ImageDetail(),
            SizedBox(height: 20,),
            ItemTitle(),
            SizedBox(height: 13,),
            CountPriceDetail(controller.add , controller.remove, controller.countItem.toString()),
            SizedBox(height: 13,),
            DescDetai(),
            SizedBox(height: 18,),
            ColorDetail(),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  ColorOptions(colorname: 'Red', namecolor: AppColors.primaryColor, containercolor: AppColors.white, margin: 0,),
                  ColorOptions(colorname: 'black', namecolor: AppColors.white, containercolor: AppColors.primaryColor, margin: 13,),
                  ColorOptions(colorname: 'grey', namecolor: AppColors.primaryColor, containercolor: AppColors.white, margin: 13),
                ],
              )
            ),
            SizedBox(height: 20,)
          ],
        );
      },)
    );
  }
}
