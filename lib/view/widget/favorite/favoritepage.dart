import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceproject/controller/favoritecontroller.dart';
import 'package:ecommerceproject/data/model/myfavoritemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/changelangfun.dart';

class CustomFavoritePage extends StatelessWidget {
  const CustomFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteControllerImp());

    return GetBuilder<FavoriteControllerImp>(builder: (controller){
      return controller.statusRequest == StatusRequest.loading ?
      Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),) :
      controller.statusRequest == StatusRequest.noDatafailure ? Center(child: Column(children: [SizedBox(height:100,) , Text(changeLanguage("لا يوجد منتجات" , "no data yet"))],)) :
      GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 , childAspectRatio: 0.7),
          itemCount: controller.myFavoriteList.length,
          itemBuilder: (context , i){
            return FavoriteList(myFavoriteModel: MyFavoriteModel.fromJson(controller.myFavoriteList[i]));
          }
      );
    });
  }
}

class FavoriteList extends GetView<FavoriteControllerImp> {
  final MyFavoriteModel myFavoriteModel ;
  const FavoriteList({super.key, required this.myFavoriteModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){},
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl : "${myFavoriteModel.itemsImage}",fit: BoxFit.fill,
                  height: 100,
                  width: 150,),
                SizedBox(height: 12,),
                Text(changeLanguage(myFavoriteModel.itemsNameAr , myFavoriteModel.itemsName) , style: TextStyle(fontWeight: FontWeight.bold , color: AppColors.grey , fontSize: changeLanguage(12.0, 16.0)), textAlign: TextAlign.center),
                SizedBox(height: 10,),
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
                SizedBox(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${myFavoriteModel.itemsPrice}\$" , style: TextStyle(color: AppColors.primaryColor , fontWeight: FontWeight.bold , fontSize: 16 ),),
                    IconButton(
                        onPressed: () {
                          Get.defaultDialog(
                              title: "DELETE",
                              titleStyle: TextStyle(fontWeight: FontWeight.bold , fontSize: 19,),
                              content: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "Are you sure you want to delete this item ?",
                                    style: TextStyle(color: Colors.grey[700] , fontWeight: FontWeight.normal),
                                  )),
                              actions: [
                            MaterialButton(
                            textColor: AppColors.white,
                            color: AppColors.primaryColor,
                            child: Text("ok"),
                            onPressed: (){
                              controller.removeFromFavoritePage(myFavoriteModel.itemsId.toString());
                            },
                          ),
                                MaterialButton(
                                  textColor: AppColors.white,
                                  color: AppColors.primaryColor,
                                  child: Text("cancel"),
                                  onPressed: (){
                                    Get.back();
                                  },
                                )
                              ]
                          );
                     },
                         icon: Icon(Icons.delete_outline , color: AppColors.primaryColor,)
                     )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

