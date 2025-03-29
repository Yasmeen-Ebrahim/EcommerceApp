import 'package:ecommerceproject/controller/itemscontroller.dart';
import 'package:ecommerceproject/view/widget/customhomebar.dart';
import 'package:ecommerceproject/view/widget/items/customcategoriesitems.dart';
import 'package:ecommerceproject/view/widget/items/customitemspage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/searchcardresultitem.dart';

class ItemsPage extends StatelessWidget{
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(ItemsControllerImp());

    return Scaffold(
      body:GetBuilder<ItemsControllerImp>(builder: (controller){
        return  ListView(
          children: [
            
            CustomHomeBar(searchtitle: '65'.tr,
              searchpress: (){controller.searchPressed();},
              notificationpress: (){},
              favoritepress: (){
                controller.goToFavoriteList();
              }, onChanged: (val ) { controller.checkSearch(val); },
              myController: controller.searchFieldController!,
            ),
            
           GetBuilder<ItemsControllerImp>(builder: (controller){
             return  controller.isSearch == false ? Column(
               children: [
                 SizedBox(height: 35,),
                 CustomCategoriesItems(),
                 SizedBox(height: 25,),
                 Container(
                   child: CustomItemsPage(),
                 )
               ],
             ) : SearchCardResultItem();
           })
          ],
        );
      },)
    );
  }
}
