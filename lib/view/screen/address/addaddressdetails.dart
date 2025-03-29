import 'package:ecommerceproject/core/class/statusrequest.dart';
import 'package:ecommerceproject/core/functions/validinput.dart';
import 'package:ecommerceproject/view/widget/auth/customFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/address/addresscontroller.dart';
import '../../../core/constant/colors.dart';

class AddAddressDetails extends StatelessWidget {
  const AddAddressDetails({super.key});

  @override
  Widget build(BuildContext context) {

     Get.put(AddressControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("Add details address"),
      ),
      body: GetBuilder<AddressControllerImp>(builder: (controller){
        return controller.statusRequest == StatusRequest.loading ?
            Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),):
        Form(
          key: controller.formState,
          child: ListView(
            children: [
              SizedBox(height: 30,),
              Customformfield(
                hinttext: "name",
                labletext: "name",
                icon: Icons.location_on_outlined,
                mycontroller: controller.nameControl,
                keyboardtype: TextInputType.text,
                obscureText: false,
                valid: (val) { return validInput(val!, 50, 2, "name"); },
              ),
              SizedBox(height: 17,),
              Customformfield(hinttext: "city", labletext: "city", icon: Icons.location_city_outlined, mycontroller: controller.cityControl, keyboardtype: TextInputType.text, obscureText: false, valid: (val) { return validInput(val!, 50, 2, "name"); },),
              SizedBox(height: 17,),
              Customformfield(hinttext: "street", labletext: "street", icon: Icons.location_city_outlined, mycontroller: controller.streetControl, keyboardtype: TextInputType.text, obscureText: false, valid: (val) { return validInput(val!, 50, 2, "name"); },),
              SizedBox(height: 17,),
              Customformfield(hinttext: "lat", labletext: "lat", icon: Icons.draw_outlined, mycontroller: controller.latControl, keyboardtype: TextInputType.text, obscureText: false, valid: (val) { return validInput(val!, 50, 2, "name"); },),
              SizedBox(height: 17,),
              Customformfield(hinttext: "long", labletext: "long", icon: Icons.draw_outlined, mycontroller: controller.longControl, keyboardtype: TextInputType.text, obscureText: false, valid: (val) { return validInput(val!, 50, 2, "name"); },),
              SizedBox(height: 40,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 35),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child:  MaterialButton(
                  textColor: AppColors.white,
                  child: Text("Add"),
                  onPressed: (){
                    controller.addAddress();
                  },
                ),
              )
            ],
          ),
        );
      },),
    );
  }
}
