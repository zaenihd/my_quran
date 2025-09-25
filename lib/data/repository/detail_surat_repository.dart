import 'dart:developer';

import 'package:my_quran/api/api_base.dart';
import 'package:my_quran/data/model/surat_detail_model.dart';
import 'package:my_quran/main.dart';

class DetailSuratRepository {
  final apiService =  getIt<ApiService>();
  Future<dynamic> getDetailSurat(String id) async {
    try {
      final respone = await apiService.getRequest("surat/$id");
      final data = suratDetailModelFromJson(respone.toString());
      log("berhasil");
      return data;
    } catch (e) {
      log("gagal $e");
      return e.toString();
    }
  }
}
