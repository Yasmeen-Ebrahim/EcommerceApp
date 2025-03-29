import 'package:ecommerceproject/controller/address/addresscontroller.dart';
import 'package:ecommerceproject/core/class/statusrequest.dart';
import 'package:ecommerceproject/core/constant/routes.dart';
import 'package:ecommerceproject/data/model/addressmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/colors.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    AddressControllerImp controller = Get.put(AddressControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("Address Page"),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          color: AppColors.primaryColor,
        ),
        child: IconButton(
          color: AppColors.white,
          icon: Icon(Icons.add) ,
          onPressed: (){
            Get.toNamed(AppRoutes.addressMap);
          },
        ),
      ),
      body: GetBuilder<AddressControllerImp>(builder: (controller){
        return controller.statusRequest == StatusRequest.loading ?
        Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),) :
        controller.statusRequest == StatusRequest.noDatafailure ? Center(child: Text("no addresses added yet" , style: TextStyle(fontSize: 15),)) :
        ListView.builder(
          itemCount: controller.addressList.length,
          itemBuilder: (context , i){
            return AddressData(addressModel: AddressModel.fromJson(controller.addressList[i]));
          },
        );
      },)
    );
  }
}

class AddressData extends GetView<AddressControllerImp> {
  final AddressModel addressModel ;
  const AddressData({super.key, required this.addressModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: (){
        controller.goToEditAddress(addressModel.addressName!,addressModel.addressCity! ,addressModel.addressStreet!  ,addressModel.addressId.toString());
      },
      child: Container(
          margin: EdgeInsets.only(top: 5),
          child:  Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Card(
              child: ListTile(
                title: Text("${addressModel.addressName}" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18),),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 7,),
                    Text("${addressModel.addressCity} , ${addressModel.addressStreet}" , style: TextStyle(color: AppColors.bodytext , fontSize: 13),),
                    Row(
                      children: [
                        Text("phone number:" , style: TextStyle(color: Colors.grey[600] , fontSize: 13)),
                        SizedBox(width: 5,),
                        Text("${controller.myServices.sharedPreferences.getString("phone")}" , style: TextStyle(color: AppColors.bodytext , fontSize: 13)),
                      ],
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete_outline , color: AppColors.primaryColor,),
                  onPressed: (){
                    Get.defaultDialog(
                        title: "warning" ,
                        titleStyle: TextStyle(fontWeight: FontWeight.bold),
                        content: Center(child: Text("are you want to delete this address ?")),
                        actions: [
                          MaterialButton(
                            color: AppColors.primaryColor,
                            textColor: AppColors.white,
                            onPressed: (){
                              controller.deleteAddress(addressModel.addressId.toString());
                              Get.back();
                            } ,
                            child: Text("ok"),
                          ),
                          MaterialButton(
                            color: AppColors.primaryColor,
                            textColor: AppColors.white,
                            onPressed: (){
                              Get.back();
                            } ,
                            child: Text("cancel"),
                          ),
                        ]
                    );
                  },
                ),
              ),
            ),
          )
      ),
    );
  }
}

