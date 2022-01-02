import 'package:flutter/cupertino.dart';
import 'package:spor_alfa_app/model/category.dart';
import 'package:spor_alfa_app/model/news.dart' as FOCUS;
import 'package:spor_alfa_app/model/headline.dart' as HEADLINE;
import 'package:spor_alfa_app/model/news.dart';
import 'package:spor_alfa_app/service/web_service.dart';

import '../service_locator.dart';

enum CurrentState {
  idle,
  loading,
  loaded,
}

class CategoriesViewModel with ChangeNotifier {
  WebService webService = serviceLocator<WebService>();
  CurrentState currentState = CurrentState.idle;
  List<Map<int, String>> baseCategories = [];
  List<Map<int, String>> subCategories = [];
  List<Map<Map<int, String>, List>> mergedCategories = [];
  List filteredNews = [];

  Future<void> getCategories() async {
    currentState = CurrentState.loading;
    var response = await webService.getCategory();
    print(response);
    var categories = categoryFromJson(response);
    parseBaseCategories(categories.reversed.toList());
    parseSubCategories(categories);
    mergeCategories();
    currentState = CurrentState.loaded;
    notifyListeners();
  }

  void parseBaseCategories(List<Category> categories) {
    for (int i = 0; i < categories.length; i++) {
      categories[i].parentId ?? baseCategories.add({categories[i].id: categories[i].name});
    }
  }

  void parseSubCategories(List<Category> categories) {
    for (int i = 0; i < categories.length; i++) {
      if (categories[i].parentId != null) subCategories.add({categories[i].parentId!: categories[i].name});
    }
  }

  void mergeCategories() {
    for (int i = 0; i < baseCategories.length; i++) {
      List tempList = [];
      for (var sub in subCategories) {
        if(baseCategories[i].keys.first == sub.keys.first) {
          tempList.add(sub.values.first);
        }
      }
      mergedCategories.add({{baseCategories[i].keys.first: baseCategories[i].values.first}: tempList});
    }
  }

  Future<void> getNewsWithCategoryId(int id, int limit, int skip) async {
    currentState = CurrentState.loading;
    var response = await webService.getNewsWithCategoryId(id, limit, skip);
    News news = News.fromJson(response);
    news.items.forEach((element) => filteredNews.add(element));
    currentState = CurrentState.loaded;
    notifyListeners();
  }

}
