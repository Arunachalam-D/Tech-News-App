import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tech_news/core/colors.dart';

class CachedImage extends StatelessWidget {

  final String imageUrl;
  const CachedImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context,imageProvider)=>Container(
          width: 60,
            height: 70,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10)
            ),
        ),
      placeholder: (context,url)=>const CircularProgressIndicator(color: AppColors.primary,),
      );
  }
}
