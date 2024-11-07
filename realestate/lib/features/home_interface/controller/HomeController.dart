import 'package:realestate/data/home/dummy/DummyHomeData.dart';

class HomeController {
  List<Map<String, String>> getFeatures() {
    return DummyHomeData.features;
  }

  List<Map<String, String>> getCategories() {
    return DummyHomeData.categories;
  }
}
