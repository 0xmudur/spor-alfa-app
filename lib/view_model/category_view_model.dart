import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:spor_alfa_app/model/category.dart';
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

class CategoryViewModel with ChangeNotifier {
  WebService webService = serviceLocator<WebService>();
  CurrentState currentState = CurrentState.idle;
  List categories = [];


  Future<void> getCategories() async {
    currentState = CurrentState.loading;
    var response = await webService.getCategory();
    print(response);
    // Category category = Category.fromJson(response);
    // category.forEach((element) => categories.add(element));
    currentState = CurrentState.loaded;
    notifyListeners();
  }

  
}
