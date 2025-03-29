import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceproject/controller/homecontroller.dart';
import 'package:ecommerceproject/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/functions/changelangfun.dart';
import '../../../data/model/itemsmodel.dart';

class CustomItems extends GetView<HomeControllerImp> {
  const CustomItems({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(builder: (controller){
      return controller.statusRequest == StatusRequest.loading ?
      Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),):
      controller.statusRequest == StatusRequest.noDatafailure ? Center(child: Text(changeLanguage("لا يوجد منتجات" , "No Data"))) :
      Container(
        height: 120,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: 8,);
          },
          itemCount: controller.itemsList.length,
          itemBuilder: (context , i){
            return Items(itemModel: ItemModel.fromJson(controller.itemsList[i]));
          },
        ),
      );
    });
  }
}

class Items extends StatelessWidget {
  final ItemModel itemModel ;
  const Items({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: CachedNetworkImage(
           imageUrl:  "${itemModel.itemsImage}",
            height: 120,
            width: 175,
            fit: BoxFit.fill,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
          ),
        ),
        Container(
          height: 120,
          width: 175,
          decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(20)
          ),
        ),
        Positioned(
          left : 10.0 ,
          bottom : 85,
          child: Container(
            child: Text(changeLanguage(itemModel.itemsNameAr , itemModel.itemsName) , style: TextStyle(fontSize: changeLanguage(12.0, 14.0) , fontWeight: FontWeight.bold , color: Colors.white),),
          ),
        )
      ],
    );
  }
}

