import 'package:flutter/material.dart';
import 'package:spor_alfa_app/common/theme.dart';
import 'package:spor_alfa_app/main_view.dart';
import 'package:spor_alfa_app/service_locator.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();

  runApp(MaterialApp(
      theme: SporAlfaTheme().theme,
      home: MainView()));
}



