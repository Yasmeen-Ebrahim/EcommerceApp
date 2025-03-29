import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlefunction.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/order/archived.dart';

abstract class ArchivedOrdersController extends GetxController{
  getArchivedOrders();
}
class ArchivedOrdersControllerImp extends ArchivedOrdersController{


  StatusRequest? statusRequest;
  MyServices myServices = Get.find();
  List archivedOrders = [];
  ArchivedOrders archivedController = Get.put(ArchivedOrders());


  @override
  getArchivedOrders() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await archivedController.getArchivedOrders(
        myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        archivedOrders.addAll(response['archivedOrders']);
      } else {
        statusRequest == StatusRequest.noDatafailure ;
      }
    }
    update();
  }

  @override
  void onInit() {
    getArchivedOrders();
    super.onInit();
  }

}