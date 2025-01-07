import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/app/constants/app_colors.dart';
import 'package:movie_app/app/constants/app_icons.dart';
import 'package:movie_app/app/extensions/double.dart';
import 'package:movie_app/app/utils/ui_helpers.dart';
import 'package:movie_app/app/widgets/my_container.dart';
import 'package:movie_app/app/widgets/my_text.dart';

class HallDetailCard extends StatelessWidget {
  const HallDetailCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: kPadding12.right,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              MyText.description('12:30'),
              spacing12,
              MyText.description(
                'Cinetech + hall 1',
                color: AppColors.greyColor,
              ),
            ],
          ),
          spacing12,
          MyContainer(
            padding: kPadding20.all,
            height: 0.16.sh,
            width: 0.6.sw,
            border: BorderSide(color: AppColors.skyBlueColor),
            child: SvgPicture.asset(AppIcons.dashboardIcon),
          ),
          spacing12,
          Row(
            children: [
              MyText.description('From', color: AppColors.greyColor),
              spacing4,
              MyText.description(
                '\$50',
                fontWeight: FontWeight.bold,
              ),
              spacing4,
              MyText.description('or', color: AppColors.greyColor),
              spacing4,
              MyText.description(
                '\$2500 bonus',
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          spacing12,
        ],
      ),
    );
  }
}
