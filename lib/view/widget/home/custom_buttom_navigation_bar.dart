import 'package:ecommerce/controller/home_screen_controller.dart';
import 'package:ecommerce/view/widget/home/custom_bottom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtomNavigationBar extends GetView<HomeScreenControllerImp> {
  const CustomButtomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 65,
      padding: EdgeInsets.zero,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(
            controller.listPages.length + 1,
            (i) => i == 2
                ? const Spacer()
                : CustomBottomAppBar(
                    index: i > 2 ? i - 1 : i,
                    text: controller.navigationBarNames[i > 2 ? i - 1 : i][0],
                    icon: controller.navigationBarNames[i > 2 ? i - 1 : i][1],
                  ),
          )
        ],
      ),
    );
  }
}












// class CustomButtomNavigationBar extends GetView<HomeScreenControllerImp> {
//   const CustomButtomNavigationBar({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       height: 65,
//       padding: EdgeInsets.zero,
//       shape: const CircularNotchedRectangle(),
//       notchMargin: 10,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           ...List.generate(
//             controller.laitPages.length + 1,
//             (i) => i == 2
//                 ? const Spacer()
//                 : CustomBottomAppBar(
//                     index: i > 2 ? i - 1 : i,
//                     text: controller.navigationBarNames[i > 2 ? i - 1 : i][0],
//                     icon: controller.navigationBarNames[i > 2 ? i - 1 : i][1],
//                   ),
//           )

          // Row(
          //   children: [
          // CustomBottomAppBar(
          //   index: 0,
          //   text: "Home",
          //   icon: Icons.home,
          // ),
          //     CustomBottomAppBar(
          //       index: 1,
          //       text: "Settings",
          //       icon: Icons.settings,
          //     ),
          //   ],
          // ),
          // Row(
          //   children: [
          //     CustomBottomAppBar(
          //       index: 2,
          //       text: "Profile",
          //       icon: Icons.person,
          //     ),
          //     CustomBottomAppBar(
          //       index: 3,
          //       text: "Favorite",
          //       icon: Icons.favorite,
          //     ),
          //   ],
          // )
//         ],
//       ),
//     );
//   }
// }
