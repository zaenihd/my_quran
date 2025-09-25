import 'package:get_it/get_it.dart';
import 'package:my_quran/api/api_base.dart';

final getIt = GetIt.I;

void initInjection() {
  getIt.registerSingleton<ApiService>(ApiService());
}
