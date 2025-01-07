import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/constants/app_colors.dart';
import 'package:movie_app/app/constants/app_icons.dart';
import 'package:movie_app/app/constants/app_textStyles.dart';
import 'package:movie_app/app/extensions/double.dart';
import 'package:movie_app/app/utils/ui_helpers.dart';
import 'package:movie_app/app/widgets/my_container.dart';

import '../controllers/navigation_controller.dart';

class NavigationView extends GetView<NavigationController> {
  const NavigationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Obx(() => SafeArea(top: false, child: controller.currentPage)),
      bottomNavigationBar: Obx(
        () => MyContainer(
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
                  .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
              unselectedLabelStyle: AppTextStyles.descrtiption,
              unselectedItemColor: AppColors.greyColor,
              onTap: (value) => controller.currentIndex.value = value,
              items: [
                _buildBottomNaviItem(
                    iconPath: AppIcons.dashboardIcon, label: 'Dashboard'),
                _buildBottomNaviItem(
                    iconPath: AppIcons.watchIcon, label: 'Watch'),
                _buildBottomNaviItem(
                    iconPath: AppIcons.libraryIcon, label: 'Media Library'),
                _buildBottomNaviItem(
                    iconPath: AppIcons.moreIcon, label: 'More'),
              ]),
        ),
      ),
    );
  }

  _buildBottomNaviItem({required String iconPath, required String label}) {
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
