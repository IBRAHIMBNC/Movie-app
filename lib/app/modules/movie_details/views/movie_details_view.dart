import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/constants/app_colors.dart';
import 'package:movie_app/app/extensions/dateTime.dart';
import 'package:movie_app/app/extensions/double.dart';
import 'package:movie_app/app/routes/app_pages.dart';
import 'package:movie_app/app/utils/ui_helpers.dart';
import 'package:movie_app/app/widgets/my_container.dart';
import 'package:movie_app/app/widgets/my_text.dart';

import '../controllers/movie_details_controller.dart';

class MovieDetailsView extends GetView<MovieDetailsController> {
  const MovieDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        titleSpacing: 10,
        iconTheme: const IconThemeData(color: AppColors.whiteColor),
        title: SizedBox(
          width: 0.8.sw,
          child: MyText(controller.movie.title,
              color: AppColors.whiteColor,
              minSize: 12,
              size: 16,
              autoSized: true,
              maxLines: 2,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTop(),
            spacing24,
            _buildMethod(),
          ],
        ),
      ),
    );
  }

  Padding _buildMethod() {
    final controller = Get.find<MovieDetailsController>();
    return Padding(
        padding: kPadding20.hp,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.title('Genres'),
            spacing12,
            Wrap(
                spacing: kPadding4,
                runSpacing: kPadding8,
                children: List.generate(
                  controller.genres.length,
                  (index) => MyContainer(
                    radius: 50.r,
                    padding: EdgeInsets.symmetric(
                        horizontal: kPadding8.w, vertical: kPadding4.h),
                    color: controller.genres[index].color,
                    child: MyText.description(
                      controller.genres[index].name,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),
            Divider(color: AppColors.lightGreyColor, height: 30.h),
            MyText.title('Overview'),
            spacing12,
            MyText.description(
              controller.movie.overview,
              color: AppColors.greyColor,
            ),
            spacing12,
            MyText.title('Image Gallary'),
            spacing12,
            Obx(
              () => controller.isImagesLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: kPadding12,
                        mainAxisSpacing: kPadding12,
                      ),
                      itemCount: controller.images.length,
                      itemBuilder: (context, index) => ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: CachedNetworkImage(
                          imageUrl: controller.images[index],
                          width: 1.sw,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
            ),
          ],
        ));
  }

  MyContainer _buildTop() {
    final controller = Get.find<MovieDetailsController>();
    return MyContainer(
      radius: 0,
      width: double.infinity,
      height: 0.6.sh,
      backgroundImage: DecorationImage(
          image: CachedNetworkImageProvider(controller.movie.backgroundImage),
          fit: BoxFit.cover),
      child: MyContainer(
        radius: 0,
        gradient: blackGradient,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            spacing8,
            MyText.title(
                "In Theaters ${controller.movie.releaseDate.formattedDate}",
                color: AppColors.whiteColor),
            spacing12,
            ElevatedButton(
                onPressed: () => Get.toNamed(Routes.GET_TICKETS),
                child: Text(
                  'Get Tickets',
                )),
            spacing12,
            Obx(
              () => OutlinedButton(
                  onPressed: controller.watchTrailer,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.play_arrow,
                        color: AppColors.whiteColor,
                        size: 20.sp,
                      ),
                      spacing8,
                      Text(
                        controller.isTrailerLoading.value
                            ? 'Loading...'
                            : 'Watch Trailer',
                      ),
                    ],
                  )),
            ),
            spacing32,
          ],
        ),
      ),
    );
  }
}
