import 'package:intl/intl.dart';

extension FormattedDateTime on DateTime {
  String get formattedDate {
    return DateFormat('MMM dd, yyyy').format(this);
  }

  String get formattedDateTime {
    return DateFormat('hh:mm a, MMM dd, yyyy').format(this);
  }
}
