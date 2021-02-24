import 'package:get_it/get_it.dart';
import 'package:pastpapers/core/services/api_service.dart';
import 'package:pastpapers/core/viewmodels/pastpapers_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => APIService());

  locator.registerFactory(() => PastPapersModel());
}
