import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cores/init_dependancies.dart';

import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/news/presentation/pages/home_page.dart';

void main() {
  // call the initDependancies function to inject all the dependancies
  initDependancies();
  // add MultiBlocProvider here
  runApp(MultiBlocProvider(
    providers: [
      // list all the bloc providers:
      BlocProvider(
        // add the instance of NewsBloc
        // using dependancy injection:
        create: (_) => serviceLocator<NewsBloc>(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
