import 'package:get/get.dart';
import 'package:movie_app/app/data/movies_provider.dart';

import '../controllers/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(
      () => NavigationController(),
    );
    Get.lazyPut(() => MoviesProvider());
  }
}
