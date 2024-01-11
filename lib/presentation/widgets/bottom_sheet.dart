import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

import '../../core/colors.dart';
import 'news_text.dart';

void bottomSheet(
 BuildContext context,
 String title,
 String description,
 String imageUrl,
 String url,) {

     showModalBottomSheet(
         backgroundColor: AppColors.black,
         shape: const RoundedRectangleBorder(
           borderRadius: BorderRadius.only(
             topLeft: Radius.circular(10),
             topRight: Radius.circular(10),
           )
         ),
         elevation: 50,
         context: context,
         builder: (context){
         return BottomSheetLayout(
            url:url,
           imageUrl:imageUrl,
           title:title,
           description:description,
         );
});

}

class BottomSheetLayout extends StatelessWidget {

  final String url;
  final String imageUrl;
  final String title;
  final String description;
  const BottomSheetLayout({super.key, required  this.url, required this.imageUrl, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        )
      ),
      padding: const EdgeInsets.all(5),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
            BottomSheetImage(imageUrl: imageUrl,title: title,),
          Container(
            padding: const EdgeInsets.all(10),
            child: NewsText(text:description,color: AppColors.white,),

          ),
          GestureDetector(
            onTap: (){
             _launchUrl(url);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Text("Read more",style: TextStyle(color: AppColors.primary),),
            ),
          )
        ],
      ),
    );
  }

   _launchUrl(String url) async{
     launcher.launchUrl(Uri.parse(url));
    }
  }


class BottomSheetImage extends StatelessWidget {

  final String imageUrl;
  final String title;
  const BottomSheetImage({super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children: [
          Container(
            foregroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter
              )
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    imageUrl,
                ),
                fit: BoxFit.cover
              )
            ),
          ),
          Positioned(
              bottom: 10,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: 300,
                child: NewsText(text:title, color: AppColors.white,),
    )
          )
        ],
      ),
    );
  }
}


