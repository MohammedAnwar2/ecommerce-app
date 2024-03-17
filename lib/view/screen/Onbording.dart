import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/onboarding/pageview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onbording extends StatelessWidget {
  const Onbording({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageViewBuilder(),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        4,
                        (index) => AnimatedContainer(
                              height: 6,
                              width: 6,
                              margin: EdgeInsetsDirectional.only(start: 5),
                              duration: Duration(milliseconds: 700),
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10)),
                            )),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Container(
                      margin: EdgeInsetsDirectional.only(bottom: size(30)),
                      padding:
                          EdgeInsetsDirectional.symmetric(horizontal: size(60)),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8)),
                      child: TextButton(
                        onPressed: () {},
                        child: Text("Continue"),
                      )),
                ],
              ))
        ],
      ),
    ));
  }
}


/*

 */
