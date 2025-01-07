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
            SvgPicture.asset(AppIcons.screenIcon),
            Text(
              "SCREEN",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.grey, fontSize: 8.sp),
            ),
            const SizedBox(
              height: 32,
            ),
            Flexible(
              child: SizedBox(
                width: double.infinity,
                height: 500,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: GetBuilder<SeatBookingController>(
                    builder: (controller) => SeatLayoutWidget(
                      onSeatStateChanged: controller.onSeatStateChanged,
                      stateModel: SeatLayoutStateModel(
                        rows: 10,
                        cols: 26,
                        seatSvgSize: 20,
                        pathSelectedSeat: AppIcons.seatSelectedIcon,
                        pathDisabledSeat: AppIcons.seatDisabledIcon,
                        pathSoldSeat: AppIcons.seatVipIcon,
                        pathUnSelectedSeat: AppIcons.seatRegularIcon,
                        currentSeatsState: controller.seatArrangement,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: kPadding20.w,
                right: 100.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _iconGuide(
                        icon: AppIcons.seatSelectedIcon,
                        text: "Selected",
                      ),
                      _iconGuide(
                        icon: AppIcons.seatDisabledIcon,
                        text: "Not Available",
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _iconGuide(
                        icon: AppIcons.seatVipIcon,
                        text: "VIP(\$150)",
                      ),
                      _iconGuide(
                        icon: AppIcons.seatRegularIcon,
                        text: "Regular(\$50)",
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  // Container(
                  //   padding: const EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //       color: AppColors.lightGreyColor.withOpacity(0.6),
                  //       borderRadius: BorderRadius.circular(5)),
                  //   child: Text(
                  //       "Selected Seats: ${viewModel.selectedSeats.length}"),
                  // ),
                  20.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 0.11.sh,
        padding: kPadding20.all,
        child: Row(
          children: [
            Expanded(
              child: MyContainer(
                radius: 12.r,
                padding: kPadding16.hp,
                alignment: Alignment.centerLeft,
                color: AppColors.whiteColor,
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
