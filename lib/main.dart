import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_quran/data/model/doa_model.dart';
import 'package:my_quran/data/model/quran_list_model.dart';
import 'package:my_quran/data/model/surat_detail_model.dart';
import 'package:my_quran/helper/app_color.dart';
import 'package:my_quran/helper/injection.dart';
import 'package:my_quran/helper/navigator/app_navigator.dart';
import 'package:my_quran/helper/hive/hive_const.dart';
import 'package:my_quran/helper/hive/hive_register.dart';
import 'package:my_quran/pages/detail/bloc/detail_bloc.dart';
import 'package:my_quran/pages/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_quran/pages/search/cubit/search_cubit.dart';

final getIt = GetIt.I;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final hiveRegister = HiveRegister();
  // init hive setelah install package
  await Hive.initFlutter();
  hiveRegister.fetchRegisterSurat();
  hiveRegister.fetchRegisterDetailSurat();
  hiveRegister.fetchRegisterDoa();
  await Hive.openBox<QuranListModel>(QuranBoxName.quranBox);
  await Hive.openBox<SuratDetailModel>(QuranBoxName.suratDetailBox);
  await Hive.openBox<DoaModel>(QuranBoxName.doaBox);
  initInjection();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => DetailBloc()),
        BlocProvider(create: (context) => SearchCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: AppNavigator.router,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.bgApp),
        ),
      ),
    );
  }
}
