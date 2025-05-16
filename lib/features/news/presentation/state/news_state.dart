import 'package:news_app/features/news/domain/entity/news.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsErrorState extends NewsState {
  final String errorMessage;
  NewsErrorState({required this.errorMessage});
}

class NewsSuccessState extends NewsState {
  final List<News> news;
  NewsSuccessState({required this.news});
}
