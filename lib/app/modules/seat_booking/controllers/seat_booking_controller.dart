import 'dart:math';

import 'package:book_my_seat/book_my_seat.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/data/models/seat.dart';

class SeatBookingController extends GetxController {
  List<MovieSeat> selectedSeats = [];

  void onSeatStateChanged(rowNumber, colNumber, seatState) {
    print('rowI: $rowNumber, colI: $colNumber, seatState: $seatState');
    final seat = MovieSeat(rowNumber: rowNumber, columnNumber: colNumber);
    if (seatState == SeatState.selected) {
      selectedSeats.add(seat);
    } else {
      selectedSeats.remove(seat);
    }
    update();
  }

  /// Generates the seating arrangement with custom rules.
  List<List<SeatState>> get generateSeatArrangement {
    return List.generate(10, (row) {
      return List.generate(26, (col) {
        // Custom rules for empty seats
        if (_isEmptySeat(row, col)) return SeatState.empty;

        // Randomize states other than empty
        return _getRandomSeatState();
      });
    });
  }

  /// Determines if a seat should be empty based on its row and column.
  bool _isEmptySeat(int row, int col) {
    // Aisles or gaps in the seating arrangement
    if (col == 5 || col == 20) return true;

    // Empty seats at the edges of certain rows
    if (row < 4 && (col == 0 || col == 25)) return true;

    // Empty seats at the front row (e.g., corners)
    if (row == 0 && (col < 3 || col > 22)) return true;

    return false;
  }

  /// Randomly selects a seat state from a predefined list.
  SeatState _getRandomSeatState() {
    const seatStates = [
      SeatState.disabled,
      SeatState.sold,
      SeatState.unselected,
    ];
    return seatStates[Random().nextInt(seatStates.length)];
  }
}
