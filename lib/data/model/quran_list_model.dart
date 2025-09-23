// To parse this JSON data, do
//
//     final quranListModel = quranListModelFromJson(jsonString);

import 'dart:convert';

import 'package:my_quran/helper/hive/hype_type_id.dart';
import 'package:hive_flutter/adapters.dart';
part 'quran_list_model.g.dart';

QuranListModel quranListModelFromJson(String str) => QuranListModel.fromJson(json.decode(str));

String quranListModelToJson(QuranListModel data) => json.encode(data.toJson());

@HiveType(typeId: HiveTypeIdConst.SURAT_DATA)
class QuranListModel {
  @HiveField(0)
    int? code;
  @HiveField(1)
    String? message;
  @HiveField(2)
    List<Surat>? data;

    QuranListModel({
        this.code,
        this.message,
        this.data,
    });

    factory QuranListModel.fromJson(Map<String, dynamic> json) => QuranListModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Surat>.from(json["data"]!.map((x) => Surat.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

@HiveType(typeId: HiveTypeIdConst.LIST_SURAT)
class Surat {
  @HiveField(0)
    int? nomor;
  @HiveField(1)
    String? nama;
  @HiveField(2)
    String? namaLatin;
  @HiveField(3)
    int? jumlahAyat;
  @HiveField(4)
    String? tempatTurun;
  @HiveField(5)
    String? arti;
  @HiveField(6)
    String? deskripsi;
  @HiveField(7)
    Map<String, String>? audioFull;

    Surat({
        this.nomor,
        this.nama,
        this.namaLatin,
        this.jumlahAyat,
        this.tempatTurun,
        this.arti,
        this.deskripsi,
        this.audioFull,
    });

    factory Surat.fromJson(Map<String, dynamic> json) => Surat(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
        tempatTurun: "tempatTurun",
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audioFull: Map.from(json["audioFull"]!).map((k, v) => MapEntry<String, String>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
        "tempatTurun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audioFull": Map.from(audioFull!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };

  void operator [](String other) {}
}


