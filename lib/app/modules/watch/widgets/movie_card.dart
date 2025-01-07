import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/constants/app_colors.dart';
import 'package:movie_app/app/data/models/movie.dart';
import 'package:movie_app/app/extensions/double.dart';
import 'package:movie_app/app/routes/app_pages.dart';
import 'package:movie_app/app/utils/ui_helpers.dart';
import 'package:movie_app/app/widgets/my_container.dart';
import 'package:movie_app/app/widgets/my_text.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
  });
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      onTap: () => Get.toNamed(Routes.MOVIE_DETAILS, arguments: movie),
      height: 200,
      backgroundImage: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(movie.backgroundImage)),
      child: MyContainer(
        padding: kPadding20.all,
        alignment: Alignment.bottomLeft,
        gradient: blackGradient,
        child: MyText.title(movie.title, color: AppColors.whiteColor),
      ),
    );
  }
}
