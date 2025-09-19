import 'package:my_quran/api/api_base.dart';
import 'package:my_quran/data/model/quran_list_model.dart';

class QuranRepository {
  final apiService = ApiService();
  Future<dynamic> getSurat() async {
    try {
      final respone = await apiService.getRequest("surat");
      final data = quranListModelFromJson(respone.toString());
      return data;
    } catch (e) {
      return e.toString();
    }
  }
}
