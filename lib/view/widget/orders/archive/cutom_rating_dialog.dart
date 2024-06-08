import 'package:ecommerce/controller/orders/rating_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RatingConrollerImp>(
      builder: (controller) {
        return RatingStars(
          axis: Axis.horizontal,
          value: controller.ratingValue,
          onValueChanged: (v) {
            controller.changeStarsRating(v);
          },
          starCount: 5,
          starSize: 30.r,
          maxValue: 5,
          starSpacing: 15,
          maxValueVisibility: false,
          valueLabelVisibility: false,
          animationDuration: const Duration(milliseconds: 1000),
          valueLabelPadding:
              const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
          valueLabelMargin: const EdgeInsets.only(right: 8),
          starOffColor: AppColor.grey400!,
          starColor: AppColor.yellow600!,
          angle: 0,
        );
      },
    );
  }
}
