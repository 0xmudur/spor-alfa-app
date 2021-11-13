import 'package:get_it/get_it.dart';
import 'package:spor_alfa_app/main_view_model.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {

  // serviceLocator.registerLazySingleton<StorageService>(() => StorageServiceImpl());
  // serviceLocator.registerLazySingleton<CurrencyService>(() => CurrencyServiceFake());
  //
  serviceLocator.registerFactory<MainViewModel>(() => MainViewModel());
  // serviceLocator.registerFactory<ChooseFavoritesViewModel>(() => ChooseFavoritesViewModel());
}