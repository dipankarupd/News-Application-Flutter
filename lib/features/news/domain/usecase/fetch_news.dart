import 'package:fpdart/fpdart.dart';
import 'package:news_app/cores/failures/failure.dart';
import 'package:news_app/cores/usecases/usecase.dart';
import 'package:news_app/features/news/domain/entity/news.dart';
import 'package:news_app/features/news/domain/repository/news_repo.dart';

// we call the repo of domain layer here
// if we fetch the news successfully, we will have the list of news
// the getAllNews() method in repo does not need any Params, so we add NoParams in parameters
class FetchNews implements UseCase<List<News>, NoParams> {
  // get the instance of repo from constructor
  final NewsRepo repo;

  FetchNews({required this.repo});

  // missing override
  @override
  Future<Either<Failure, List<News>>> call(NoParams params) async {
    // return what the repo is returning
    return await repo.getAllNews();
  }
}
