import 'package:ecommerceproject/binding.dart';
import 'package:ecommerceproject/core/localization/translation.dart';
import 'package:ecommerceproject/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'routes.dart';
import 'core/localization/changelocal.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      initialBinding: MyBinding(),
      translations: MyTranslation(),
      locale: controller.language,
      theme: controller.apptheme,
      debugShowCheckedModeBanner: false,
      getPages: routes,
    );
  }
}