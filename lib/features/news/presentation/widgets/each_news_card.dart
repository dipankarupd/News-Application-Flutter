import 'package:flutter/material.dart';
import 'package:news_app/features/news/domain/entity/news.dart';

class EachNewsCard extends StatelessWidget {
  // this takes a news from the constructor:
  final News news;
  const EachNewsCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
            ),
            const SizedBox(height: 20),
            SizedBox(
                width: double.infinity,
                child: Image(
                  image: NetworkImage(news.image),
                  fit: BoxFit.cover,
                )),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                  text: news.content,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    height: 1.2,
                  ),
                  children: const [
                    TextSpan(
                      text: ' Read full News',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
