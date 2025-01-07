import 'dart:math';

import 'package:book_my_seat/book_my_seat.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/data/models/seat.dart';

class SeatBookingController extends GetxController {
  List<MovieSeat> selectedSeats = [];

  void onSeatStateChanged(rowI, colI, seatState) {
    print('rowI: $rowI, colI: $colI, seatState: $seatState');
    if (seatState == SeatState.selected) {
      selectedSeats.add(MovieSeat(rowI: rowI, colI: colI));
    } else {
      selectedSeats.remove(MovieSeat(rowI: rowI, colI: colI));
    }
    update();
  }

  List<List<SeatState>> seatArrangement = List.generate(
    10,
    (row) => List.generate(26, (col) {
      if (col == 5 || col == 20) {
        return SeatState.empty;
      }
      if (row < 4 && (col == 0 || col == 25)) {
        return SeatState.empty;
      }
      if (row == 0 && (col < 3 || col > 22)) {
        return SeatState.empty;
      }
      List<SeatState> statesOtherThanEmpty = [
        SeatState.disabled,
        SeatState.sold,
        SeatState.unselected,
      ];
      return statesOtherThanEmpty[Random().nextInt(3)];
    }),
  );
}
