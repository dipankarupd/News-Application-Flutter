import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/news/presentation/controllers/news_controller.dart';
import 'package:news_app/features/news/presentation/widgets/each_news_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewsController>();

    return Obx(() {
      final state = controller.state.value;

      if (state is NewsLoadingState) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is NewsErrorState) {
        return Center(
          child: ElevatedButton(
            onPressed: controller.fetchAllNews,
            child: const Text('Error occurred. Retry'),
          ),
        );
      } else if (state is NewsSuccessState) {
        return Scaffold(
          appBar: AppBar(title: const Text('News App')),
          body: ListView.builder(
            itemCount: state.news.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(10),
                child: EachNewsCard(news: state.news[index]),
              );
            },
          ),
        );
      }

      return const Scaffold(); // Default fallback
    });
  }
}
