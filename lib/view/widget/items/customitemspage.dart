import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceproject/controller/favoritecontroller.dart';
import 'package:ecommerceproject/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../controller/itemscontroller.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/colors.dart';
import '../../../core/functions/changelangfun.dart';

class CustomItemsPage extends StatelessWidget {
  const CustomItemsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<ItemsControllerImp>(builder: (controller){
      return controller.statusRequest == StatusRequest.loading ?
      Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),) :
      controller.statusRequest == StatusRequest.noDatafailure ? Center(child: Column(children: [SizedBox(height:100,) , Text(changeLanguage("لا يوجد منتجات" , "no products yet"))],)) :
      GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 , childAspectRatio: 0.7),
          itemCount: controller.itemsData.length,
          itemBuilder: (context , i){
            return ItemsList(itemModel: ItemModel.fromJson(controller.itemsData[i]));
          }
      );
    });
  }
}

class ItemsList extends GetView<ItemsControllerImp> {
 final ItemModel itemModel ;
  const ItemsList({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteControllerImp());
    return Container(
      child: InkWell(
        onTap: (){
          controller.goToItemDetails(itemModel);
        },
        child: Stack(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Hero(
                      tag: "${itemModel.itemsId}",
                      child: CachedNetworkImage(
                        imageUrl : "${itemModel.itemsImage}",fit: BoxFit.fill,
                        height: 100,
                        width: 150,),
                    ),
                    SizedBox(height: 8,),
                    Text(changeLanguage(itemModel.itemsNameAr , itemModel.itemsName) , style: TextStyle(fontWeight: FontWeight.bold , color: AppColors.grey , fontSize: changeLanguage(12.0, 16.0)), textAlign: TextAlign.center),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(changeLanguage("تقييم 3.5", "Rating 3.5") , style: TextStyle(fontSize: 14),),
                        Row(
                          children: [
                            ...List.generate(5, ((i){
                              return  Icon(Icons.star , size: 14, color: AppColors.primaryColor,);
                            }))
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                           if(itemModel.itemsDiscount != 0)
                             Text("${itemModel.itemsPrice!}\$" , style: TextStyle(color: AppColors.primaryColor , fontWeight: FontWeight.bold , fontSize: 16  , decoration: TextDecoration.lineThrough , decorationThickness: 2),),
                             SizedBox(width: 18,),
                             Text("${itemModel.discountPrice!}\$" , style: TextStyle(color: AppColors.primaryColor , fontWeight: FontWeight.bold , fontSize: 16 ),),
                          ],
                        ),
                        GetBuilder<FavoriteControllerImp>(builder: (controller){
                          return IconButton(
                              onPressed: () {
                                if(itemModel.favorite == 1){
                                  itemModel.favorite = 0 ;
                                  controller.removeFromFavorite(itemModel.itemsId.toString());
                                }else{
                                  itemModel.favorite = 1 ;
                                  controller.addInFavorite(itemModel.itemsId.toString());
                                }
                              },
                              icon: itemModel.favorite == 1 ?
                              Icon(Icons.favorite, color: Colors.deepOrangeAccent[700],)
                                  : Icon(Icons.favorite_border_outlined , color: AppColors.primaryColor,)
                          );
                        })
                      ],
                    )
                  ],
                ),
              ),
            ),
            if(itemModel.itemsDiscount != 0)
              Positioned(
                left: 5,
                  child: Image.asset("assets/images/sale.png" ,
                      height: 50,
                      width: 50
                  )
              )
          ],
        ),
      ),
    );
  }
}

