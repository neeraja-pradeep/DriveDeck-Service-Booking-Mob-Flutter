// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShopModelAdapter extends TypeAdapter<ShopModel> {
  @override
  final int typeId = 20;

  @override
  ShopModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShopModel(
      id: fields[0] as int,
      name: fields[1] as String,
      category: fields[2] as String?,
      rating: fields[3] as double?,
      reviewCount: fields[4] as int?,
      address: fields[5] as String?,
      area: fields[6] as String?,
      distanceKm: fields[7] as double?,
      description: fields[8] as String?,
      openHours: fields[9] as String?,
      operatingDays: fields[10] as String?,
      minBookingDuration: fields[11] as String?,
      images: (fields[12] as List?)?.cast<String>(),
      vehicleTypes: (fields[13] as List?)?.cast<ShopVehicleTypeModel>(),
      services: (fields[14] as List?)?.cast<ShopServiceModel>(),
      packages: (fields[15] as List?)?.cast<ShopPackageModel>(),
      accessories: (fields[16] as List?)?.cast<ShopAccessoryModel>(),
      isFavorite: fields[17] as bool?,
      phoneNumber: fields[18] as String?,
      latitude: fields[19] as double?,
      longitude: fields[20] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, ShopModel obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.rating)
      ..writeByte(4)
      ..write(obj.reviewCount)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.area)
      ..writeByte(7)
      ..write(obj.distanceKm)
      ..writeByte(8)
      ..write(obj.description)
      ..writeByte(9)
      ..write(obj.openHours)
      ..writeByte(10)
      ..write(obj.operatingDays)
      ..writeByte(11)
      ..write(obj.minBookingDuration)
      ..writeByte(12)
      ..write(obj.images)
      ..writeByte(13)
      ..write(obj.vehicleTypes)
      ..writeByte(14)
      ..write(obj.services)
      ..writeByte(15)
      ..write(obj.packages)
      ..writeByte(16)
      ..write(obj.accessories)
      ..writeByte(17)
      ..write(obj.isFavorite)
      ..writeByte(18)
      ..write(obj.phoneNumber)
      ..writeByte(19)
      ..write(obj.latitude)
      ..writeByte(20)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShopModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ShopVehicleTypeModelAdapter extends TypeAdapter<ShopVehicleTypeModel> {
  @override
  final int typeId = 21;

  @override
  ShopVehicleTypeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShopVehicleTypeModel(
      id: fields[0] as String,
      name: fields[1] as String,
      icon: fields[2] as String?,
      priceMultiplier: fields[3] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, ShopVehicleTypeModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.icon)
      ..writeByte(3)
      ..write(obj.priceMultiplier);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShopVehicleTypeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ShopServiceModelAdapter extends TypeAdapter<ShopServiceModel> {
  @override
  final int typeId = 22;

  @override
  ShopServiceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShopServiceModel(
      id: fields[0] as String,
      name: fields[1] as String,
      price: fields[2] as double,
      description: fields[3] as String?,
      durationMinutes: fields[4] as int?,
      categoryId: fields[5] as String?,
      isPopular: fields[6] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ShopServiceModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.durationMinutes)
      ..writeByte(5)
      ..write(obj.categoryId)
      ..writeByte(6)
      ..write(obj.isPopular);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShopServiceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ShopPackageModelAdapter extends TypeAdapter<ShopPackageModel> {
  @override
  final int typeId = 23;

  @override
  ShopPackageModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShopPackageModel(
      id: fields[0] as String,
      name: fields[1] as String,
      price: fields[2] as double,
      includedServiceIds: (fields[3] as List).cast<String>(),
      description: fields[4] as String?,
      discountPercentage: fields[5] as double?,
      isPopular: fields[6] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ShopPackageModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.includedServiceIds)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.discountPercentage)
      ..writeByte(6)
      ..write(obj.isPopular);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShopPackageModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ShopAccessoryModelAdapter extends TypeAdapter<ShopAccessoryModel> {
  @override
  final int typeId = 24;

  @override
  ShopAccessoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShopAccessoryModel(
      id: fields[0] as String,
      name: fields[1] as String,
      price: fields[2] as double,
      description: fields[3] as String?,
      imageUrl: fields[4] as String?,
      inStock: fields[5] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ShopAccessoryModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.imageUrl)
      ..writeByte(5)
      ..write(obj.inStock);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShopAccessoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ShopTimeSlotModelAdapter extends TypeAdapter<ShopTimeSlotModel> {
  @override
  final int typeId = 25;

  @override
  ShopTimeSlotModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShopTimeSlotModel(
      slotNumber: fields[0] as int,
      startTime: fields[1] as String,
      endTime: fields[2] as String,
      isAvailable: fields[3] as bool,
      availableCapacity: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ShopTimeSlotModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.slotNumber)
      ..writeByte(1)
      ..write(obj.startTime)
      ..writeByte(2)
      ..write(obj.endTime)
      ..writeByte(3)
      ..write(obj.isAvailable)
      ..writeByte(4)
      ..write(obj.availableCapacity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShopTimeSlotModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ShopDateAvailabilityModelAdapter
    extends TypeAdapter<ShopDateAvailabilityModel> {
  @override
  final int typeId = 26;

  @override
  ShopDateAvailabilityModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShopDateAvailabilityModel(
      date: fields[0] as String,
      slots: (fields[1] as List).cast<ShopTimeSlotModel>(),
      isOpen: fields[2] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ShopDateAvailabilityModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.slots)
      ..writeByte(2)
      ..write(obj.isOpen);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShopDateAvailabilityModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopModel _$ShopModelFromJson(Map<String, dynamic> json) => ShopModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      category: json['category'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      reviewCount: (json['review_count'] as num?)?.toInt(),
      address: json['address'] as String?,
      area: json['area'] as String?,
      distanceKm: (json['distance_km'] as num?)?.toDouble(),
      description: json['description'] as String?,
      openHours: json['open_hours'] as String?,
      operatingDays: json['operating_days'] as String?,
      minBookingDuration: json['min_booking_duration'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      vehicleTypes: (json['vehicle_types'] as List<dynamic>?)
          ?.map((e) => ShopVehicleTypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => ShopServiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      packages: (json['packages'] as List<dynamic>?)
          ?.map((e) => ShopPackageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      accessories: (json['accessories'] as List<dynamic>?)
          ?.map((e) => ShopAccessoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFavorite: json['is_favorite'] as bool?,
      phoneNumber: json['phone_number'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ShopModelToJson(ShopModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'rating': instance.rating,
      'review_count': instance.reviewCount,
      'address': instance.address,
      'area': instance.area,
      'distance_km': instance.distanceKm,
      'description': instance.description,
      'open_hours': instance.openHours,
      'operating_days': instance.operatingDays,
      'min_booking_duration': instance.minBookingDuration,
      'images': instance.images,
      'vehicle_types': instance.vehicleTypes,
      'services': instance.services,
      'packages': instance.packages,
      'accessories': instance.accessories,
      'is_favorite': instance.isFavorite,
      'phone_number': instance.phoneNumber,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

ShopVehicleTypeModel _$ShopVehicleTypeModelFromJson(
        Map<String, dynamic> json) =>
    ShopVehicleTypeModel(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String?,
      priceMultiplier: (json['price_multiplier'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ShopVehicleTypeModelToJson(
        ShopVehicleTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'price_multiplier': instance.priceMultiplier,
    };

ShopServiceModel _$ShopServiceModelFromJson(Map<String, dynamic> json) =>
    ShopServiceModel(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String?,
      durationMinutes: (json['duration_minutes'] as num?)?.toInt(),
      categoryId: json['category_id'] as String?,
      isPopular: json['is_popular'] as bool?,
    );

Map<String, dynamic> _$ShopServiceModelToJson(ShopServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'duration_minutes': instance.durationMinutes,
      'category_id': instance.categoryId,
      'is_popular': instance.isPopular,
    };

ShopPackageModel _$ShopPackageModelFromJson(Map<String, dynamic> json) =>
    ShopPackageModel(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      includedServiceIds: (json['included_service_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      discountPercentage: (json['discount_percentage'] as num?)?.toDouble(),
      isPopular: json['is_popular'] as bool?,
    );

Map<String, dynamic> _$ShopPackageModelToJson(ShopPackageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'included_service_ids': instance.includedServiceIds,
      'description': instance.description,
      'discount_percentage': instance.discountPercentage,
      'is_popular': instance.isPopular,
    };

ShopAccessoryModel _$ShopAccessoryModelFromJson(Map<String, dynamic> json) =>
    ShopAccessoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      inStock: json['in_stock'] as bool?,
    );

Map<String, dynamic> _$ShopAccessoryModelToJson(ShopAccessoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'in_stock': instance.inStock,
    };

ShopTimeSlotModel _$ShopTimeSlotModelFromJson(Map<String, dynamic> json) =>
    ShopTimeSlotModel(
      slotNumber: (json['slot_number'] as num).toInt(),
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      isAvailable: json['is_available'] as bool,
      availableCapacity: (json['available_capacity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ShopTimeSlotModelToJson(ShopTimeSlotModel instance) =>
    <String, dynamic>{
      'slot_number': instance.slotNumber,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'is_available': instance.isAvailable,
      'available_capacity': instance.availableCapacity,
    };

ShopDateAvailabilityModel _$ShopDateAvailabilityModelFromJson(
        Map<String, dynamic> json) =>
    ShopDateAvailabilityModel(
      date: json['date'] as String,
      slots: (json['slots'] as List<dynamic>)
          .map((e) => ShopTimeSlotModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isOpen: json['is_open'] as bool?,
    );

Map<String, dynamic> _$ShopDateAvailabilityModelToJson(
        ShopDateAvailabilityModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'slots': instance.slots,
      'is_open': instance.isOpen,
    };
