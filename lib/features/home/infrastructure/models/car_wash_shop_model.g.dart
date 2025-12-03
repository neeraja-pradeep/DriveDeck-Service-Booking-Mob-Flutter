// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_wash_shop_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CarWashShopModelAdapter extends TypeAdapter<CarWashShopModel> {
  @override
  final int typeId = 2;

  @override
  CarWashShopModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CarWashShopModel(
      id: fields[0] as int,
      name: fields[1] as String,
      description: fields[2] as String?,
      image: fields[3] as String?,
      address: fields[4] as String?,
      phone: fields[5] as String?,
      latitude: fields[6] as double?,
      longitude: fields[7] as double?,
      rating: fields[8] as double?,
      reviewCount: fields[9] as int?,
      distance: fields[10] as double?,
      openingTime: fields[11] as String?,
      closingTime: fields[12] as String?,
      isOpen: fields[13] as bool,
      isWishlisted: fields[14] as bool,
      services: (fields[15] as List?)?.cast<String>(),
      priceRange: fields[16] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CarWashShopModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.phone)
      ..writeByte(6)
      ..write(obj.latitude)
      ..writeByte(7)
      ..write(obj.longitude)
      ..writeByte(8)
      ..write(obj.rating)
      ..writeByte(9)
      ..write(obj.reviewCount)
      ..writeByte(10)
      ..write(obj.distance)
      ..writeByte(11)
      ..write(obj.openingTime)
      ..writeByte(12)
      ..write(obj.closingTime)
      ..writeByte(13)
      ..write(obj.isOpen)
      ..writeByte(14)
      ..write(obj.isWishlisted)
      ..writeByte(15)
      ..write(obj.services)
      ..writeByte(16)
      ..write(obj.priceRange);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CarWashShopModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarWashShopModelImpl _$$CarWashShopModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CarWashShopModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      image: json['image'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      reviewCount: (json['review_count'] as num?)?.toInt(),
      distance: (json['distance'] as num?)?.toDouble(),
      openingTime: json['opening_time'] as String?,
      closingTime: json['closing_time'] as String?,
      isOpen: json['is_open'] as bool? ?? false,
      isWishlisted: json['is_wishlisted'] as bool? ?? false,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      priceRange: json['price_range'] as String?,
    );

Map<String, dynamic> _$$CarWashShopModelImplToJson(
        _$CarWashShopModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'address': instance.address,
      'phone': instance.phone,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'rating': instance.rating,
      'review_count': instance.reviewCount,
      'distance': instance.distance,
      'opening_time': instance.openingTime,
      'closing_time': instance.closingTime,
      'is_open': instance.isOpen,
      'is_wishlisted': instance.isWishlisted,
      'services': instance.services,
      'price_range': instance.priceRange,
    };

_$ShopsResponseImpl _$$ShopsResponseImplFromJson(Map<String, dynamic> json) =>
    _$ShopsResponseImpl(
      results: (json['results'] as List<dynamic>)
          .map((e) => CarWashShopModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num?)?.toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
    );

Map<String, dynamic> _$$ShopsResponseImplToJson(_$ShopsResponseImpl instance) =>
    <String, dynamic>{
      'results': instance.results,
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
    };
