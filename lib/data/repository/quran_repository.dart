import 'package:dio/dio.dart';
import 'package:my_quran/api/api_base.dart';
import 'package:my_quran/data/model/doa_model.dart';
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

  Future<dynamic> getDoa() async {
    final dio = Dio();
    try {
      final respone = await dio.get("https://muslim-api-three.vercel.app//v1/doa");
      final data = doaModelFromJson(respone.toString());
      return data;
    } catch (e) {
      return e.toString();
    }
  }


}
