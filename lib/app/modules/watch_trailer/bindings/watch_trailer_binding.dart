import 'package:get/get.dart';

import '../controllers/watch_trailer_controller.dart';

class WatchTrailerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WatchTrailerController>(
      () => WatchTrailerController(),
    );
  }
}
