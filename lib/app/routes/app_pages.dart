import 'package:get/get.dart';

import '../modules/get_tickets/bindings/get_tickets_binding.dart';
import '../modules/get_tickets/views/get_tickets_view.dart';
import '../modules/movie_details/bindings/movie_details_binding.dart';
import '../modules/movie_details/views/movie_details_view.dart';
import '../modules/movie_search/bindings/movie_search_binding.dart';
import '../modules/movie_search/views/movie_search_view.dart';
import '../modules/navigation/bindings/navigation_binding.dart';
import '../modules/navigation/views/navigation_view.dart';
import '../modules/seat_booking/bindings/seat_booking_binding.dart';
import '../modules/seat_booking/views/seat_booking_view.dart';
import '../modules/watch/bindings/watch_binding.dart';
import '../modules/watch/views/watch_view.dart';
import '../modules/watch_trailer/bindings/watch_trailer_binding.dart';
import '../modules/watch_trailer/views/watch_trailer_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.NAVIGATION;

  static final routes = [
    GetPage(
      name: _Paths.NAVIGATION,
      page: () => const NavigationView(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: _Paths.WATCH,
      page: () => const WatchView(),
      binding: WatchBinding(),
    ),
    GetPage(
      name: _Paths.MOVIE_SEARCH,
      page: () => const MovieSearchView(),
      binding: MovieSearchBinding(),
    ),
    GetPage(
      name: _Paths.MOVIE_DETAILS,
      page: () => const MovieDetailsView(),
      binding: MovieDetailsBinding(),
    ),
    GetPage(
      name: _Paths.GET_TICKETS,
      page: () => const GetTicketsView(),
      binding: GetTicketsBinding(),
    ),
    GetPage(
      name: _Paths.SEAT_BOOKING,
      page: () => const SeatBookingView(),
      binding: SeatBookingBinding(),
    ),
    GetPage(
      name: _Paths.WATCH_TRAILER,
      page: () => const WatchTrailerView(),
      binding: WatchTrailerBinding(),
    ),
  ];
}
