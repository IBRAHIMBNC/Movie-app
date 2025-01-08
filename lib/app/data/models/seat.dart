import 'package:equatable/equatable.dart';

class MovieSeat extends Equatable {
  final int rowNumber;
  final int columnNumber;

  const MovieSeat({required this.rowNumber, required this.columnNumber});

  @override
  String toString() {
    return '[$rowNumber][$columnNumber]';
  }

  @override
  List<Object?> get props => [rowNumber, columnNumber];
}
