import 'package:news_app/features/news/data/model/news_model.dart';

abstract interface class NewsRemoteSource {
  Future<List<NewsModel>> getAllNews();
}
