import'package:flutter/material.dart';

import 'package:tech_news/core/colors.dart';
import 'package:tech_news/data/fetch_api.dart';
import 'package:tech_news/presentation/widgets/news_tile.dart';
import '../../bloc/news_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/image_url.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    return BlocBuilder<NewsBloc,NewsState>(
        builder: (context,state){
          if(state is FetchNewsSuccessState) {
            return
              Scaffold(
                appBar: AppBar(
                  title:  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Tech",),
                      Text("Z",style: TextStyle(color: AppColors.primary,fontSize: 42),),
                      Text("Today")
                    ],
                  ),
                ),
                body: Column(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: width,
                          child: FutureBuilder<List>(
                            future: fetchNews(),
                            builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
                              if(snapshot.hasData){
                                return ListView.builder(
                                  itemCount: snapshot.data!.length,
                                itemBuilder: ( context,index){
                                     return NewsBox(
                                       url: snapshot.data![index]['url'],
                                       imageUrl:snapshot.data![index]['urlToImage'] != null ? snapshot.data![index]['urlToImage'] : ImageUrl.imageUrl,
                                       title: snapshot.data![index]['title'],
                                       time: snapshot.data![index]['publishedAt'],
                                       description: snapshot.data![index]['description'].toString(),
                                      );
                                },);
                              }
                              else{
                                return const Center(child: CircularProgressIndicator());
                              }
                            },

                          ),
                        ),

                      )
                    ],
                ),
              );

          }
          else{
            return const Center(child: CircularProgressIndicator());
          }
    }
    );
  }
}
