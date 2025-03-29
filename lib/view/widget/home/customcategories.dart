import 'package:ecommerceproject/controller/homecontroller.dart';
import 'package:ecommerceproject/core/class/statusrequest.dart';
import 'package:ecommerceproject/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/functions/changelangfun.dart';

class CustomCategories extends GetView<HomeControllerImp> {
  const CustomCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(builder: (controller){
      return controller.statusRequest == StatusRequest.loading ?
      Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),):
      controller.statusRequest == StatusRequest.noDatafailure ?
      Center(child: Text(changeLanguage("لا يوجد منتجات" , "No Data"))) :
      Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: 100,
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: 10,);
          },
          scrollDirection: Axis.horizontal,
          itemCount: controller.categoriesList.length,
          itemBuilder: (context, i) {
            return Categories(categoriesModel: CategoriesModel.fromJson(controller.categoriesList[i]), selectedCatagory: i,);
          },
        ),
      );
    });
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel ;
  final int selectedCatagory ;
  const Categories({super.key, required this.categoriesModel, required this.selectedCatagory});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.goToItemsPage(controller.categoriesList , selectedCatagory , categoriesModel.categoriesId.toString());
      },
      child: Column(
        children: [
          Container(
            child : CachedNetworkImage(imageUrl: "${categoriesModel.categoriesImage}",),
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(17)
            ),
            width: 63,
            height: 60,
          ),
          SizedBox(height: 5,),
          Text(changeLanguage(categoriesModel.categoriesNameAr , categoriesModel.categoriesName) , style: TextStyle(color: AppColors.grey,fontSize: 11),)
        ],
      ),
    );
  }
}


