import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: verticalSized(16)),
      padding: EdgeInsetsDirectional.symmetric(horizontal: horizontalSize(16)),
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
                  "A summer surprice",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 20, color: AppColor.white),
                ),
              ),
              subtitle: Text(
                "Cashback 20%",
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
