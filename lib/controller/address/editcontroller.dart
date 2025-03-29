import 'package:ecommerceproject/core/class/statusrequest.dart';
import 'package:ecommerceproject/core/constant/routes.dart';
import 'package:ecommerceproject/core/services/services.dart';
import 'package:ecommerceproject/data/datasource/remote/address/edit.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/functions/handlefunction.dart';

abstract class EditAddressController extends GetxController{
  editAddress(String addressId);
}
class EditAddressControllerImp extends EditAddressController{

  StatusRequest? statusRequest ;
  MyServices myServices = Get.find();
  List addressList = [];
  GlobalKey <FormState> formState = GlobalKey();

  late TextEditingController nameControl ;
  late TextEditingController cityControl ;
  late TextEditingController streetControl ;

  EditAddress editController = EditAddress();

  String? addressId ;


  @override
  void onInit(){

    nameControl = TextEditingController();
    cityControl = TextEditingController();
    streetControl = TextEditingController();

    nameControl.text = Get.arguments['name'];
    cityControl.text = Get.arguments['city'];
    streetControl.text = Get.arguments['street'];
    addressId = Get.arguments['addressid'];

    super.onInit();
  }



  @override
  editAddress(String addressId) async {
    if(formState.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await editController.getEditAddressData(
          nameControl.text,
          cityControl.text,
          streetControl.text,
          addressId
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
      print("not valid") ;
    }
  }


}