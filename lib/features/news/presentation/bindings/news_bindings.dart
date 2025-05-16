import 'package:get/get.dart';
import 'package:news_app/features/news/presentation/controllers/news_controller.dart';

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsController());
  }
}
