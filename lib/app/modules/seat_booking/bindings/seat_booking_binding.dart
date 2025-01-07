import 'package:get/get.dart';

import '../controllers/seat_booking_controller.dart';

class SeatBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeatBookingController>(
      () => SeatBookingController(),
    );
  }
}
