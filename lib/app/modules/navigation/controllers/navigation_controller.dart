import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/modules/navigation/widgets/cooming_soon.dart';
import 'package:movie_app/app/modules/watch/views/watch_view.dart';

class NavigationController extends GetxController {
  RxInt currentIndex = 1.obs;

  Widget get currentPage {
    switch (currentIndex.value) {
      case 1:
        return WatchView();

      default:
        return CoomingSoon();
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
