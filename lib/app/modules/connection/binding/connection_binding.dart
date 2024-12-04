import 'package:get/get.dart';
import 'package:praktikum/app/modules/connection/controller/connection_view.dart';

class ConnectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ConnectionController>(ConnectionController(), permanent: true);
  } 
}
