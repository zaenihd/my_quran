// To parse this JSON data, do
//
//     final jadwalSolatModel = jadwalSolatModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

JadwalSolatModel jadwalSolatModelFromJson(String str) => JadwalSolatModel.fromJson(json.decode(str));

String jadwalSolatModelToJson(JadwalSolatModel data) => json.encode(data.toJson());

class JadwalSolatModel {
    final int statusCode;
    final String message;
    final JadwalSolatModelData data;

    JadwalSolatModel({
        required this.statusCode,
        required this.message,
        required this.data,
    });

    factory JadwalSolatModel.fromJson(Map<String, dynamic> json) => JadwalSolatModel(
        statusCode: json["statusCode"],
        message: json["message"],
        data: JadwalSolatModelData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "data": data.toJson(),
    };
}

class JadwalSolatModelData {
    final String city;
    final String gmt;
    final String latitude;
    final String longtitude;
    final String date;
    final DataData data;

    JadwalSolatModelData({
        required this.city,
        required this.gmt,
        required this.latitude,
        required this.longtitude,
        required this.date,
        required this.data,
    });

    factory JadwalSolatModelData.fromJson(Map<String, dynamic> json) => JadwalSolatModelData(
        city: json["city"],
        gmt: json["gmt"],
        latitude: json["latitude"],
        longtitude: json["longtitude"],
        date: json["date"],
        data: DataData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "city": city,
        "gmt": gmt,
        "latitude": latitude,
        "longtitude": longtitude,
        "date": date,
        "data": data.toJson(),
    };
}

class DataData {
    final String date;
    final String islamicDate;
    final Adzan adzan;

    DataData({
        required this.date,
        required this.islamicDate,
        required this.adzan,
    });

    factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        date: json["date"],
        islamicDate: json["islamicDate"],
        adzan: Adzan.fromJson(json["adzan"]),
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "islamicDate": islamicDate,
        "adzan": adzan.toJson(),
    };
}

class Adzan {
    final String imsyak;
    final String shubuh;
    final String terbit;
    final String dhuha;
    final String dzuhur;
    final String ashr;
    final String maghrib;
    final String isya;

    Adzan({
        required this.imsyak,
        required this.shubuh,
        required this.terbit,
        required this.dhuha,
        required this.dzuhur,
        required this.ashr,
        required this.maghrib,
        required this.isya,
    });

    factory Adzan.fromJson(Map<String, dynamic> json) => Adzan(
        imsyak: json["imsyak"],
        shubuh: json["shubuh"],
        terbit: json["terbit"],
        dhuha: json["dhuha"],
        dzuhur: json["dzuhur"],
        ashr: json["ashr"],
        maghrib: json["maghrib"],
        isya: json["isya"],
    );

    Map<String, dynamic> toJson() => {
        "imsyak": imsyak,
        "shubuh": shubuh,
        "terbit": terbit,
        "dhuha": dhuha,
        "dzuhur": dzuhur,
        "ashr": ashr,
        "maghrib": maghrib,
        "isya": isya,
    };
}
