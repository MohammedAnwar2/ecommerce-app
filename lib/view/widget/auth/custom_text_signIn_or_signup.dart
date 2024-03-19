import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextSignInOrSignUp extends StatelessWidget {
  const CustomTextSignInOrSignUp({
    super.key,
    required this.textOne,
    required this.textTwo,
    required this.onPressed,
  });
  final String textOne;
  final String textTwo;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textOne,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              textTwo,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColor.primaryColor),
            ))
      ],
    );
  }
}
