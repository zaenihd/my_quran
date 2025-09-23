import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_quran/data/model/doa_model.dart';
import 'package:my_quran/data/model/quran_list_model.dart';
import 'package:my_quran/data/model/surat_detail_model.dart';
import 'package:my_quran/helper/hive/hive_const.dart';

class HiveHelper {
  static Box<QuranListModel> getAllSurat() =>
      Hive.box<QuranListModel>(QuranBoxName.quranBox);
  static Box<SuratDetailModel> getDetailSurat() =>
      Hive.box<SuratDetailModel>(QuranBoxName.suratDetailBox);

  static Box<DoaModel> getDoa() => Hive.box<DoaModel>(QuranBoxName.doaBox);
}
