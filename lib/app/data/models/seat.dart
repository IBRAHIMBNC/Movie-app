import 'package:equatable/equatable.dart';

class MovieSeat extends Equatable {
  final int rowI;
  final int colI;

  const MovieSeat({required this.rowI, required this.colI});

  @override
  String toString() {
    return '[$rowI][$colI]';
  }

  @override
  List<Object?> get props => [rowI, colI];
}
