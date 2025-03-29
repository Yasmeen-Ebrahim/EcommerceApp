import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/favoritecontroller.dart';
import '../../widget/customfavoritebar.dart';
import '../../widget/favorite/favoritepage.dart';

class FavoriteScreen extends GetView<FavoriteControllerImp> {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteControllerImp());
    return Scaffold(
      body: ListView(
        children: [
          CustomFavoriteBar(searchtitle: "65".tr , searchpress: (){}, notificationpress: (){}),
          SizedBox(height: 10,),
          CustomFavoritePage()
        ],
      ),
    );
  }
}
