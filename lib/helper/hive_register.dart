
import 'package:hive/hive.dart' show Hive;
import 'package:my_quran/data/model/quran_list_model.dart';

class HiveRegister {

  void fetchRegisterSurat() {
    Hive.registerAdapter<QuranListModel>(QuranListModelAdapter());
  }

  // void fetchRegisterDetailSurat() {
  //   Hive.registerAdapter<SuratDetailModel>(SuratDetailModelAdapter());
  //   Hive.registerAdapter<DataSurat>(DataSuratAdapter());
  //   Hive.registerAdapter<Ayat>(AyatAdapter());
  // }
}