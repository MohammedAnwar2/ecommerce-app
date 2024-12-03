import 'package:ecommerce/controller/orders/rating_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_imageassets.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/data/model/orders_model.dart';
import 'package:ecommerce/view/widget/orders/archive/custom_rating_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingDialog {
  final BuildContext context;
  final RatingConrollerImp ratingController;
  final OrdersModel ordersModel;
  RatingDialog(
      {required this.ordersModel,
      required this.context,
      required this.ratingController});

  Future<void> show() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColor.white,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.logoAuth),
            Text(
              "Rating This Product",
              style: TextStyle(
                  fontSize: fontSize(20),
                  color: AppColor.secondaryColor,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              textAlign: TextAlign.center,
              "Tap a star to set your ratings. Add more description here if you want",
              style: TextStyle(
                  fontSize: fontSize(13),
                  color: AppColor.grey500,
                  fontWeight: FontWeight.bold),
            ),
            verticalSizedBox(10),
            CustomRating(),
            TextFormField(
              controller: ratingController.notes,
              maxLines: 2,
              minLines: 1,
              decoration: InputDecoration(
                  hintText: "Write your notes",
                  hintStyle: TextStyle(
                      fontSize: fontSize(13),
                      color: AppColor.grey500,
                      fontWeight: FontWeight.bold)),
            ),
            verticalSizedBox(10),
            TextButton(
              onPressed: () {
                print("==========notes=============> ");
                print(ratingController.notes.text);
                print("==========rating=============> ");
                print(ratingController.ratingValue);
                //ratingController.refreshArchivePage();
                ratingController.ratingProduct(ordersModel.ordersId!);
                Get.back();
              },
              child: Text(
                "Submit",
                style: TextStyle(
                    fontSize: fontSize(18),
                    color: AppColor.secondaryColor,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
