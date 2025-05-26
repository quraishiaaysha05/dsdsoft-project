// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_sales_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemSalesModelAdapter extends TypeAdapter<ItemSalesModel> {
  @override
  final int typeId = 1;

  @override
  ItemSalesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemSalesModel(
      customer: fields[0] as String,
      item: fields[1] as String,
      fromDate: fields[2] as DateTime,
      toDate: fields[3] as DateTime,
      type: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ItemSalesModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.customer)
      ..writeByte(1)
      ..write(obj.item)
      ..writeByte(2)
      ..write(obj.fromDate)
      ..writeByte(3)
      ..write(obj.toDate)
      ..writeByte(4)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemSalesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
