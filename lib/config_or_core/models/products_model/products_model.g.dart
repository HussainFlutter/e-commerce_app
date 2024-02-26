// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductsModelAdapter extends TypeAdapter<ProductsModel> {
  @override
  final int typeId = 0;

  @override
  ProductsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductsModel(
      id: fields[6] as int,
      name: fields[0] as String,
      category: fields[1] as String,
      imageUrl: fields[2] as String,
      price: fields[3] as double,
      isRecommended: fields[4] as bool,
      isPopular: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ProductsModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.isRecommended)
      ..writeByte(5)
      ..write(obj.isPopular)
      ..writeByte(6)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
