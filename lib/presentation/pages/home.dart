import'package:flutter/material.dart';
import '../../bloc/news_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc,NewsState>(
        builder: (context,state){
          if(state is FetchNewsSuccessState) {
            return
              const Center(
              child: Text("API data"),
            );
          }
          else{
            return const Center(child: CircularProgressIndicator());
          }
    }
    );
  }
}
