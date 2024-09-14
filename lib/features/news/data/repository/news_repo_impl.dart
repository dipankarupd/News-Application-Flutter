import 'package:fpdart/fpdart.dart';
import 'package:news_app/cores/exceptions/server_exception.dart';
import 'package:news_app/cores/failures/failure.dart';
import 'package:news_app/features/news/data/source/news_remote_source.dart';
import 'package:news_app/features/news/domain/entity/news.dart';
import 'package:news_app/features/news/domain/repository/news_repo.dart';

class NewsRepoImpl implements NewsRepo {
  // take the datasource instance from the constructor
  final NewsRemoteSource source;

  NewsRepoImpl({required this.source});

  // create the missing override:
  // we will call the getAllNews method of the remote source class
  // since the remote source function returns a future, we must use async await
  @override
  Future<Either<Failure, List<News>>> getAllNews() async {
    try {
      final res = await source.getAllNews();

      // if we do not get any error, we will get the result -> list of news in res
      // we return the list using right
      return right(res);
    } on ServerException catch (e) {
      // if any exception is caught, throw a failure state
      return left(Failure(message: e.message));
    }
  }
}
