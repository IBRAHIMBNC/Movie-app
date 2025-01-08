import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/constants/app_colors.dart';
import 'package:movie_app/app/constants/app_icons.dart';
import 'package:movie_app/app/constants/app_text_styles.dart';
import 'package:movie_app/app/extensions/double.dart';
import 'package:movie_app/app/utils/ui_helpers.dart';
import 'package:movie_app/app/widgets/my_container.dart';

import '../controllers/navigation_controller.dart';

class NavigationView extends GetView<NavigationController> {
  const NavigationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,
        body: SafeArea(top: false, child: controller.currentPage),
        bottomNavigationBar: MyContainer(
          padding: kPadding12.top,
          radius: BorderRadius.vertical(top: Radius.circular(25.r)),
          color: AppColors.primaryColor,
          child: BottomNavigationBar(
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              currentIndex: controller.currentIndex.value,
              selectedItemColor: AppColors.whiteColor,
              selectedLabelStyle: AppTextStyles.title
                  .copyWith(fontSize: 11, fontWeight: FontWeight.w600),
              unselectedLabelStyle:
                  AppTextStyles.descrtiption.copyWith(fontSize: 11),
              unselectedItemColor: AppColors.greyColor,
              onTap: (value) => controller.currentIndex.value = value,
              items: [
                _buildBottomNaviItem(
                    iconPath: AppIcons.dashboard, label: 'Dashboard'),
                _buildBottomNaviItem(iconPath: AppIcons.watch, label: 'Watch'),
                _buildBottomNaviItem(
                    iconPath: AppIcons.library, label: 'Media Library'),
                _buildBottomNaviItem(iconPath: AppIcons.more, label: 'More'),
              ]),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNaviItem(
      {required String iconPath, required String label}) {
    return BottomNavigationBarItem(
        icon: _buildIcon(iconPath: iconPath),
        activeIcon: _buildIcon(iconPath: iconPath, isActive: true),
        label: label);
  }

  Widget _buildIcon({required String iconPath, bool isActive = false}) {
    return Padding(
      padding: kPadding8.bottom,
      child: SvgPicture.asset(
        iconPath,
        color: isActive ? AppColors.whiteColor : AppColors.greyColor,
        height: 20.sp,
      ),
    );
  }
}
