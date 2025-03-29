import 'package:ecommerceproject/controller/homecontroller.dart';
import 'package:ecommerceproject/view/widget/home/customcategories.dart';
import 'package:ecommerceproject/view/widget/customhomebar.dart';
import 'package:ecommerceproject/view/widget/home/customhomecard.dart';
import 'package:ecommerceproject/view/widget/home/customitems.dart';
import 'package:ecommerceproject/view/widget/home/customtitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../widget/searchcardresulthome.dart';

class HomePage extends GetView<HomeControllerImp> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(HomeControllerImp());

    return ListView(
      children: [

        CustomHomeBar(
          searchtitle: "65".tr ,
          searchpress: (){controller.searchPressed();},
          notificationpress: (){},
          favoritepress: (){controller.goToFavoriteList();},
          onChanged: (val) {controller.checkSearch(val);},
          myController: controller.searchFieldController!,
        ),

       GetBuilder<HomeControllerImp>(builder: (controller){
         return controller.isSearch == false ? Column(
           children: [
             CustomHomeCard(title: "68".tr, body: "69".tr),
             SizedBox(height: 15,),
             CustomCategories(),
             SizedBox(height: 13,),
             Container(
               padding: EdgeInsets.symmetric(horizontal: 15),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SizedBox(height: 20,),
                   Customtitle(title: "66".tr),
                   SizedBox(height: 13,),
                   CustomItems(),
                 ],
               ),
             )
           ],
         ) : SearchCardResultHome();
       })
       ],
    );
  }
}
