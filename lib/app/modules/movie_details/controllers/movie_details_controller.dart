import 'package:get/get.dart';
import 'package:movie_app/app/data/models/genre.dart';
import 'package:movie_app/app/data/models/movie.dart';
import 'package:movie_app/app/data/movies_provider.dart';
import 'package:movie_app/app/routes/app_pages.dart';

class MovieDetailsController extends GetxController {
  final movie = Get.arguments as Movie;
  final _repositoryProvider = Get.find<MoviesProvider>();
  final RxBool isTrailerLoading = false.obs;
  final RxBool isImagesLoading = false.obs;
  final List<String> images = [];

  String? videoId;

  List<Genre> get genres =>
      _repositoryProvider.getGenresByIds(movie.genreIds).toList();

  fetchTrailer() {
    isTrailerLoading.value = true;
    _repositoryProvider.fetchMovieTrailer(movie.id).then((value) {
      videoId = value;
      isTrailerLoading.value = false;
    });
  }

  fetchImages() {
    isImagesLoading.value = true;
    _repositoryProvider.getMovieImages(movie.id).then(
      (value) {
        isImagesLoading.value = false;
        images.addAll(value ?? []);
      },
    );
  }

  watchTrailer() {
    if (isTrailerLoading.value || videoId == null) return;
    Get.toNamed(Routes.WATCH_TRAILER, arguments: videoId);
  }

  @override
  void onInit() {
    fetchTrailer();
    fetchImages();
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
