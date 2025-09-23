// To parse this JSON data, do
//
//     final suratDetailModel = suratDetailModelFromJson(jsonString);

import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:my_quran/helper/hive/hype_type_id.dart';
part 'surat_detail_model.g.dart';

SuratDetailModel suratDetailModelFromJson(String str) => SuratDetailModel.fromJson(json.decode(str));

String suratDetailModelToJson(SuratDetailModel data) => json.encode(data.toJson());

@HiveType(typeId: HiveTypeIdConst.DETAIL_SURAT)
class SuratDetailModel {
  @HiveField(0)
    int code;
  @HiveField(1)
    String message;
  @HiveField(2)
    DataSurat data;

    SuratDetailModel({
        required this.code,
        required this.message,
        required this.data,
    });

    factory SuratDetailModel.fromJson(Map<String, dynamic> json) => SuratDetailModel(
        code: json["code"],
        message: json["message"],
        data: DataSurat.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
    };
}

@HiveType(typeId: HiveTypeIdConst.DATA_SURAT_DETAIL)
class DataSurat {
  @HiveField(0)
    int nomor;
  @HiveField(1)
    String nama;
  @HiveField(2)
    String namaLatin;
  @HiveField(3)
    int jumlahAyat;
  @HiveField(4)
    String tempatTurun;
  @HiveField(5)
    String arti;
  @HiveField(6)
    String deskripsi;
  @HiveField(7)
    Map<String, String> audioFull;
  @HiveField(8)
    List<Ayat> ayat;

    DataSurat({
        required this.nomor,
        required this.nama,
        required this.namaLatin,
        required this.jumlahAyat,
        required this.tempatTurun,
        required this.arti,
        required this.deskripsi,
        required this.audioFull,
        required this.ayat,
    });

    factory DataSurat.fromJson(Map<String, dynamic> json) => DataSurat(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
        tempatTurun: json["tempatTurun"],
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audioFull: Map.from(json["audioFull"]).map((k, v) => MapEntry<String, String>(k, v)),
        ayat: List<Ayat>.from(json["ayat"].map((x) => Ayat.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
        "tempatTurun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audioFull": Map.from(audioFull).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "ayat": List<dynamic>.from(ayat.map((x) => x.toJson())),
    };
}

@HiveType(typeId: HiveTypeIdConst.AYAT)
class Ayat {
  @HiveField(0)
    int nomorAyat;
  @HiveField(1)
    String teksArab;
  @HiveField(2)
    String teksLatin;
  @HiveField(3)
    String teksIndonesia;
  @HiveField(4)
    Map<String, String> audio;

    Ayat({
        required this.nomorAyat,
        required this.teksArab,
        required this.teksLatin,
        required this.teksIndonesia,
        required this.audio,
    });

    factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        nomorAyat: json["nomorAyat"],
        teksArab: json["teksArab"],
        teksLatin: json["teksLatin"],
        teksIndonesia: json["teksIndonesia"],
        audio: Map.from(json["audio"]).map((k, v) => MapEntry<String, String>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "nomorAyat": nomorAyat,
        "teksArab": teksArab,
        "teksLatin": teksLatin,
        "teksIndonesia": teksIndonesia,
        "audio": Map.from(audio).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}