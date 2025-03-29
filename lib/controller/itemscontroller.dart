import 'package:ecommerceproject/core/constant/routes.dart';
import 'package:ecommerceproject/core/services/services.dart';
import 'package:ecommerceproject/data/datasource/remote/home/items.dart';
import 'package:ecommerceproject/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/class/statusrequest.dart';
import '../core/functions/handlefunction.dart';
import '../data/datasource/remote/search/search.dart';

abstract class ItemsController extends GetxController{
  initalValues();
  itemPressed(int index , String itemId);
  getItems(String categoryid , String userid) ;
  goToFavoriteList();

  checkSearch(value);
  searchPressed();
  viewSearchData();
  goToItemDetails(ItemModel itemdetails);
}

class ItemsControllerImp extends ItemsController{


  int price = 0;
  int discount = 0 ;
  int discountPrice = 0  ;


  List categories = [] ;
  int? selectedCat ;
  String ? catId ;
  List itemsData = [];
  late StatusRequest statusRequest;

  ItemsData control = Get.put(ItemsData());
  MyServices myServices = Get.find();


  @override
  void onInit() {
    searchFieldController = TextEditingController();
    initalValues();
    getItems(catId! ,  myServices.sharedPreferences.getString("id")!);
    super.onInit();
  }

  @override
  initalValues() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'] ;
    catId = Get.arguments['categoryId'] ;
  }

  @override
  itemPressed(index ,itemId) {
    selectedCat = index ;
    getItems(itemId , myServices.sharedPreferences.getString("id")!);
    update();
  }

  @override
  getItems(categoryid , userid) async{
    itemsData.clear();
    statusRequest = StatusRequest.loading;
    var response = await control.postItemsData(categoryid , userid);
    print("=============================== Controller $response ") ;
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success) {
      if(response['status'] == "success"){
        itemsData.addAll(response["itemsdata"]);

      }else{
        statusRequest = StatusRequest.noDatafailure ;
      }
    }
    update();
  }


  @override
  goToFavoriteList() {
    Get.toNamed("${AppRoutes.favoritescreen}");
  }


  //searching//////////////////////////////////////

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