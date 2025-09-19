
import 'package:hive/hive.dart' show Hive;
import 'package:my_quran/data/model/quran_list_model.dart';
import 'package:my_quran/data/model/surat_detail_model.dart';

class HiveRegister {

  void fetchRegisterSurat() {
    Hive.registerAdapter<QuranListModel>(QuranListModelAdapter());
    Hive.registerAdapter<Surat>(SuratAdapter());
  }

  void fetchRegisterDetailSurat() {
    Hive.registerAdapter<SuratDetailModel>(SuratDetailModelAdapter());
    Hive.registerAdapter<DataSurat>(DataSuratAdapter());
    Hive.registerAdapter<Ayat>(AyatAdapter());
  }
}