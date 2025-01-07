import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/constants/app_colors.dart';
import 'package:movie_app/app/constants/app_icons.dart';
import 'package:movie_app/app/extensions/double.dart';
import 'package:movie_app/app/modules/movie_search/widgets/genre_card.dart';
import 'package:movie_app/app/modules/movie_search/widgets/search_movie_card.dart';
import 'package:movie_app/app/utils/ui_helpers.dart';
import 'package:movie_app/app/widgets/custom_text_field.dart';
import 'package:movie_app/app/widgets/my_text.dart';

import '../controllers/movie_search_controller.dart';

class MovieSearchView extends GetView<MovieSearchController> {
  const MovieSearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 60.h,
        title: CustomTextField(
          controller: controller.searchController,
          prefixIcon: AppIcons.searchIcon,
          hinText: 'TV shows, movies and more',
          bgColor: AppColors.lightGreyColor.withOpacity(0.3),
          onChanged: controller.onSearchKeyChange,
          verticalPadding: kPadding12,
          suffixWidget: InkWell(
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
            onTap: controller.clearOrCloseSearching,
            child: Icon(
              Icons.close,
              size: 25.sp,
              color: AppColors.greyColor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: kPadding16.all,
        child: Obx(() {
          if (!controller.isTyping.value) {
            return GridView.count(
                padding: EdgeInsets.zero,
                crossAxisCount: 2,
                crossAxisSpacing: kPadding12,
                mainAxisSpacing: kPadding12,
                childAspectRatio: 1.6,
                children: controller.genres
                    .map((genre) => GenreCard(genre: genre))
                    .toList());
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (controller.searchQuery.isNotEmpty) ...[
                  MyText.title(
                    'Top results',
                  ),
                  Divider(
                    color: AppColors.lightGreyColor,
                    height: 30.h,
                  ),
                ],
                Expanded(
                  child: ListView.separated(
                    itemCount: controller.searchedMovies.length,
                    separatorBuilder: (context, index) => spacing12,
                    itemBuilder: (context, index) => SearchMovieCard(
                        movie: controller.searchedMovies[index]),
                  ),
                )
              ],
            );
          }
          // if (controller.isTyping.value && controller.searchQuery.isNotEmpty) {
          //   return ListView.separated(
          //     itemCount: 10,
          //     separatorBuilder: (context, index) => spacing12,
          //     itemBuilder: (context, index) => SearchMovieCard(),
          //   );
          // }
        }),
      ),
    );
  }
}
