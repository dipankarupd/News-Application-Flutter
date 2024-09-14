// home_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/news/presentation/widgets/each_news_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // emit the initial event:
    context.read<NewsBloc>().add(NewsInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    // wrap the state with a bloc builder

    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        // if error state is emitted: return a snackbar message and a retry button

        if (state is NewsErrorState) {
          // return a retry button

          return Center(
            child: ElevatedButton(
                onPressed: () {
                  context.read<NewsBloc>().add(NewsInitialEvent());
                },
                child: Text('Error occured. Retry')),
          );
        }

        // otherwise if there is a loading state
        // show a circular progress bar
        else if (state is NewsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // for success state show the resulting news
        else if (state is NewsSuccessState) {
          print(state.news.length);
          return Scaffold(
              appBar: AppBar(
                title: const Text('News App'),
              ),
              body: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    child: EachNewsCard(
                      news: state.news[index],
                    ),
                  );
                },
                itemCount: state.news.length,
              ));
        } else {
          return const Scaffold();
        }
      },
    );
  }
}
