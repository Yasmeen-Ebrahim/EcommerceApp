import 'package:ecommerceproject/controller/mainscreenController.dart';
import 'package:ecommerceproject/core/constant/colors.dart';
import 'package:ecommerceproject/core/constant/routes.dart';
import 'package:ecommerceproject/view/widget/customnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/appexitalert.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainScreenControllerImp());
    return GetBuilder<MainScreenControllerImp>(builder: (controller){
      return WillPopScope(
        onWillPop: alertAppExit,
        child: Scaffold(
            floatingActionButton: Container(child: IconButton(icon: Icon(Icons.shopping_bag_outlined ,color: AppColors.white, size: 30,), onPressed: (){Get.toNamed(AppRoutes.cartPage);},),decoration: BoxDecoration(color: AppColors.primaryColor , borderRadius: BorderRadius.circular(70)), padding: EdgeInsets.all(11),),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

            bottomNavigationBar: BottomAppBar(
              height: 60,
              color: AppColors.background,
              shape: CircularNotchedRectangle(),
              notchMargin: 10,
              child: Row(
                  children: [
                    ...List.generate(controller.listPages.length, ((i){
                      return  i == 1 ?
                      Expanded(
                        child: Row(
                          children: [
                            CustomNavigationBar(
                              icondata: controller.icons[i],
                              index: i ,
                              onpressed: (){
                                controller.changePages(i);
                              },
                            ),

                            Spacer()
                          ],
                        ),
                      ) : i == 3 ? CustomNavigationBar(
                        icondata: controller.icons[i],
                        index: i ,
                        onpressed: (){
                          controller.changePages(i);
                        },
                      ) : Row(
                        children: [
                          CustomNavigationBar(
                            icondata: controller.icons[i],
                            index: i ,
                            onpressed: (){
                              controller.changePages(i);
                            },
                          ),
                          SizedBox(width: 25,)
                        ],
                      );
                    })


                      // CustomNavigationBar(icondata: Icons.home, index: 0 , onpressed: (){controller.changePages(0);},),
                      // SizedBox(width: 25,),
                      // CustomNavigationBar(icondata: Icons.settings, index: 1 , onpressed: (){controller.changePages(1);},),
                      // Spacer(),
                      // CustomNavigationBar(icondata: Icons.person, index: 2 , onpressed: (){controller.changePages(2);},),
                      // SizedBox(width: 25,),
                      // CustomNavigationBar(icondata: Icons.favorite, index: 3 , onpressed: (){controller.changePages(3);},),
                    )]
              ),
            ),

            body: controller.listPages.elementAt(controller.currentIndex)

        ),
      );
    });
  }
}
