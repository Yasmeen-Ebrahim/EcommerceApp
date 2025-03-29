import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceproject/controller/itemscontroller.dart';
import 'package:ecommerceproject/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/offers/offerscontroller.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/colors.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OffersControllerImp>(builder: (controller){
      return Container(
        margin: EdgeInsets.only(top: 15),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.searchList.length,
          itemBuilder: (context , i){
            return controller.statusRequest == StatusRequest.loading ?
            Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),) :
            controller.statusRequest == StatusRequest.noDatafailure ?
            Center(child: Column(children: [SizedBox(height: 200,),Text("No results found !")],),):
            SearchItem(itemModel: ItemModel.fromJson(controller.searchList[i]));
          },
        ),
      );
    });
  }
}

class SearchItem extends GetView<OffersControllerImp>{
  final ItemModel itemModel ;
  const SearchItem({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13),
      child: InkWell(
        onTap: (){},
        child: Card(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                    flex : 2,
                    child: CachedNetworkImage(
                        imageUrl: '${itemModel.itemsImage}')
                ),
                Expanded(
                  flex : 3,
                  child: ListTile(
                    title: Text(
                      "${itemModel.itemsName}" ,
                      style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "${itemModel.categoriesName}" ,
                      style: TextStyle(fontSize: 13 , color: AppColors.bodytext),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
