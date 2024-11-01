import 'package:flutter/material.dart';

class CustomTitleForScreens extends StatelessWidget {
  final String title;
  const CustomTitleForScreens({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(fontWeight: FontWeight.w600));
  }
}
