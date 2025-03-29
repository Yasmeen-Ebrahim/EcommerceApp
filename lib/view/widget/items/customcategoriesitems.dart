import 'package:ecommerceproject/controller/itemscontroller.dart';
import 'package:ecommerceproject/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/colors.dart';
import '../../../core/functions/changelangfun.dart';


class CustomCategoriesItems extends GetView<ItemsControllerImp> {
  const CustomCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 20,);
        },
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, i) {
          return Categories(categoriesModel: CategoriesModel.fromJson(controller.categories[i]), selectedCatItem: i,);
        },
      ),
    );
  }
}

class Categories extends StatelessWidget {
  final CategoriesModel categoriesModel ;
  final int selectedCatItem ;
  const Categories({super.key, required this.categoriesModel, required this.selectedCatItem});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(builder: (controller){
     return InkWell(
       onTap: (){
         controller.itemPressed(selectedCatItem , categoriesModel.categoriesId.toString());
       },
       child:  Container(
           decoration: controller.selectedCat == selectedCatItem ? BoxDecoration(
               border: Border(bottom: BorderSide(color: AppColors.primaryColor , width: 3))
           ) : null,
           child: Text(
             changeLanguage(categoriesModel.categoriesNameAr , categoriesModel.categoriesName) ,
             style: TextStyle(color: AppColors.grey,fontSize: 18),
           )
       )
     );
    });
  }
}



