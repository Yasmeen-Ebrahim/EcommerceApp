import 'package:ecommerceproject/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/localization/changelocal.dart';
import '../widget/language/customlanguagebutton.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {

    LocaleController controller = Get.put(LocaleController());
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr , style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: 27,),
            customLanguageButton(textbutton: '2'.tr, onPressed: (){
              controller.changLang("ar");
              Get.toNamed(AppRoutes.onboarrding);
            },),
            SizedBox(height: 3,),
            customLanguageButton(textbutton: '3'.tr, onPressed: (){
              controller.changLang("en");
              Get.toNamed(AppRoutes.onboarrding);
            },)
          ],
        ),
      ),
    );
  }
}
