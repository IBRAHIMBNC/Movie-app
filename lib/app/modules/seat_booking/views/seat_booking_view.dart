import 'package:book_my_seat/book_my_seat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/constants/app_colors.dart';
import 'package:movie_app/app/constants/app_icons.dart';
import 'package:movie_app/app/extensions/double.dart';
import 'package:movie_app/app/routes/app_pages.dart';
import 'package:movie_app/app/utils/ui_helpers.dart';
import 'package:movie_app/app/widgets/my_container.dart';
import 'package:movie_app/app/widgets/my_text.dart';

import '../controllers/seat_booking_controller.dart';

class SeatBookingView extends GetView<SeatBookingController> {
  const SeatBookingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.h,
        title: Column(
          children: [
            MyText.title("The King’s Man"),
            spacing4,
            MyText.description("In theaters december 22, 2021",
                color: AppColors.skyBlueColor),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 16,
            ),
            Image.asset(
              AppIcons.screen,
              width: 0.9.sw,
            ),
            // MyText.title(
            //   "Screen",
            // ),
            const SizedBox(
              height: 32,
            ),
            Flexible(
              child: SizedBox(
                width: double.infinity,
                height: 400.h,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: GetBuilder<SeatBookingController>(
                    builder: (controller) => SeatLayoutWidget(
                      onSeatStateChanged: controller.onSeatStateChanged,
                      stateModel: SeatLayoutStateModel(
                        rows: 10,
                        cols: 26,
                        seatSvgSize: 20,
                        pathSelectedSeat: AppIcons.seatSelected,
                        pathDisabledSeat: AppIcons.seatDisabled,
                        pathSoldSeat: AppIcons.seatVip,
                        pathUnSelectedSeat: AppIcons.seatRegular,
                        currentSeatsState: controller.generateSeatArrangement,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyContainer(
        color: AppColors.whiteColor,
        height: 0.3.sh,
        padding: kPadding20.all,
        child: Column(
          children: [
            Padding(
              padding: kPadding80.right,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _iconGuide(
                    icon: AppIcons.seatSelected,
                    text: "Selected",
                  ),
                  _iconGuide(
                    icon: AppIcons.seatDisabled,
                    text: "Not Available",
                  ),
                ],
              ),
            ),
            spacing12,
            Padding(
              padding: kPadding80.right,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _iconGuide(
                    icon: AppIcons.seatVip,
                    text: "VIP(\$150)",
                  ),
                  _iconGuide(
                    icon: AppIcons.seatRegular,
                    text: "Regular(\$50)",
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: MyContainer(
                    radius: 12.r,
                    padding: EdgeInsets.symmetric(
                        horizontal: kPadding12.w, vertical: kPadding8.h),
                    alignment: Alignment.centerLeft,
                    color: AppColors.lightGreyColor.withOpacity(0.5),
                    onTap: () => Get.toNamed(Routes.GET_TICKETS),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MyText.description('Total Price', fontSize: 10),
                        spacing4,
                        MyText.title('\$50.00', fontSize: 14),
                      ],
                    ),
                  ),
                ),
                spacing12,
                SizedBox(
                  width: 0.56.sw,
                  child: ElevatedButton(
                      onPressed: () => Get.toNamed(Routes.SEAT_BOOKING),
                      child: Text('Proceed To Pay')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _iconGuide({required String icon, required String text}) {
    return Row(
      children: [
        SvgPicture.asset(icon),
        10.horizontalSpace,
        MyText.description(
          text,
          color: AppColors.greyColor,
        ),
      ],
    );
  }
}
