import 'package:ecommerceproject/core/class/statusrequest.dart';
import 'package:ecommerceproject/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../constant/imagelinks.dart';


class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest ;
  final Widget widget ;
  const HandlingDataView({super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return
      statusRequest == StatusRequest.loading ?
          Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),):
      statusRequest == StatusRequest.offlinefailure ?
          Center(child : Lottie.asset(AppLottieLinks.offline , width: 100 , height: 100)):
      statusRequest == StatusRequest.serverfailure ?
          Center(child: Text("Server Failure")):
      statusRequest == StatusRequest.noDatafailure ?
          Center(child: Text("No Data"))
          : widget ;
  }
}




class HandlingDataPost extends StatelessWidget {
  final StatusRequest statusRequest ;
  final Widget widget ;
  final String route ;
  const HandlingDataPost({super.key, required this.statusRequest, required this.widget, required this.route,});

  @override
  Widget build(BuildContext context) {
    return
      statusRequest == StatusRequest.loading ?
      Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),):
      statusRequest == StatusRequest.offlinefailure ? Column(
        children: [
          SizedBox(height: 200,),
          Center(child : Lottie.asset(AppLottieLinks.offline , width: 100 , height: 100)),
          SizedBox(height: 250,),
          Center(
            child: Container(
              child: MaterialButton(
                textColor: AppColors.white,
                color: AppColors.primaryColor,
                child: Text("try again"),
                onPressed: (){
                  Get.offAllNamed(route);
                },
              ),
            ),
          )
        ],
      ):
      statusRequest == StatusRequest.serverfailure ? Column(
        children: [
          SizedBox(height: 200,),
          Center(child: Icon(Icons.cloud_off_outlined ,size: 60, color: AppColors.primaryColor,)),
          SizedBox(height: 250,),
          Center(
            child: Container(
              child: MaterialButton(
                textColor: AppColors.white,
                color: AppColors.primaryColor,
                child: Text("try again"),
                onPressed: () {
                  Get.offAllNamed(route);
                },
              ),
            ),
          )
        ],
      ) : widget ;
  }
}

