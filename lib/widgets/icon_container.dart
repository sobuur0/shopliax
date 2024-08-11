import 'package:flutter/material.dart';
import 'package:shopliax_assesement/themes.dart/colors.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      margin: const EdgeInsets.only(left: 35, bottom: 8, top: 8),
      decoration: BoxDecoration(
        color: ShopliaxColors.disabledColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(
        Icons.chevron_left,
        color: ShopliaxColors.disabledDarkColor,
      ),
    );
  }
}
