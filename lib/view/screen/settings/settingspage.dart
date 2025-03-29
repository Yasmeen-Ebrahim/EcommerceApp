import 'package:ecommerceproject/core/constant/colors.dart';
import 'package:ecommerceproject/core/constant/routes.dart';
import 'package:ecommerceproject/view/widget/settings/customcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../controller/settingscontroller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsControllerImp controller = Get.put(SettingsControllerImp());
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: 220,
                color: AppColors.primaryColor,
              ),
              Positioned(
                top: Get.width / 2,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.white,
                  backgroundImage: AssetImage("assets/images/profile.png"),
                ),
              )
            ],
          ),
          const SizedBox(height: 90,),

          CustomCard(
              title: "Disable Notifications",
              trailing: Switch(value: true, onChanged: (val){} , activeColor: Colors.indigo[500])),
          CustomCard(
              title: "Address",
              trailing: IconButton(
                  onPressed: (){
                      Get.toNamed(AppRoutes.addressPage);
                    }, icon: Icon(Icons.location_on_outlined ,
                color: Colors.indigo[500],)
              )),
          CustomCard(
              title: "My Orders",
              trailing: IconButton(
                  onPressed: (){
                      Get.toNamed(AppRoutes.myOrders);
                    }, icon: Icon(Icons.shop_outlined ,
                color: Colors.indigo[500],)
              )),
          CustomCard(
              title: "Archived Orders",
              trailing: IconButton(
                  onPressed: (){
                      Get.toNamed(AppRoutes.archivedOrders);
                    }, icon: Icon(Icons.archive_outlined , color: Colors.indigo[500],)
              )),
          CustomCard(
              title: "About Us",
              trailing: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.help_outline, color: Colors.indigo[500],)
              )),
          CustomCard(
              title: "Contact Us",
              trailing: IconButton(
                  onPressed: (){
                    launchUrl(Uri.parse("tel:+010998288683"));
                  },
                  icon: Icon(Icons.phone_callback_outlined , color: Colors.indigo[500],)
              )),
          CustomCard(
              title: "Logout",
              trailing: IconButton(
                  onPressed: (){
                      controller.logOut();
                    }, icon: Icon(Icons.exit_to_app_outlined ,
                color: Colors.indigo[500],)
              )),
      ])
    );
  }
}
