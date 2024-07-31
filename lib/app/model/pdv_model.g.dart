// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdv_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PdvModelAdapter extends TypeAdapter<PdvModel> {
  @override
  final int typeId = 4;

  @override
  PdvModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PdvModel(
      id: fields[0] as int,
      description: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PdvModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PdvModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
