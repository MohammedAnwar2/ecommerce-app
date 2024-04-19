import 'package:ecommerce/core/constant/app_imageassets.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemCardInfo extends StatelessWidget {
  const ItemCardInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // height: verticalSized(80),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                AppImages.onBoardingImageOne,
                height: verticalSized(100),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const Expanded(
            flex: 3,
            child: ListTile(
              title: Text(
                "MacBook MI df  ",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text("1100.0\$"),
            ),
          ),
          //const Spacer(),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: verticalSized(36),
                    child: IconButton(onPressed: () {}, icon: Icon(Icons.add))),
                const Text("2ss"),
                SizedBox(
                    height: verticalSized(38),
                    child: IconButton(
                        onPressed: () {}, icon: Icon(Icons.minimize))),
              ],
            ),
          ),
          Container(
            width: horizontalSize(10),
          )
        ],
      ),
    );
  }
}
