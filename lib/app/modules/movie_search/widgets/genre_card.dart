import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/constants/app_colors.dart';
import 'package:movie_app/app/data/models/genre.dart';
import 'package:movie_app/app/extensions/double.dart';
import 'package:movie_app/app/utils/ui_helpers.dart';
import 'package:movie_app/app/widgets/my_container.dart';
import 'package:movie_app/app/widgets/my_text.dart';

class GenreCard extends StatelessWidget {
  const GenreCard({
    super.key,
    required this.genre,
  });

  final Genre genre;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MyContainer(
        height: 200,
        radius: 8.r,
        backgroundImage: genre.backGroundImage.value == null
            ? null
            : DecorationImage(
                fit: BoxFit.cover,
                scale: 0.2,
                image:
                    CachedNetworkImageProvider(genre.backGroundImage.value!)),
        child: MyContainer(
          radius: 8.r,
          padding: kPadding16.all,
          alignment: Alignment.bottomLeft,
          color: AppColors.blackColor.withOpacity(0.2),
          // gradient: LinearGradient(colors: [
          //   AppColors.blackColor.withOpacity(1),
          //   Colors.transparent,
          //   Colors.transparent,
          //   AppColors.blackColor.withOpacity(0.1)
          // ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          child: MyText.title(
            genre.name,
            color: AppColors.whiteColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
