import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService{

 late SharedPreferences sharedPreferences ;

 Future <MyServices> init() async{
   await Firebase.initializeApp(
       options: const FirebaseOptions(
           apiKey: "AIzaSyBRKInbwO-PCTM2l3bk4WHyRZB3Tprh1kU",
           appId: "1:350028796710:android:13bd2eb083178a2185a7e7",
           messagingSenderId: "350028796710",
           projectId: "ecommerceproject-2c06f",
           storageBucket: "ecommerceproject-2c06f.appspot.com"
       )
   );
   sharedPreferences = await SharedPreferences.getInstance();
   return this ;
 }

}

initialServices() async{
  await Get.putAsync(()=> MyServices().init());
}