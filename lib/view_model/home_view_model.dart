import 'package:flutter/cupertino.dart';
import 'package:spor_alfa_app/model/news.dart';
import 'package:spor_alfa_app/model/news_image.dart';
import 'package:spor_alfa_app/service/web_service.dart';

enum CurrentState {
  idle,
  loading,
  loaded,
}

class HomeViewModel with ChangeNotifier {
  WebService webService = WebService();
  CurrentState currentState = CurrentState.idle;
  List focusNews = [];

  Future<void> getFocusNews() async {
    currentState = CurrentState.loading;
    var response = await webService.getNews(10, 0);
    News news = News.fromJson(response);
    news.items.forEach((element) => focusNews.add(element));
    currentState = CurrentState.loaded;
    notifyListeners();
  }

  Future<void> getHeadlineNews() async {
    currentState = CurrentState.loading;
    var response = await webService.getNews(5, 0);
    News news = News.fromJson(response);
    news.items.forEach((element) => focusNews.add(element));
    currentState = CurrentState.loaded;
    notifyListeners();
  }

  Future<String> getImageWithFilePath(String filePath) async {
    var response = await webService.getImage(filePath);
    NewsImage image = NewsImage.fromJson(response);
    return image.image;
  }

}
