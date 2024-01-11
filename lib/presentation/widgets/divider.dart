import'package:flutter/material.dart';
import 'package:tech_news/core/colors.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child:const Divider(
        color: AppColors.grey,
        thickness: 0.5,
      ),
    );
  }
}
