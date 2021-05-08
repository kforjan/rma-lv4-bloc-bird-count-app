import 'package:get_it/get_it.dart';
import 'package:rma_lv4_bird_counting_bloc/data/sharedpref/shared_preferences_helper.dart';

final locator = GetIt.instance;

setup() {
  locator.registerLazySingleton(() => SharedPreferencesHelper());
}
