import 'dart:math';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/web.dart';
import 'package:movie_app/app/constants/api_endpoints.dart';
import 'package:movie_app/app/constants/app_colors.dart';
import 'package:movie_app/app/constants/app_strings.dart';
import 'package:movie_app/app/data/models/genre.dart';
import 'package:movie_app/app/data/models/movie.dart';
import 'package:movie_app/app/data/services/api_service.dart';

class MoviesProvider extends GetxController {
  final RxList<Genre> allGenres = RxList();
  final RxList<Movie> searchedMovies = RxList();
  RxBool isSearchLoading = false.obs;
  final _logger = Logger();
  final PagingController<int, Movie> moviesPagingController =
      PagingController<int, Movie>(firstPageKey: 1);

  @override
  void onInit() {
    super.onInit();
    fetchAllGenres();
    resetMoviesPagingController();
  }

  @override
  void dispose() {
    moviesPagingController.dispose();
    super.dispose();
  }

  Future<void> fetchAllGenres() async {
    final response = await ApiService.get(endPoint: ApiEndPoints.genreList);
    if (response != null) {
      response.data['genres'].forEach((genre) {
        allGenres.add(Genre.fromMap(genre));
      });
    } else {
      Get.snackbar(
        '',
        "Couldn't fetch genres",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.errorColor,
        colorText: AppColors.whiteColor,
      );
    }
  }

  void searchMovies(String query) {
    isSearchLoading.value = true;
    _fetchSearchedMoviesPage(1, query);
  }

  Future<void> _fetchSearchedMoviesPage(int page, String query) async {
    final response = await ApiService.get(
        endPoint: ApiEndPoints.search,
        params: {"page": page, "query": query, "language": "en-US"});
    if (response != null) {
      List<Movie> newMovies = [];
      response.data['results'].forEach((movie) {
        newMovies.add(Movie.fromMap(movie));
      });
      searchedMovies.value = newMovies;
    } else {
      _logger.f("Response is null");
      Get.snackbar(
        '',
        "Couldn't fetch searched movies",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.errorColor,
        colorText: AppColors.whiteColor,
      );
    }
    isSearchLoading.value = false;
  }

  Future<void> fetchUpcomingMoviesPage(int page) async {
    final response = await ApiService.get(
        endPoint: ApiEndPoints.upcomingMovies, params: {"page": page});
    if (response != null) {
      List<Movie> newMovies = [];
      int totalPages = response.data['total_pages'];
      response.data['results'].forEach((movie) {
        newMovies.add(Movie.fromMap(movie));
      });
      final isLastPage = page == totalPages;
      if (isLastPage) {
        moviesPagingController.appendLastPage(newMovies);
      } else {
        final nextPageKey = page + 1;
        moviesPagingController.appendPage(newMovies, nextPageKey);
      }
    } else {
      _logger.f("Response is null");
      moviesPagingController.error = "Couldn't fetch upcoming movies";
    }
  }

  Future<String?> fetchMovieTrailer(int movieId) async {
    final response = await ApiService.get(endPoint: "movie/$movieId/videos");
    if (response != null) {
      if (response.data['results'].isNotEmpty) {
        var trailerKey = response.data['results'][0]['key'];
        return trailerKey;
      } else {
        _logger.f("No trailer found");
        return null;
      }
    } else {
      _logger.f("Response is null");
      return null;
    }
  }

  Future<String?> fetchGenreImage(String genreId) async {
    try {
      var response =
          await ApiService.get(endPoint: ApiEndPoints.discover, params: {
        'with_genres': genreId,
        'sort_by': 'popularity.desc',
        'language': 'en',
        'page': 1
      });
      if (response != null) {
        var result = response.data['results'];
        var imagePath =
            result[Random().nextInt(result.length)]['backdrop_path'];
        return ksImageBaseUrl + imagePath;
      }
    } catch (e) {
      _logger.e(e);
    }
    return null;
  }

  Future<List<String>?> getMovieImages(int movieId) async {
    List<String> images = [];
    final response = await ApiService.get(endPoint: "movie/$movieId/images");
    if (response != null) {
      if (response.data['backdrops'].isNotEmpty) {
        response.data['backdrops'].forEach((backdrop) {
          images.add(ksImageBaseUrl + backdrop['file_path']);
        });
        return images;
      } else {
        return [];
      }
    } else {
      _logger.f("Response is null");
      return null;
    }
  }

  void resetMoviesPagingController() {
    moviesPagingController.addPageRequestListener((pageKey) {
      fetchUpcomingMoviesPage(pageKey);
    });
    moviesPagingController.refresh();
  }

  List<Genre> getGenresByIds(List<int> ids) {
    return allGenres.where((genre) => ids.contains(genre.id)).toList();
  }
}
