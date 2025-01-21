// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QrModelAdapter extends TypeAdapter<QrModel> {
  @override
  final int typeId = 0;

  @override
  QrModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QrModel(
      fields[2] as Uint8List,
      date: fields[1] as String,
      qrData: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, QrModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.qrData)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QrModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
