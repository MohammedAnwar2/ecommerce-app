import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/laptop.png"),
            Text(
              "Laptop Surface Go",
              style: TextStyle(
                fontSize: fontSize(16),
                fontWeight: FontWeight.bold,
                color: AppColor.grey800,
              ),
            ),
            Text(
              "description how are you Mohammed description how are you Mohammed",
              style: TextStyle(
                fontSize: fontSize(13),
                color: AppColor.grey800,
                // height: 1.5,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "200\$",
                  style: TextStyle(
                      fontSize: fontSize(16),
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor,
                      fontFamily: ""),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                    color: AppColor.primaryColor,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
