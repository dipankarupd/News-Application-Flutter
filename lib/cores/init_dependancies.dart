import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/features/news/data/repository/news_repo_impl.dart';
import 'package:news_app/features/news/data/source/news_remote_source.dart';
import 'package:news_app/features/news/data/source/news_remote_source_impl.dart';
import 'package:news_app/features/news/domain/repository/news_repo.dart';
import 'package:news_app/features/news/domain/usecase/fetch_news.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';

// get the instance of GetIt service locator:
final serviceLocator = GetIt.instance;

void initDependancies() {
  // We are using dio. So why not get the instance of it here iteself?
  // initialize the Dio instance with getit:
  serviceLocator.registerLazySingleton(() => Dio());

  // we can initialize all the dependancies which we have written for news feature
  // better way is create a separate function for each feature's dependancy injection
  // create a function _initNews and initialize all the dependancies for news feature here
  _initNews();
}

// implement the _initNews method:
void _initNews() {
  // we will now add all the dependancies here

  // start with data layer -> remote source
  // we give the implementation of remote source because it needs the dependancy
  serviceLocator
    ..registerFactory<NewsRemoteSource>(
      () => NewsRemoteSourceImpl(dio: serviceLocator()),
    )

    // now provide the dependancy for repository in same way:
    // serviceLocator() automatically knows which dependancy is needed and provides it
    // not our concern. Service locator handles everything
    ..registerFactory<NewsRepo>(
      () => NewsRepoImpl(source: serviceLocator()),
    )

    // provide for usecase and bloc in similar way:
    ..registerFactory<FetchNews>(
      () => FetchNews(repo: serviceLocator()),
    )
    ..registerLazySingleton<NewsBloc>(
      () => NewsBloc(serviceLocator()),
    );
}

/*

Difference between registerLazySingleton and registerFactory:

registerFactory -> everytime create a new instance and return it when requestend
registerlazySingleton -> create the instance when requested 
for the first time and always return the same instance

*/