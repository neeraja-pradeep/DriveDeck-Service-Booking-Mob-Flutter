// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_category_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServiceCategoryModelAdapter extends TypeAdapter<ServiceCategoryModel> {
  @override
  final int typeId = 1;

  @override
  ServiceCategoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ServiceCategoryModel(
      id: fields[0] as int,
      name: fields[1] as String,
      icon: fields[2] as String?,
      image: fields[3] as String?,
      description: fields[4] as String?,
      isActive: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ServiceCategoryModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.icon)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.isActive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServiceCategoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceCategoryModelImpl _$$ServiceCategoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ServiceCategoryModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      icon: json['icon'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      isActive: json['is_active'] as bool? ?? true,
    );

Map<String, dynamic> _$$ServiceCategoryModelImplToJson(
        _$ServiceCategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'image': instance.image,
      'description': instance.description,
      'is_active': instance.isActive,
    };

_$ServiceCategoriesResponseImpl _$$ServiceCategoriesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ServiceCategoriesResponseImpl(
      results: (json['results'] as List<dynamic>)
          .map((e) => ServiceCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num?)?.toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
    );

Map<String, dynamic> _$$ServiceCategoriesResponseImplToJson(
        _$ServiceCategoriesResponseImpl instance) =>
    <String, dynamic>{
      'results': instance.results,
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
    };
