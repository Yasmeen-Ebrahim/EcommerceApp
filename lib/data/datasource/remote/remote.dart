import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/class/crud.dart';

class TestData {

  Crud control = Get.put(Crud());

  getData() async {
    var response = await control.postData("http://192.168.1.11/ecommerce/index.php",{});
    return  response.fold((l) => l, (r) => r) ;
  }

}
