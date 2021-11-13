import 'package:flutter/material.dart';


class MainViewModel extends ChangeNotifier {
  int selectedIndex = 0;

  void onTabChanged(int index) {
    selectedIndex = index;
    notifyListeners();
  }


}