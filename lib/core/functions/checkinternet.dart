import 'dart:io';

Future checkInternet() async{
  try{
    var result = await InternetAddress.lookup("google.com");
    if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
      return "online" ;
    }
  }on SocketException catch(_){
    return "offline" ;
  }
}