import 'package:hive/hive.dart';

import '../../../../features/shop/domain/entities/opening_hours.dart';
import '../../../../features/shop/domain/entities/shop.dart';

/// Hive TypeAdapter for Shop entity.
class ShopAdapter extends TypeAdapter<Shop> {
  @override
  final int typeId = 20;

  @override
  Shop read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return Shop(
      id: fields[0] as String,
      name: fields[1] as String,
      images: (fields[2] as List).cast<String>(),
      rating: fields[3] as double,
      totalReviews: fields[4] as int,
      address: fields[5] as String,
      city: fields[6] as String,
      distanceKm: fields[7] as double?,
      description: fields[8] as String,
      openingHours: fields[9] as OpeningHours,
      latitude: fields[10] as double,
      longitude: fields[11] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Shop obj) {
    writer
      ..writeByte(12) // Number of fields
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.images)
      ..writeByte(3)
      ..write(obj.rating)
      ..writeByte(4)
      ..write(obj.totalReviews)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.city)
      ..writeByte(7)
      ..write(obj.distanceKm)
      ..writeByte(8)
      ..write(obj.description)
      ..writeByte(9)
      ..write(obj.openingHours)
      ..writeByte(10)
      ..write(obj.latitude)
      ..writeByte(11)
      ..write(obj.longitude);
  }
}
