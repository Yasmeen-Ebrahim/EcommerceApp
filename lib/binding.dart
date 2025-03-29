import 'package:ecommerceproject/controller/auth/forgetpassword/forgetpasswordcontroller.dart';
import 'package:ecommerceproject/controller/auth/forgetpassword/resetpasswordcontroller.dart';
import 'package:ecommerceproject/controller/auth/logincontroller.dart';
import 'package:get/get.dart';
import 'controller/auth/signupcontroller.dart';

class MyBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerImp() , fenix: true);
    Get.lazyPut(() => LoginControllerImp() , fenix: true);
    Get.lazyPut(() => ForgetPasswordControllerImp() , fenix: true);
    Get.lazyPut(() => ResetPasswordControllerImp() , fenix: true);
  }

}