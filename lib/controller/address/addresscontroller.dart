import 'package:ecommerceproject/core/class/statusrequest.dart';
import 'package:ecommerceproject/core/constant/routes.dart';
import 'package:ecommerceproject/core/services/services.dart';
import 'package:ecommerceproject/data/datasource/remote/address/add.dart';
import 'package:ecommerceproject/data/datasource/remote/address/delete.dart';
import 'package:ecommerceproject/data/datasource/remote/address/edit.dart';
import 'package:ecommerceproject/data/datasource/remote/address/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/functions/handlefunction.dart';

abstract class AddressController extends GetxController{
  addAddress();
  viewAddress();
  deleteAddress(String addressId);
  goToEditAddress(String name , String city , String street , String addressId);
}
class AddressControllerImp extends AddressController{

  StatusRequest? statusRequest ;
  MyServices myServices = Get.find();
  List addressList = [];
  GlobalKey <FormState> formState = GlobalKey();

  late TextEditingController nameControl ;
  late TextEditingController cityControl ;
  late TextEditingController streetControl ;
  late TextEditingController latControl ;
  late TextEditingController longControl ;

  AddAddress addController = AddAddress();
  ViewAddress viewController = ViewAddress();
  EditAddress editController = EditAddress();
  DeleteAddress deleteController = DeleteAddress();



  @override
  void onInit() {
    viewAddress();
    nameControl = TextEditingController();
    cityControl = TextEditingController();
    streetControl = TextEditingController();
    latControl = TextEditingController();
    longControl = TextEditingController();
    super.onInit();
  }

  @override
  addAddress() async {
    if(formState.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await addController.getAddAddressData(
          nameControl.text,
          cityControl.text,
          streetControl.text,
          latControl.text,
          longControl.text,
          myServices.sharedPreferences.getString("id")!
      );
      print("=============================== Controller $response ") ;
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success) {
        if(response['status'] == "success"){
          Get.offNamed(AppRoutes.addressPage);
        }else{
          statusRequest = StatusRequest.noDatafailure ;
        }
      }
      update();
    }
    else{
      print("not valid");
    }
  }


  @override
  deleteAddress(String addressId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await deleteController.getDeleteAddressData(
        addressId
    );
    print("=============================== Controller $response ") ;
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success) {
      if(response['status'] == "success"){
        addressList.clear();
        viewAddress();
      }else{
        statusRequest = StatusRequest.noDatafailure ;
      }
    }
    update();
  }


  @override
  viewAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewController.getViewAddressData(
        myServices.sharedPreferences.getString("id")!
    );
    print("=============================== Controller $response ") ;
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success) {
      if(response['status'] == "success"){
        addressList.addAll(response['data']);
      }else{
        statusRequest = StatusRequest.noDatafailure ;
      }
    }
    update();
  }


  @override
  goToEditAddress(String name , String city , String street , String addressId) {
    Get.offNamed(AppRoutes.editAddressPage , arguments: {
      "name" : name,
      "city" : city,
      "street" : street,
      "addressid" : addressId
    });
  }


}