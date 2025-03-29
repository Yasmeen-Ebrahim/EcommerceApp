import 'package:ecommerceproject/core/class/handlingdataview.dart';
import 'package:ecommerceproject/controller/remotedatacontroller.dart';
import 'package:ecommerceproject/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          titleTextStyle: TextStyle(color: AppColors.white, fontSize: 20 , fontWeight: FontWeight.bold),
          title: Text("Remote data")
      ),
      body: GetBuilder<TestController>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                    return Text("${controller.data}");
            }));
        }
      ),
    );
  }
}

