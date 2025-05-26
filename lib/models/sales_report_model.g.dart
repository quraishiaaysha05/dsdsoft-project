// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_report_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SalesReportModelAdapter extends TypeAdapter<SalesReportModel> {
  @override
  final int typeId = 2;

  @override
  SalesReportModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SalesReportModel(
      customer: fields[0] as String,
      fromDate: fields[1] as DateTime,
      toDate: fields[2] as DateTime,
      dsdId: fields[3] as String,
      type: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SalesReportModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.customer)
      ..writeByte(1)
      ..write(obj.fromDate)
      ..writeByte(2)
      ..write(obj.toDate)
      ..writeByte(3)
      ..write(obj.dsdId)
      ..writeByte(4)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SalesReportModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
