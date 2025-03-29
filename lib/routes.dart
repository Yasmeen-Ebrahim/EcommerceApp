import 'package:ecommerceproject/view/screen/address/addaddressdetails.dart';
import 'package:ecommerceproject/view/screen/address/addaddressmap.dart';
import 'package:ecommerceproject/view/screen/address/addressPage.dart';
import 'package:ecommerceproject/view/screen/address/editpage.dart';
import 'package:ecommerceproject/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerceproject/view/screen/auth/login.dart';
import 'package:ecommerceproject/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerceproject/view/screen/auth/signup.dart';
import 'package:ecommerceproject/view/screen/auth/forgetpassword/successresetpassword.dart';
import 'package:ecommerceproject/view/screen/auth/successsignup.dart';
import 'package:ecommerceproject/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerceproject/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerceproject/view/screen/cart/cartpage.dart';
import 'package:ecommerceproject/view/screen/checkout/checkout.dart';
import 'package:ecommerceproject/view/screen/favorite/favoritescreen.dart';
import 'package:ecommerceproject/view/screen/items/itemdetails.dart';
import 'package:ecommerceproject/view/screen/items/itemspage.dart';
import 'package:ecommerceproject/view/screen/language.dart';
import 'package:ecommerceproject/view/screen/mainscreen.dart';
import 'package:ecommerceproject/view/screen/onboarding.dart';
import 'package:ecommerceproject/view/screen/orders/archivedorders.dart';
import 'package:ecommerceproject/view/screen/orders/orderdetails.dart';
import 'package:ecommerceproject/view/screen/orders/orders.dart';
import 'package:ecommerceproject/view/widget/orders/ratingorder.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'core/constant/routes.dart';
import 'core/middleware/mymiddleware.dart';




List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoutes.language, page: ()=> RateOrder()),
  // GetPage(name: AppRoutes.language, page: ()=> Language() ,
  //     middlewares: [
  //       MyMiddleWare()
  // ]),

  //auth
  GetPage(name: AppRoutes.login, page: ()=> Login()),
  GetPage(name: AppRoutes.signUp, page: ()=> SignUp()),
  GetPage(name: AppRoutes.onboarrding, page: ()=> OnBoardingScreen()),
  GetPage(name: AppRoutes.forgetPassword, page: ()=> ForgetPassword()),
  GetPage(name: AppRoutes.verifyCode, page: ()=>VerifyCode()),
  GetPage(name: AppRoutes.verifyCodeSignUp, page: ()=>VerifyCodeSignUp()),
  GetPage(name: AppRoutes.resetPassword, page: ()=>ResetPassword()),
  GetPage(name: AppRoutes.successResetPassword, page: ()=>SuccessResetPassword()),
  GetPage(name: AppRoutes.successSignUp, page: ()=>SuccessSignUp()),

  //home
  GetPage(name: AppRoutes.homePage, page: ()=> MainScreen()),
  //items
  GetPage(name: AppRoutes.itemsPage, page: ()=> ItemsPage()),
  GetPage(name: AppRoutes.itemDetails, page: ()=> ItemDetails()),
  //favorite
  GetPage(name: AppRoutes.favoritescreen, page: ()=> FavoriteScreen()),
  //cart
  GetPage(name: AppRoutes.cartPage, page: ()=> CartPage()),
  //address
  GetPage(name: AppRoutes.addressPage, page: ()=> AddressPage()),
  GetPage(name: AppRoutes.addressMap, page: ()=> AddAddressMap()),
  GetPage(name: AppRoutes.addressDetails, page: ()=> AddAddressDetails()),
  GetPage(name: AppRoutes.editAddressPage, page: ()=> EditAddressPage()),
  //checkout
  GetPage(name: AppRoutes.checkOut, page: ()=> CheckOut()),
  GetPage(name: AppRoutes.myOrders, page: ()=> MyOrders()),
  GetPage(name: AppRoutes.orderDetails, page: ()=> OrderDetails()),
  GetPage(name: AppRoutes.archivedOrders, page: ()=> ArchivedOrders()),
  GetPage(name: AppRoutes.rateorder, page: ()=> RateOrder())
];