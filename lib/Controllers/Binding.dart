
import 'package:get/get.dart';

import 'NetworkManager.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GetXNetworkManager>(GetXNetworkManager(), permanent: true);
  }
}
