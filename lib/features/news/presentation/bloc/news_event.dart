part of 'news_bloc.dart';

sealed class NewsEvent {}

// create an initial event which will be triggered as soon as we enter the
// home page
class NewsInitialEvent extends NewsEvent {}
