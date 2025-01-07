import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_app/app/constants/app_colors.dart';
import 'package:movie_app/app/data/models/movie.dart';
import 'package:movie_app/app/modules/movie_search/controllers/movie_search_controller.dart';
import 'package:movie_app/app/modules/movie_search/views/movie_search_view.dart';
import 'package:movie_app/app/modules/watch/widgets/movie_card.dart';
import 'package:movie_app/app/widgets/my_text.dart';

import '../controllers/watch_controller.dart';

class WatchView extends GetView<WatchController> {
  const WatchView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: WatchController(),
      builder: (controller) {
        if (controller.isSearching) {
          return GetBuilder(
            init: MovieSearchController(),
            builder: (controller) => MovieSearchView(),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: MyText.title(
              'Watch',
              fontSize: 18,
            ),
            centerTitle: false,
            actions: [
              IconButton(
                onPressed: () {
                  controller.isSearching = !controller.isSearching;
                  controller.update();
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          body: RefreshIndicator(
            onRefresh: controller.refreshMovies,
            child: PagedListView.separated(
              pagingController: controller.moviesPagingController,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              builderDelegate: PagedChildBuilderDelegate<Movie>(
                firstPageProgressIndicatorBuilder: (context) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                },
                itemBuilder: (context, movie, index) {
                  return MovieCard(movie: movie);
                },
                firstPageErrorIndicatorBuilder: (context) {
                  return Center(
                    child: Text(
                      "Something went wrong",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.blackColor,
                          ),
                    ),
                  );
                },
                noItemsFoundIndicatorBuilder: (context) => Center(
                  child: Text(
                    "No upcoming movies",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.blackColor,
                        ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => 10.verticalSpace,
            ),
          ),
        );
      },
    );
  }
}
