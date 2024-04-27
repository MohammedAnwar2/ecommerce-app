import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/home_page_controller.dart';
import 'package:ecommerce/core/constant/app_link.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchListItems extends StatelessWidget {
  const SearchListItems({super.key, required this.searchitems});
  final List<ItemModel> searchitems;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: searchitems.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return SearchListItemsInfo(searchitems: searchitems[index]);
      },
    );
  }
}

class SearchListItemsInfo extends GetView<HomePageControllerImp> {
  const SearchListItemsInfo({super.key, required this.searchitems});
  final ItemModel searchitems;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProductDetails(searchitems);
      },
      child: Padding(
        padding: EdgeInsets.only(top: verticalSized(10)),
        child: Card(
          child: Container(
            padding: const EdgeInsetsDirectional.all(8),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: CachedNetworkImage(
                        height: verticalSized(90),
                        imageUrl:
                            "${AppLink.imageItem}/${searchitems.itemsImage}")),
                Expanded(
                  flex: 2,
                  child: ListTile(
                    title: Text(searchitems.itemsName!),
                    subtitle: Text(searchitems.categoriesName!),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
