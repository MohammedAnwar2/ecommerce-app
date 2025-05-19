import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/home_page_controller.dart';
import 'package:ecommerce/core/constant/app_link.dart';
import 'package:ecommerce/view/components/infinite_scroll_page_view.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomAdsPageView extends StatelessWidget {
  const CustomAdsPageView({
    super.key,
    required this.homePageController,
  });

  final HomePageControllerImp homePageController;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 11,
      child: InfiniteScrollPageView(
        items: homePageController.adsList,
        itemBuilder: (context, item) {
          return CachedNetworkImage(
            imageUrl:
                "${AppLink.imageAds}/${item.adsImage}",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            placeholder: (context, url) => Skeletonizer(
              enabled: true,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            errorWidget: (context, url, error) =>
                const Icon(Icons.error),
          );
        },
      ),
    );
  }
}