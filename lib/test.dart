import 'package:ecommerceproject/core/functions/checkinternet.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'core/constant/colors.dart';
import 'core/constant/imagelinks.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {

  checkfun() async{
    var checkresponse = await checkInternet();
    print(checkresponse);
  }

  @override
  void initState() {
    checkfun();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test page"),
      ),
      body: Column(
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

                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
