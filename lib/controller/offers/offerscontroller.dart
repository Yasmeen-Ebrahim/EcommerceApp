import 'package:ecommerceproject/core/services/services.dart';
import 'package:ecommerceproject/data/datasource/remote/offers/offers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlefunction.dart';
import '../../data/datasource/remote/search/search.dart';

abstract class OffersController extends GetxController{
  getOffersItems();
  checkSearch(value);
  searchPressed();
  viewSearchData();
}
class OffersControllerImp extends OffersController{

  List offersItemsList = [];
  late StatusRequest statusRequest;
  OffersData offersData = OffersData();
  MyServices myServices = Get.find();



  @override
  getOffersItems() async{
    statusRequest = StatusRequest.loading;
    var response = await offersData.postOffersData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ") ;
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success) {
      if(response['status'] == "success"){
        offersItemsList.addAll(response["discountItemsData"]);
      }else{
        statusRequest = StatusRequest.noDatafailure ;
      }
    }
    update();
  }

  @override
  void onInit() {
    getOffersItems();
    searchFieldController = TextEditingController();
    super.onInit();
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


}
