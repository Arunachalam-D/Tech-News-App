import 'package:flutter/material.dart';
import 'package:tech_news/core/colors.dart';
import 'bottom_sheet.dart';
import 'cached_image.dart';
import 'divider.dart';
import 'news_text.dart';

class NewsBox extends StatelessWidget {
  final String imageUrl, title, time, description, url;

  const NewsBox({super.key,
    required this.imageUrl,
    required this.title,
    required this.time,
    required this.description,
    required this.url});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
            onTap: () {
              bottomSheet(context, title, description, imageUrl, url);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CachedImage(imageUrl: imageUrl,),
                  const SizedBox(width: 12,),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          NewsText(color: AppColors.white, text: title,),
                          const SizedBox(height: 7,),
                          NewsText(color: AppColors.grey, text: time,),
                        ],
                      )),

                ],
              ),
            )),
        const DividerWidget(),


      ],
    );
  }
}
