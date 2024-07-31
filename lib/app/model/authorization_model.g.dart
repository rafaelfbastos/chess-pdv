// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthorizationModelAdapter extends TypeAdapter<AuthorizationModel> {
  @override
  final int typeId = 3;

  @override
  AuthorizationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthorizationModel(
      token: fields[0] as String,
      type: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AuthorizationModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthorizationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
