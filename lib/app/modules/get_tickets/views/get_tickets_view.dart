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

import '../controllers/get_tickets_controller.dart';

class GetTicketsView extends GetView<GetTicketsController> {
  const GetTicketsView({super.key});
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
        body: Padding(
          padding: kPadding20.all,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              spacing40,
              spacing40,
              MyText.title('Date'),
              spacing8,
              _buildDates(),
              spacing20,
              SizedBox(
                height: 0.3.sh,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    HallDetailCard(isSelected: true),
                    HallDetailCard(),
                    HallDetailCard(),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: kPadding24.all,
          child: ElevatedButton(
              onPressed: () => Get.toNamed(Routes.SEAT_BOOKING),
              child: Text('Select Seats')),
        ));
  }

  SizedBox _buildDates() {
    return SizedBox(
      height: 50.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildChoiceChip(
            label: '1 mar',
            isSelected: true,
          ),
          ...List.generate(
            10,
            (index) => _buildChoiceChip(label: '${index + 2} mar'),
          )
        ],
      ),
    );
  }

  Container _buildChoiceChip({required String label, bool isSelected = false}) {
    return Container(
      margin: kPadding8.right,
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        color: WidgetStateColor.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? AppColors.skyBlueColor
              : AppColors.lightGreyColor,
        ),
        onSelected: (value) {},
      ),
    );
  }
}

class HallDetailCard extends StatelessWidget {
  const HallDetailCard({
    super.key,
    this.isSelected = false,
  });
  final bool isSelected;

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
            border: BorderSide(
                color: !isSelected
                    ? AppColors.lightGreyColor
                    : AppColors.skyBlueColor),
            child: SvgPicture.asset(AppIcons.hallSeatsIcon),
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
