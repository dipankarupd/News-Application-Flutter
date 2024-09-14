part of 'news_bloc.dart';

sealed class NewsState {}

final class NewsInitial extends NewsState {}

// create a state to handle the error:
class NewsErrorState extends NewsState {
  // get the error message:
  final String errorMessage;

  NewsErrorState({required this.errorMessage});
}

// create a state for loading:
class NewsLoadingState extends NewsState {}

// create a state for successful retrival of data
class NewsSuccessState extends NewsState {
  // get the fetched news as well
  final List<News> news;

  NewsSuccessState({required this.news});
}
