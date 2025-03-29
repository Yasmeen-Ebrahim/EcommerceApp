import 'package:ecommerceproject/core/class/statusrequest.dart';
import 'package:ecommerceproject/data/datasource/remote/remote.dart';
import 'package:get/get.dart';
import '../core/functions/handlefunction.dart';

class TestController extends GetxController {
  TestData control = Get.put(TestData());

  List data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await control.getData();
    print("=============================== Controller $response ") ;
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success) {
      if(response['status'] == "success"){
        data.addAll(response["fetchData"]);
      }else{  // response['status'] == "failure"
        statusRequest = StatusRequest.noDatafailure ;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}