import 'package:dio/dio.dart';
import 'package:news_app/cores/exceptions/server_exception.dart';
import 'package:news_app/features/news/data/model/news_model.dart';
import 'package:news_app/features/news/data/source/news_remote_source.dart';

class NewsRemoteSourceImpl implements NewsRemoteSource {
  // we will need instance of Dio:
  // get from the constructor

  final Dio dio;

  NewsRemoteSourceImpl({required this.dio});

  // we will call the api endpoint from here
  // we use dio library for that
  // fetching the data is asynchronus task, so use async await and future

  @override
  Future<List<NewsModel>> getAllNews() async {
    // handle error using try catch
    try {
      // get the response:
      // you will have the url, just use the url
      final res = await dio.get(
          'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=9578257b2a5f48fdb7cdafff054b3c32');

      // check for the status code for the response:
      if (res.statusCode != 200) {
        throw ServerException(message: 'Error fetching the data');
      } else {
        final data = res.data;
        // from the json response, get all the data in articles array
        final articles = data['articles'] as List<dynamic>;
        // convert into model class and return the list
        return articles.map((article) => NewsModel.fromJson(article)).toList();
      }
    } catch (e) {
      // if any error occur, throw a server exception which we defined
      throw ServerException(message: e.toString());
    }
  }
}
