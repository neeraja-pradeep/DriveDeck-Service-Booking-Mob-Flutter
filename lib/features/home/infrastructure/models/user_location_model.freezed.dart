// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserLocationModel _$UserLocationModelFromJson(Map<String, dynamic> json) {
  return _UserLocationModel.fromJson(json);
}

/// @nodoc
mixin _$UserLocationModel {
  @HiveField(0)
  double get latitude => throw _privateConstructorUsedError;
  @HiveField(1)
  double get longitude => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get address => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get city => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get state => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get country => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: 'postal_code')
  String? get postalCode => throw _privateConstructorUsedError;
  @HiveField(7)
  DateTime? get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserLocationModelCopyWith<UserLocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLocationModelCopyWith<$Res> {
  factory $UserLocationModelCopyWith(
          UserLocationModel value, $Res Function(UserLocationModel) then) =
      _$UserLocationModelCopyWithImpl<$Res, UserLocationModel>;
  @useResult
  $Res call(
      {@HiveField(0) double latitude,
      @HiveField(1) double longitude,
      @HiveField(2) String? address,
      @HiveField(3) String? city,
      @HiveField(4) String? state,
      @HiveField(5) String? country,
      @HiveField(6) @JsonKey(name: 'postal_code') String? postalCode,
      @HiveField(7) DateTime? timestamp});
}

/// @nodoc
class _$UserLocationModelCopyWithImpl<$Res, $Val extends UserLocationModel>
    implements $UserLocationModelCopyWith<$Res> {
  _$UserLocationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? address = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? postalCode = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserLocationModelImplCopyWith<$Res>
    implements $UserLocationModelCopyWith<$Res> {
  factory _$$UserLocationModelImplCopyWith(_$UserLocationModelImpl value,
          $Res Function(_$UserLocationModelImpl) then) =
      __$$UserLocationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) double latitude,
      @HiveField(1) double longitude,
      @HiveField(2) String? address,
      @HiveField(3) String? city,
      @HiveField(4) String? state,
      @HiveField(5) String? country,
      @HiveField(6) @JsonKey(name: 'postal_code') String? postalCode,
      @HiveField(7) DateTime? timestamp});
}

/// @nodoc
class __$$UserLocationModelImplCopyWithImpl<$Res>
    extends _$UserLocationModelCopyWithImpl<$Res, _$UserLocationModelImpl>
    implements _$$UserLocationModelImplCopyWith<$Res> {
  __$$UserLocationModelImplCopyWithImpl(_$UserLocationModelImpl _value,
      $Res Function(_$UserLocationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? address = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? postalCode = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_$UserLocationModelImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserLocationModelImpl extends _UserLocationModel {
  const _$UserLocationModelImpl(
      {@HiveField(0) required this.latitude,
      @HiveField(1) required this.longitude,
      @HiveField(2) this.address,
      @HiveField(3) this.city,
      @HiveField(4) this.state,
      @HiveField(5) this.country,
      @HiveField(6) @JsonKey(name: 'postal_code') this.postalCode,
      @HiveField(7) this.timestamp})
      : super._();

  factory _$UserLocationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserLocationModelImplFromJson(json);

  @override
  @HiveField(0)
  final double latitude;
  @override
  @HiveField(1)
  final double longitude;
  @override
  @HiveField(2)
  final String? address;
  @override
  @HiveField(3)
  final String? city;
  @override
  @HiveField(4)
  final String? state;
  @override
  @HiveField(5)
  final String? country;
  @override
  @HiveField(6)
  @JsonKey(name: 'postal_code')
  final String? postalCode;
  @override
  @HiveField(7)
  final DateTime? timestamp;

  @override
  String toString() {
    return 'UserLocationModel(latitude: $latitude, longitude: $longitude, address: $address, city: $city, state: $state, country: $country, postalCode: $postalCode, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLocationModelImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, address,
      city, state, country, postalCode, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserLocationModelImplCopyWith<_$UserLocationModelImpl> get copyWith =>
      __$$UserLocationModelImplCopyWithImpl<_$UserLocationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserLocationModelImplToJson(
      this,
    );
  }
}

abstract class _UserLocationModel extends UserLocationModel {
  const factory _UserLocationModel(
      {@HiveField(0) required final double latitude,
      @HiveField(1) required final double longitude,
      @HiveField(2) final String? address,
      @HiveField(3) final String? city,
      @HiveField(4) final String? state,
      @HiveField(5) final String? country,
      @HiveField(6) @JsonKey(name: 'postal_code') final String? postalCode,
      @HiveField(7) final DateTime? timestamp}) = _$UserLocationModelImpl;
  const _UserLocationModel._() : super._();

  factory _UserLocationModel.fromJson(Map<String, dynamic> json) =
      _$UserLocationModelImpl.fromJson;

  @override
  @HiveField(0)
  double get latitude;
  @override
  @HiveField(1)
  double get longitude;
  @override
  @HiveField(2)
  String? get address;
  @override
  @HiveField(3)
  String? get city;
  @override
  @HiveField(4)
  String? get state;
  @override
  @HiveField(5)
  String? get country;
  @override
  @HiveField(6)
  @JsonKey(name: 'postal_code')
  String? get postalCode;
  @override
  @HiveField(7)
  DateTime? get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$UserLocationModelImplCopyWith<_$UserLocationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
