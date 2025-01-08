import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/constants/app_colors.dart';
import 'package:movie_app/app/data/models/movie.dart';
import 'package:movie_app/app/data/movies_provider.dart';
import 'package:movie_app/app/routes/app_pages.dart';
import 'package:movie_app/app/utils/ui_helpers.dart';
import 'package:movie_app/app/widgets/my_container.dart';
import 'package:movie_app/app/widgets/my_text.dart';

class SearchMovieCard extends StatelessWidget {
  const SearchMovieCard({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final genres = Get.find<MoviesProvider>().getGenresByIds(movie.genreIds);
    return MyContainer(
      onTap: () => Get.toNamed(Routes.MOVIE_DETAILS, arguments: movie),
      child: Row(
        children: [
          MyContainer(
            height: 90.h,
            width: 130.w,
            radius: 12.r,
            color: AppColors.lightGreyColor,
            backgroundImage: DecorationImage(
                fit: BoxFit.cover,
                scale: 0.5,
                image: CachedNetworkImageProvider(movie.backgroundImage)),
          ),
          spacing16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  movie.title,
                  size: 14,
                  fontWeight: FontWeight.w500,
                  maxLines: 2,
                  autoSized: true,
                ),
                spacing4,
                MyText(
                  genres.map((genre) => genre.name).join(', ').toString(),
                  color: AppColors.greyColor,
                  autoSized: true,
                  maxLines: 2,
                  size: 11,
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: AppColors.skyBlueColor,
              ))
        ],
      ),
    );
  }
}
