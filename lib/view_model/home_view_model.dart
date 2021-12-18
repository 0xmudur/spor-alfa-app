import 'package:flutter/cupertino.dart';
import 'package:spor_alfa_app/model/news.dart';
import 'package:spor_alfa_app/service/web_service.dart';

class HomeViewModel with ChangeNotifier {

  WebService webService = WebService();

  Future<void> getNews() async {
    var response = await webService.getNews(20, 1);

    News news = News.fromJson(response);
    print(news.items[0].body);

    notifyListeners();
  }
}

