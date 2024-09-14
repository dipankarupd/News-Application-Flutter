import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cores/usecases/usecase.dart';
import 'package:news_app/features/news/domain/entity/news.dart';
import 'package:news_app/features/news/domain/usecase/fetch_news.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  // get the usecase from constructor:
  // I created it as private
  final FetchNews _fetchNews;
  NewsBloc(this._fetchNews) : super(NewsInitial()) {
    // explain what to do when NewsInitialEvent will be triggered:
    // have a callback there which takes 2 params event and emit
    // we call the method which we wrote on the usecase here and get the result
    // result will be either failure or list of fetched news
    // it will be an asynchronus operation. So we use async and await
    on<NewsInitialEvent>((event, emit) async {
      // before performing anything, let us have a loading state
      // until we get the result

      // emit a loading state:
      emit(NewsLoadingState());

      // get the res:
      // we do not need any parameter
      // I have created a class NoParams already
      // Just using that classes instance here
      final res = await _fetchNews.call(NoParams());

      // the result can have 2 values:
      // left -> Failure and right -> List<news> as we have coded that way
      // just check them using fold:

      res.fold(
        (failure) {
          // if we get a failure, we emit error state
          emit(NewsErrorState(errorMessage: failure.message));
        },
        (news) {
          // if we get the list of news, we emit the success state
          emit(NewsSuccessState(news: news));
        },
      );
    });
  }
}
