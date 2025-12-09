import 'package:hive/hive.dart';

import '../../../../features/shop/domain/entities/day_hours.dart';

/// Hive TypeAdapter for DayHours entity.
class DayHoursAdapter extends TypeAdapter<DayHours> {
  @override
  final int typeId = 22;

  @override
  DayHours read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return DayHours(
      openTime: fields[0] as String,
      closeTime: fields[1] as String,
      isClosed: fields[2] as bool? ?? false,
    );
  }

  @override
  void write(BinaryWriter writer, DayHours obj) {
    writer
      ..writeByte(3) // Number of fields
      ..writeByte(0)
      ..write(obj.openTime)
      ..writeByte(1)
      ..write(obj.closeTime)
      ..writeByte(2)
      ..write(obj.isClosed);
  }
}
