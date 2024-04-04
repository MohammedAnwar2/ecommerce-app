import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_link.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardCategories extends StatelessWidget {
  const CardCategories({super.key, required this.image, required this.title});
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: verticalSized(60),
          width: verticalSized(60),
          padding: EdgeInsetsDirectional.all(verticalSized(10)),
          margin: EdgeInsetsDirectional.only(top: verticalSized(10)),
          decoration: BoxDecoration(
              color: AppColor.thirdColor,
              borderRadius: BorderRadius.circular(16)),
          child: SvgPicture.network(
            "${AppLink.imageCategories}/$image",
            colorFilter: const ColorFilter.mode(
                AppColor.secondaryColor, BlendMode.srcIn),
          ),
        ),
        Text(title,
            style: TextStyle(color: AppColor.black, fontSize: fontSize(13)))
      ],
    );
  }
}
