import 'package:flutter/material.dart';

import '../theming/colors.dart';
class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key, required this.widget, required this.height});
  final Widget widget;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: decorationFromContainer(),
      child: widget,
    );
  }
  BoxDecoration decorationFromContainer() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: ColorsManager.lightGrey,
            blurStyle: BlurStyle.outer,
            offset: Offset(2, 2),
            spreadRadius: 0,
            blurRadius: 8,
          )
        ]);
  }
}
