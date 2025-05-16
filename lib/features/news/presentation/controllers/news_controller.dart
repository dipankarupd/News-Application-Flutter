import 'package:get/get.dart';
import 'package:news_app/cores/init_dependancies.dart';
import 'package:news_app/cores/usecases/usecase.dart';
import 'package:news_app/features/news/domain/usecase/fetch_news.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';

class NewsController extends GetxController {
  final fetchNews = serviceLocator<FetchNews>();
  final state = Rx<NewsState>(NewsInitial());

  @override
  void onInit() {
    super.onInit();
    fetchAllNews();
  }

  void fetchAllNews() async {
    state.value = NewsLoadingState();

    final res = await fetchNews(NoParams());
    res.fold(
      (failure) {
        state.value = NewsErrorState(errorMessage: failure.message);
      },
      (news) {
        state.value = NewsSuccessState(news: news);
      },
    );
  }
}
