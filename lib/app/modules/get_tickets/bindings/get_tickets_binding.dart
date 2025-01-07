import 'package:get/get.dart';

import '../controllers/get_tickets_controller.dart';

class GetTicketsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetTicketsController>(
      () => GetTicketsController(),
    );
  }
}
