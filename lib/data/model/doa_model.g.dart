// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doa_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DoaModelAdapter extends TypeAdapter<DoaModel> {
  @override
  final int typeId = 7;

  @override
  DoaModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DoaModel(
      status: fields[0] as int,
      data: (fields[1] as List).cast<Doa>(),
    );
  }

  @override
  void write(BinaryWriter writer, DoaModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DoaAdapter extends TypeAdapter<Doa> {
  @override
  final int typeId = 8;

  @override
  Doa read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Doa(
      judul: fields[0] as String,
      arab: fields[1] as String,
      indo: fields[2] as String,
      source: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Doa obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.judul)
      ..writeByte(1)
      ..write(obj.arab)
      ..writeByte(2)
      ..write(obj.indo)
      ..writeByte(3)
      ..write(obj.source);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
