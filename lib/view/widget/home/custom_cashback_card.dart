import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';

class CustomCardCashBackHome extends StatelessWidget {
  const CustomCardCashBackHome({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: verticalSized(16)),
      child: Stack(
        children: [
          Container(
            height: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Padding(
                padding: EdgeInsetsDirectional.only(bottom: verticalSized(20)),
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
          Positioned(
            right: -20,
            top: -20,
            child: Container(
              height: 160,
              width: 160,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColor.secondaryColor,
                borderRadius: BorderRadius.circular(160),
              ),
            ),
          )
        ],
      ),
    );
  }
}
