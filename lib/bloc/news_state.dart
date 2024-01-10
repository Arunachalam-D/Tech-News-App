part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsOnLoadState extends NewsState{}

class FetchNewsSuccessState extends NewsState{
  FetchNewsSuccessState(List newsList);
}

class FetchNewsErrorState extends NewsState{}