import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/fetch_api.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<FetchNewsEvent>(fetchNewsEvent);
  }

  FutureOr<void> fetchNewsEvent(FetchNewsEvent event, Emitter<NewsState> emit) async{
    emit(NewsOnLoadState());
    try{
      List<dynamic> newsList = await fetchNews();
     emit(FetchNewsSuccessState(newsList));
   }
   catch(error){
     print(error);
     emit(FetchNewsErrorState());
   }
  }
}
