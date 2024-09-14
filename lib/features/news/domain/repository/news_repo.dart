import 'package:fpdart/fpdart.dart';
import 'package:news_app/cores/failures/failure.dart';
import 'package:news_app/features/news/domain/entity/news.dart';

abstract interface class NewsRepo {
  Future<Either<Failure, List<News>>> getAllNews();
}
