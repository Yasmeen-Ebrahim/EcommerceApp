import 'package:get/get.dart';

validInput(String value , int max , int min , String type){


  if(value.isEmpty){
    return "55".tr ;
  }

  if(type == "username"){
    if(!GetUtils.isUsername(value)){
      return "56".tr ;
    }
  }

  if(type == "email"){
    if(!GetUtils.isEmail(value)){
      return "57".tr ;
    }
  }

  if(type == "phone"){
    if(!GetUtils.isPhoneNumber(value)){
      return "58".tr ;
    }
  }


  if(value.length > max){
    return "59".tr ;
  }

  if(value.length < min){
    return "60".tr ;
  }



}