// To parse this JSON data, do
//
//     final doaModel = doaModelFromJson(jsonString);

import 'package:hive_flutter/adapters.dart';
import 'dart:convert';
import 'package:my_quran/helper/hive/hype_type_id.dart';
part 'doa_model.g.dart';

DoaModel doaModelFromJson(String str) => DoaModel.fromJson(json.decode(str));

String doaModelToJson(DoaModel data) => json.encode(data.toJson());

@HiveType(typeId: HiveTypeIdConst.DOA_DATA)
class DoaModel {
  @HiveField(0)
    final int status;
  @HiveField(1)
    final List<Doa> data;

    DoaModel({
        required this.status,
        required this.data,
    });

    factory DoaModel.fromJson(Map<String, dynamic> json) => DoaModel(
        status: json["status"],
        data: List<Doa>.from(json["data"].map((x) => Doa.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

@HiveType(typeId: HiveTypeIdConst.LIST_DOA)
class Doa {
  @HiveField(0)
    final String judul;
  @HiveField(1)
    final String arab;
  @HiveField(2)
    final String indo;
  @HiveField(3)
    final String source;

    Doa({
        required this.judul,
        required this.arab,
        required this.indo,
        required this.source,
    });

    factory Doa.fromJson(Map<String, dynamic> json) => Doa(
        judul: json["judul"],
        arab: json["arab"],
        indo: json["indo"],
        source: json["source"],
    );

    Map<String, dynamic> toJson() => {
        "judul": judul,
        "arab": arab,
        "indo": indo,
        "source": source
    };
}
