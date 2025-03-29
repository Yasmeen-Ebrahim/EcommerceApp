import 'package:ecommerceproject/controller/offers/offerscontroller.dart';
import 'package:ecommerceproject/core/class/statusrequest.dart';
import 'package:ecommerceproject/core/constant/colors.dart';
import 'package:ecommerceproject/core/constant/routes.dart';
import 'package:ecommerceproject/data/model/itemsmodel.dart';
import 'package:ecommerceproject/view/widget/customhomebar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/favoritecontroller.dart';
import '../../widget/offers/discountItems.dart';
import '../../widget/offers/searchresult.dart';
import '../../widget/searchcardresultitem.dart';

class OffersItems extends StatelessWidget {
  const OffersItems({super.key});

  @override
  Widget build(BuildContext context) {

    OffersControllerImp offersController = Get.put(OffersControllerImp());
    Get.put(FavoriteControllerImp());
    
    return Scaffold(
      body: ListView(
        children: [
          
          CustomHomeBar(
              searchtitle: "65".tr ,
              searchpress: (){
                offersController.searchPressed();
                },
              notificationpress: (){},
              favoritepress: (){
                Get.toNamed(AppRoutes.favoritescreen);
              },
              onChanged: (val){
                offersController.checkSearch(val);
              },
              myController: offersController.searchFieldController!
          ),
          
          SizedBox(height: 15,),
           GetBuilder<OffersControllerImp>(builder: (controller){
            return offersController.isSearch == false ? controller.statusRequest == StatusRequest.loading ?
            Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),):
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.offersItemsList.length,
                itemBuilder: (context , i){
                  return DiscountItems(itemModel: ItemModel.fromJson(controller.offersItemsList[i]),);
                },
              ),
            ) : SearchResult();
          },),
        ],
      )
    );
  }
}
