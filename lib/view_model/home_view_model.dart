import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:spor_alfa_app/model/news.dart' as FOCUS;
import 'package:spor_alfa_app/model/headline.dart' as HEADLINE;
import 'package:spor_alfa_app/model/news_image.dart';
import 'package:spor_alfa_app/service/web_service.dart';
import 'package:spor_alfa_app/utils/base64_encoder.dart';

import '../service_locator.dart';

enum CurrentState {
  idle,
  loading,
  loaded,
}

class HomeViewModel with ChangeNotifier {
  WebService webService = serviceLocator<WebService>();
  CurrentState currentState = CurrentState.idle;
  List focusNews = [];
  List headlineNews = [];
  late Uint8List newsImage;
  List<Uint8List> headlineImages = [];


  Future<void> getFocusNews() async {
    currentState = CurrentState.loading;
    var response = await webService.getNews(10, 0);
    FOCUS.News news = FOCUS.News.fromJson(response);
    news.items.forEach((element) => focusNews.add(element));
    currentState = CurrentState.loaded;
    notifyListeners();
  }

  Future<void> getHeadlineNews() async {
    currentState = CurrentState.loading;
    var response = await webService.getHeadline(10, 0, true);
    HEADLINE.Headline headline = HEADLINE.Headline.fromJson(response);
    headline.items.forEach((element) => headlineNews.add(element));
    for (var item in headlineNews) {
      var response = await webService.getImage(item.news.imageSrc);
      NewsImage base64Image = NewsImage.fromJson(response.first);
      Uint8List image = await Base64.imageFromBase64String(base64Image.image);
      headlineImages.add(image);
    }
    currentState = CurrentState.loaded;
    notifyListeners();
  }


  Future<void> getImageWithFilePath(String filePath) async {
    currentState = CurrentState.loading;
    var response = await webService.getImage(filePath);
    NewsImage base64Image = NewsImage.fromJson(response.first);
    Uint8List image = Base64.imageFromBase64String(base64Image.image);
    newsImage = image;
    currentState = CurrentState.loaded;
    notifyListeners();
  }

}
