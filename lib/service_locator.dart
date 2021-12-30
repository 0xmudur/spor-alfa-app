import 'package:get_it/get_it.dart';
import 'package:spor_alfa_app/main_view_model.dart';
import 'package:spor_alfa_app/service/web_service.dart';
import 'package:spor_alfa_app/view_model/categories_view_model.dart';
import 'package:spor_alfa_app/view_model/home_view_model.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {

  serviceLocator.registerLazySingleton<WebService>(() => WebService());

  serviceLocator.registerFactory<MainViewModel>(() => MainViewModel());
  serviceLocator.registerFactory<HomeViewModel>(() => HomeViewModel());
  serviceLocator.registerFactory<CategoriesViewModel>(() => CategoriesViewModel());
}