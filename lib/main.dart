import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/cores/init_dependancies.dart';
import 'package:news_app/features/news/presentation/bindings/news_bindings.dart';
import 'package:news_app/features/news/presentation/pages/home_page.dart';

void main() {
  initDependancies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: NewsBinding(),
      home: const HomePage(),
    );
  }
}
