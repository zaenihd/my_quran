import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:my_quran/api/api_base.dart';
import 'package:my_quran/data/model/doa_model.dart';
import 'package:my_quran/data/model/jadwal_solat.dart';
import 'package:my_quran/data/model/quran_list_model.dart';
import 'package:my_quran/main.dart';

class QuranRepository {
  final apiService = getIt<ApiService>();

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
      final respone = await dio.get(
        "https://muslim-api-three.vercel.app//v1/doa",
      );
      final data = doaModelFromJson(respone.toString());
      return data;
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> getJadwalSolat({required String cityId}) async {
    final dateNow = DateTime.now();
    final dio = Dio();
    try {
      final respone = await dio.get(
        "https://adzan-indonesia-api.vercel.app/adzan?cityId=$cityId&month=${dateNow.month}&year=${dateNow.year}&date=${dateNow.day}",
      );
      final data = jadwalSolatModelFromJson(respone.toString());
      log("berhasil jadwal solat");
      return data;
    } catch (e) {
      log("message $e");
      return e.toString();
    }
  }
}
