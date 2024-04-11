import 'package:ecommerce/controller/home_page_controller.dart';
import 'package:ecommerce/core/class/animation.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardCashBackHome extends GetView<HomePageControllerImp> {
  const CustomCardCashBackHome({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: verticalSized(140),
      child: IntrinsicWidth(
        child: IntrinsicHeight(
          child: Stack(
            children: [
              CustomAnimationLeftToRight(
                child: Container(
                  height: verticalSized(140),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding:
                          EdgeInsetsDirectional.only(bottom: verticalSized(20)),
                      child: Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 20, color: AppColor.white),
                      ),
                    ),
                    subtitle: Text(
                      subTitle,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 30, color: AppColor.white),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: controller.lang == 'en' ? -20 : null,
                left: controller.lang == 'ar' ? -20 : null,
                top: -20,
                child: CustomAnimationLeftToRight(
                  time: 900,
                  child: Container(
                    height: verticalSized(150),
                    width: horizontalSize(150),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColor.secondaryColor,
                      borderRadius: BorderRadius.circular(160),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
