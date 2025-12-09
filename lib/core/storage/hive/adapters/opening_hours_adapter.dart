import 'package:hive/hive.dart';

import '../../../../features/shop/domain/entities/day_hours.dart';
import '../../../../features/shop/domain/entities/opening_hours.dart';

/// Hive TypeAdapter for OpeningHours entity.
class OpeningHoursAdapter extends TypeAdapter<OpeningHours> {
  @override
  final int typeId = 21;

  @override
  OpeningHours read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return OpeningHours(
      monday: fields[0] as DayHours,
      tuesday: fields[1] as DayHours,
      wednesday: fields[2] as DayHours,
      thursday: fields[3] as DayHours,
      friday: fields[4] as DayHours,
      saturday: fields[5] as DayHours,
      sunday: fields[6] as DayHours,
    );
  }

  @override
  void write(BinaryWriter writer, OpeningHours obj) {
    writer
      ..writeByte(7) // Number of fields
      ..writeByte(0)
      ..write(obj.monday)
      ..writeByte(1)
      ..write(obj.tuesday)
      ..writeByte(2)
      ..write(obj.wednesday)
      ..writeByte(3)
      ..write(obj.thursday)
      ..writeByte(4)
      ..write(obj.friday)
      ..writeByte(5)
      ..write(obj.saturday)
      ..writeByte(6)
      ..write(obj.sunday);
  }
}
