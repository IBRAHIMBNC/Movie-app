import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_app/app/data/models/movie.dart';
import 'package:movie_app/app/data/repository_provider.dart';

class WatchController extends GetxController {
  final _repositoryProvider = Get.find<RepositoryProvider>();

  bool _isSearching = false;

  bool get isSearching => _isSearching;

  set isSearching(bool value) {
    _isSearching = value;
    update();
  }

  PagingController<int, Movie> get moviesPagingController =>
      _repositoryProvider.moviesPagingController;

  Future<void> refreshMovies() async {
    _repositoryProvider.moviesPagingController.refresh();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
