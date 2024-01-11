part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class FetchNewsEvent extends NewsEvent{}

class FetchNewsSuccessEvent extends NewsEvent{}

class OpenModalSheetEvent extends NewsEvent{}

class FetchNewsErrorEvent extends NewsEvent{}

