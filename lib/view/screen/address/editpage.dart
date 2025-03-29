import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../controller/address/addresscontroller.dart';
import '../../../controller/address/editcontroller.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/colors.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/customFormField.dart';

class EditAddressPage extends StatelessWidget {
  const EditAddressPage({super.key});

  @override
  Widget build(BuildContext context) {

    EditAddressControllerImp controller = Get.put(EditAddressControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit address"),
      ),
      body: GetBuilder<EditAddressControllerImp>(builder: (controller){
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
              Customformfield(
                hinttext: "city",
                labletext: "city",
                icon: Icons.location_city_outlined,
                mycontroller: controller.cityControl,
                keyboardtype: TextInputType.text,
                obscureText: false,
                valid: (val) {
                  return validInput(val!, 50, 2, "name");
                  },
              ),
              SizedBox(height: 17,),
              Customformfield(
                hinttext: "street",
                labletext: "street",
                icon: Icons.location_city_outlined,
                mycontroller: controller.streetControl
                , keyboardtype: TextInputType.text,
                obscureText: false,
                valid: (val) {
                  return validInput(val!, 50, 2, "name");
                  },
              ),
              SizedBox(height: 40,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 35),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child:  MaterialButton(
                  textColor: AppColors.white,
                  child: Text("Edit"),
                  onPressed: (){
                    controller.editAddress(controller.addressId.toString());
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
