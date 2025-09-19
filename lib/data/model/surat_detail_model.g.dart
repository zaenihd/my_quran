// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surat_detail_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SuratDetailModelAdapter extends TypeAdapter<SuratDetailModel> {
  @override
  final int typeId = 3;

  @override
  SuratDetailModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SuratDetailModel(
      code: fields[0] as int,
      message: fields[1] as String,
      data: fields[2] as DataSurat,
    );
  }

  @override
  void write(BinaryWriter writer, SuratDetailModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SuratDetailModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DataSuratAdapter extends TypeAdapter<DataSurat> {
  @override
  final int typeId = 4;

  @override
  DataSurat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataSurat(
      nomor: fields[0] as int,
      nama: fields[1] as String,
      namaLatin: fields[2] as String,
      jumlahAyat: fields[3] as int,
      tempatTurun: fields[4] as String,
      arti: fields[5] as String,
      deskripsi: fields[6] as String,
      audioFull: (fields[7] as Map).cast<String, String>(),
      ayat: (fields[8] as List).cast<Ayat>(),
    );
  }

  @override
  void write(BinaryWriter writer, DataSurat obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.nomor)
      ..writeByte(1)
      ..write(obj.nama)
      ..writeByte(2)
      ..write(obj.namaLatin)
      ..writeByte(3)
      ..write(obj.jumlahAyat)
      ..writeByte(4)
      ..write(obj.tempatTurun)
      ..writeByte(5)
      ..write(obj.arti)
      ..writeByte(6)
      ..write(obj.deskripsi)
      ..writeByte(7)
      ..write(obj.audioFull)
      ..writeByte(8)
      ..write(obj.ayat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataSuratAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AyatAdapter extends TypeAdapter<Ayat> {
  @override
  final int typeId = 5;

  @override
  Ayat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ayat(
      nomorAyat: fields[0] as int,
      teksArab: fields[1] as String,
      teksLatin: fields[2] as String,
      teksIndonesia: fields[3] as String,
      audio: (fields[4] as Map).cast<String, String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Ayat obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.nomorAyat)
      ..writeByte(1)
      ..write(obj.teksArab)
      ..writeByte(2)
      ..write(obj.teksLatin)
      ..writeByte(3)
      ..write(obj.teksIndonesia)
      ..writeByte(4)
      ..write(obj.audio);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AyatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
