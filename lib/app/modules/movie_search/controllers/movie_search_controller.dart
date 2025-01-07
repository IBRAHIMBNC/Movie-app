import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/data/models/genre.dart';
import 'package:movie_app/app/data/models/movie.dart';
import 'package:movie_app/app/data/repository_provider.dart';
import 'package:movie_app/app/modules/watch/controllers/watch_controller.dart';

class MovieSearchController extends GetxController {
  final _repositoryProvider = Get.find<RepositoryProvider>();
  final TextEditingController searchController = TextEditingController();
  RxList<Movie> get searchedMovies => _repositoryProvider.searchedMovies;

  bool get canClose => searchController.text.trim().isEmpty;

  List<Genre> get genres => _repositoryProvider.allGenres;

  RxBool isTyping = false.obs;
  RxString searchQuery = ''.obs;

  clearOrCloseSearching() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (canClose) {
      Get.find<WatchController>().isSearching = false;
    } else {
      searchController.clear();
    }
  }

  onSearchKeyChange(String? value) {
    searchQuery.value = value!.trim();
    if (value.isNotEmpty) {
      isTyping.value = true;
      _repositoryProvider.searchMovies(value);
    } else {
      isTyping.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
