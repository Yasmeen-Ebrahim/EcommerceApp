import 'package:ecommerceproject/core/constant/routes.dart';
import 'package:ecommerceproject/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/class/statusrequest.dart';
import '../core/functions/handlefunction.dart';
import '../data/datasource/remote/home/home.dart';
import '../data/datasource/remote/search/search.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class HomeController extends GetxController{
  categoriesData();
  goToItemsPage(List categories , int selectedCat , String idCategory);
  goToFavoriteList();
  checkSearch(value);
  searchPressed();
  viewSearchData();
  goToItemDetails(ItemModel itemdetails);
}

class HomeControllerImp extends HomeController{


  HomeData controller = Get.put(HomeData());
  StatusRequest? statusRequest ;
  List categoriesList = [];
  List itemsList = [];


  @override
  categoriesData() async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await controller.postHomeData();
    print("=============================== Controller $response ") ;
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success) {
      if(response["status"] == "success"){
        categoriesList.addAll(response["categories"]);
        itemsList.addAll(response["items"]);
      }else{
        print("failure");
      }
    }
    update();
  }


  @override
  goToItemsPage( categories,  selectedCat , idCategory) {
    Get.toNamed(AppRoutes.itemsPage , arguments: {
      "categories" : categories,
      "selectedCat": selectedCat,
      "categoryId" : idCategory
    });
  }

  @override
  void onInit() async {
    searchFieldController = TextEditingController();
    categoriesData();
    FirebaseMessaging.instance.subscribeToTopic("users");
    super.onInit();
  }

  @override
  goToFavoriteList() {
    Get.toNamed("${AppRoutes.favoritescreen}");
  }


  //searching///////////////////////////////////////////

  SearchData searchData = Get.put(SearchData());
  TextEditingController? searchFieldController;
  bool isSearch = false ;
  List searchList = [];


  @override
  checkSearch(value) {
    if(value == ""){
      isSearch = false ;
      statusRequest = StatusRequest.none ;
      update();
    }
  }

  @override
  searchPressed() {
    if(searchFieldController!.text == ""){
      isSearch = false ;
    }else{
      isSearch = true ;
      viewSearchData();
      update();
    }
  }

  @override
  viewSearchData() async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await searchData.postSearchData(searchFieldController!.text);
    print("=============================== Controller $response ") ;
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success) {
      if(response["status"] == "success"){
        searchList.clear();
        searchList.addAll(response['data']);
      }else{
        statusRequest = StatusRequest.noDatafailure;
      }
    }
    update();
  }

  @override
  goToItemDetails(ItemModel itemdetails) {
    Get.toNamed(AppRoutes.itemDetails , arguments: {
      "itemDetail" :  itemdetails
    });
  }


}