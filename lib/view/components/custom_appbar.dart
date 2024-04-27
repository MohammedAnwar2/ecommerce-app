import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.hintText,
    this.onPressedFavorite,
    this.onPressedSearch,
    this.onChanged,
    this.myController,
    this.isThereFavorite = true,
  });
  final String hintText;
  final void Function()? onPressedFavorite;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController? myController;
  final bool? isThereFavorite;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: myController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintText: hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: fontSize(18)),
              filled: true,
              fillColor: AppColor.grey200,
              prefixIcon: IconButton(
                onPressed: onPressedSearch,
                icon: const Icon(
                  Icons.search,
                ),
              ),
            ),
            onChanged: onChanged,
          ),
        ),
        horizontalSizedBox(10),
        isThereFavorite!
            ? Container(
                width: horizontalSize(60),
                padding:
                    EdgeInsetsDirectional.symmetric(vertical: verticalSized(8)),
                decoration: BoxDecoration(
                    color: AppColor.grey200,
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                  onPressed: onPressedFavorite,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    color: AppColor.grey600,
                    size: 30,
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
