// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuranListModelAdapter extends TypeAdapter<QuranListModel> {
  @override
  final int typeId = 2;

  @override
  QuranListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuranListModel(
      code: fields[0] as int?,
      message: fields[1] as String?,
      data: (fields[2] as List?)?.cast<Surat>(),
    );
  }

  @override
  void write(BinaryWriter writer, QuranListModel obj) {
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
      other is QuranListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SuratAdapter extends TypeAdapter<Surat> {
  @override
  final int typeId = 1;

  @override
  Surat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Surat(
      nomor: fields[0] as int?,
      nama: fields[1] as String?,
      namaLatin: fields[2] as String?,
      jumlahAyat: fields[3] as int?,
      tempatTurun: fields[4] as String?,
      arti: fields[5] as String?,
      deskripsi: fields[6] as String?,
      audioFull: (fields[7] as Map?)?.cast<String, String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Surat obj) {
    writer
      ..writeByte(8)
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
      ..write(obj.audioFull);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SuratAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
