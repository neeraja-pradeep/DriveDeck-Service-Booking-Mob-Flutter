// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShopDetails _$ShopDetailsFromJson(Map<String, dynamic> json) {
  return _ShopDetails.fromJson(json);
}

/// @nodoc
mixin _$ShopDetails {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get reviewCount => throw _privateConstructorUsedError;
  ShopLocation get location => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get openHours => throw _privateConstructorUsedError;
  String get minBookingDuration => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  List<VehicleType> get vehicleTypes => throw _privateConstructorUsedError;
  List<Service> get services => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopDetailsCopyWith<ShopDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopDetailsCopyWith<$Res> {
  factory $ShopDetailsCopyWith(
          ShopDetails value, $Res Function(ShopDetails) then) =
      _$ShopDetailsCopyWithImpl<$Res, ShopDetails>;
  @useResult
  $Res call(
      {int id,
      String name,
      String category,
      double rating,
      int reviewCount,
      ShopLocation location,
      String description,
      String openHours,
      String minBookingDuration,
      List<String> images,
      List<VehicleType> vehicleTypes,
      List<Service> services});

  $ShopLocationCopyWith<$Res> get location;
}

/// @nodoc
class _$ShopDetailsCopyWithImpl<$Res, $Val extends ShopDetails>
    implements $ShopDetailsCopyWith<$Res> {
  _$ShopDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? location = null,
    Object? description = null,
    Object? openHours = null,
    Object? minBookingDuration = null,
    Object? images = null,
    Object? vehicleTypes = null,
    Object? services = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as ShopLocation,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      openHours: null == openHours
          ? _value.openHours
          : openHours // ignore: cast_nullable_to_non_nullable
              as String,
      minBookingDuration: null == minBookingDuration
          ? _value.minBookingDuration
          : minBookingDuration // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      vehicleTypes: null == vehicleTypes
          ? _value.vehicleTypes
          : vehicleTypes // ignore: cast_nullable_to_non_nullable
              as List<VehicleType>,
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ShopLocationCopyWith<$Res> get location {
    return $ShopLocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShopDetailsImplCopyWith<$Res>
    implements $ShopDetailsCopyWith<$Res> {
  factory _$$ShopDetailsImplCopyWith(
          _$ShopDetailsImpl value, $Res Function(_$ShopDetailsImpl) then) =
      __$$ShopDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String category,
      double rating,
      int reviewCount,
      ShopLocation location,
      String description,
      String openHours,
      String minBookingDuration,
      List<String> images,
      List<VehicleType> vehicleTypes,
      List<Service> services});

  @override
  $ShopLocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$ShopDetailsImplCopyWithImpl<$Res>
    extends _$ShopDetailsCopyWithImpl<$Res, _$ShopDetailsImpl>
    implements _$$ShopDetailsImplCopyWith<$Res> {
  __$$ShopDetailsImplCopyWithImpl(
      _$ShopDetailsImpl _value, $Res Function(_$ShopDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? location = null,
    Object? description = null,
    Object? openHours = null,
    Object? minBookingDuration = null,
    Object? images = null,
    Object? vehicleTypes = null,
    Object? services = null,
  }) {
    return _then(_$ShopDetailsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as ShopLocation,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      openHours: null == openHours
          ? _value.openHours
          : openHours // ignore: cast_nullable_to_non_nullable
              as String,
      minBookingDuration: null == minBookingDuration
          ? _value.minBookingDuration
          : minBookingDuration // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      vehicleTypes: null == vehicleTypes
          ? _value._vehicleTypes
          : vehicleTypes // ignore: cast_nullable_to_non_nullable
              as List<VehicleType>,
      services: null == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShopDetailsImpl implements _ShopDetails {
  const _$ShopDetailsImpl(
      {required this.id,
      required this.name,
      required this.category,
      required this.rating,
      required this.reviewCount,
      required this.location,
      required this.description,
      required this.openHours,
      required this.minBookingDuration,
      required final List<String> images,
      required final List<VehicleType> vehicleTypes,
      required final List<Service> services})
      : _images = images,
        _vehicleTypes = vehicleTypes,
        _services = services;

  factory _$ShopDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopDetailsImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String category;
  @override
  final double rating;
  @override
  final int reviewCount;
  @override
  final ShopLocation location;
  @override
  final String description;
  @override
  final String openHours;
  @override
  final String minBookingDuration;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<VehicleType> _vehicleTypes;
  @override
  List<VehicleType> get vehicleTypes {
    if (_vehicleTypes is EqualUnmodifiableListView) return _vehicleTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vehicleTypes);
  }

  final List<Service> _services;
  @override
  List<Service> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  @override
  String toString() {
    return 'ShopDetails(id: $id, name: $name, category: $category, rating: $rating, reviewCount: $reviewCount, location: $location, description: $description, openHours: $openHours, minBookingDuration: $minBookingDuration, images: $images, vehicleTypes: $vehicleTypes, services: $services)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.openHours, openHours) ||
                other.openHours == openHours) &&
            (identical(other.minBookingDuration, minBookingDuration) ||
                other.minBookingDuration == minBookingDuration) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality()
                .equals(other._vehicleTypes, _vehicleTypes) &&
            const DeepCollectionEquality().equals(other._services, _services));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      category,
      rating,
      reviewCount,
      location,
      description,
      openHours,
      minBookingDuration,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_vehicleTypes),
      const DeepCollectionEquality().hash(_services));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopDetailsImplCopyWith<_$ShopDetailsImpl> get copyWith =>
      __$$ShopDetailsImplCopyWithImpl<_$ShopDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShopDetailsImplToJson(
      this,
    );
  }
}

abstract class _ShopDetails implements ShopDetails {
  const factory _ShopDetails(
      {required final int id,
      required final String name,
      required final String category,
      required final double rating,
      required final int reviewCount,
      required final ShopLocation location,
      required final String description,
      required final String openHours,
      required final String minBookingDuration,
      required final List<String> images,
      required final List<VehicleType> vehicleTypes,
      required final List<Service> services}) = _$ShopDetailsImpl;

  factory _ShopDetails.fromJson(Map<String, dynamic> json) =
      _$ShopDetailsImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get category;
  @override
  double get rating;
  @override
  int get reviewCount;
  @override
  ShopLocation get location;
  @override
  String get description;
  @override
  String get openHours;
  @override
  String get minBookingDuration;
  @override
  List<String> get images;
  @override
  List<VehicleType> get vehicleTypes;
  @override
  List<Service> get services;
  @override
  @JsonKey(ignore: true)
  _$$ShopDetailsImplCopyWith<_$ShopDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShopLocation _$ShopLocationFromJson(Map<String, dynamic> json) {
  return _ShopLocation.fromJson(json);
}

/// @nodoc
mixin _$ShopLocation {
  String get area => throw _privateConstructorUsedError;
  double get distanceKm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopLocationCopyWith<ShopLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopLocationCopyWith<$Res> {
  factory $ShopLocationCopyWith(
          ShopLocation value, $Res Function(ShopLocation) then) =
      _$ShopLocationCopyWithImpl<$Res, ShopLocation>;
  @useResult
  $Res call({String area, double distanceKm});
}

/// @nodoc
class _$ShopLocationCopyWithImpl<$Res, $Val extends ShopLocation>
    implements $ShopLocationCopyWith<$Res> {
  _$ShopLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? area = null,
    Object? distanceKm = null,
  }) {
    return _then(_value.copyWith(
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      distanceKm: null == distanceKm
          ? _value.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShopLocationImplCopyWith<$Res>
    implements $ShopLocationCopyWith<$Res> {
  factory _$$ShopLocationImplCopyWith(
          _$ShopLocationImpl value, $Res Function(_$ShopLocationImpl) then) =
      __$$ShopLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String area, double distanceKm});
}

/// @nodoc
class __$$ShopLocationImplCopyWithImpl<$Res>
    extends _$ShopLocationCopyWithImpl<$Res, _$ShopLocationImpl>
    implements _$$ShopLocationImplCopyWith<$Res> {
  __$$ShopLocationImplCopyWithImpl(
      _$ShopLocationImpl _value, $Res Function(_$ShopLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? area = null,
    Object? distanceKm = null,
  }) {
    return _then(_$ShopLocationImpl(
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      distanceKm: null == distanceKm
          ? _value.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShopLocationImpl implements _ShopLocation {
  const _$ShopLocationImpl({required this.area, required this.distanceKm});

  factory _$ShopLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopLocationImplFromJson(json);

  @override
  final String area;
  @override
  final double distanceKm;

  @override
  String toString() {
    return 'ShopLocation(area: $area, distanceKm: $distanceKm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopLocationImpl &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, area, distanceKm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopLocationImplCopyWith<_$ShopLocationImpl> get copyWith =>
      __$$ShopLocationImplCopyWithImpl<_$ShopLocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShopLocationImplToJson(
      this,
    );
  }
}

abstract class _ShopLocation implements ShopLocation {
  const factory _ShopLocation(
      {required final String area,
      required final double distanceKm}) = _$ShopLocationImpl;

  factory _ShopLocation.fromJson(Map<String, dynamic> json) =
      _$ShopLocationImpl.fromJson;

  @override
  String get area;
  @override
  double get distanceKm;
  @override
  @JsonKey(ignore: true)
  _$$ShopLocationImplCopyWith<_$ShopLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VehicleType _$VehicleTypeFromJson(Map<String, dynamic> json) {
  return _VehicleType.fromJson(json);
}

/// @nodoc
mixin _$VehicleType {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleTypeCopyWith<VehicleType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleTypeCopyWith<$Res> {
  factory $VehicleTypeCopyWith(
          VehicleType value, $Res Function(VehicleType) then) =
      _$VehicleTypeCopyWithImpl<$Res, VehicleType>;
  @useResult
  $Res call({String id, String name, String icon});
}

/// @nodoc
class _$VehicleTypeCopyWithImpl<$Res, $Val extends VehicleType>
    implements $VehicleTypeCopyWith<$Res> {
  _$VehicleTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehicleTypeImplCopyWith<$Res>
    implements $VehicleTypeCopyWith<$Res> {
  factory _$$VehicleTypeImplCopyWith(
          _$VehicleTypeImpl value, $Res Function(_$VehicleTypeImpl) then) =
      __$$VehicleTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String icon});
}

/// @nodoc
class __$$VehicleTypeImplCopyWithImpl<$Res>
    extends _$VehicleTypeCopyWithImpl<$Res, _$VehicleTypeImpl>
    implements _$$VehicleTypeImplCopyWith<$Res> {
  __$$VehicleTypeImplCopyWithImpl(
      _$VehicleTypeImpl _value, $Res Function(_$VehicleTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = null,
  }) {
    return _then(_$VehicleTypeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleTypeImpl implements _VehicleType {
  const _$VehicleTypeImpl(
      {required this.id, required this.name, required this.icon});

  factory _$VehicleTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleTypeImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String icon;

  @override
  String toString() {
    return 'VehicleType(id: $id, name: $name, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleTypeImplCopyWith<_$VehicleTypeImpl> get copyWith =>
      __$$VehicleTypeImplCopyWithImpl<_$VehicleTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleTypeImplToJson(
      this,
    );
  }
}

abstract class _VehicleType implements VehicleType {
  const factory _VehicleType(
      {required final String id,
      required final String name,
      required final String icon}) = _$VehicleTypeImpl;

  factory _VehicleType.fromJson(Map<String, dynamic> json) =
      _$VehicleTypeImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get icon;
  @override
  @JsonKey(ignore: true)
  _$$VehicleTypeImplCopyWith<_$VehicleTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return _Service.fromJson(json);
}

/// @nodoc
mixin _$Service {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceCopyWith<Service> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceCopyWith<$Res> {
  factory $ServiceCopyWith(Service value, $Res Function(Service) then) =
      _$ServiceCopyWithImpl<$Res, Service>;
  @useResult
  $Res call({String id, String name, double price, bool isSelected});
}

/// @nodoc
class _$ServiceCopyWithImpl<$Res, $Val extends Service>
    implements $ServiceCopyWith<$Res> {
  _$ServiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceImplCopyWith<$Res> implements $ServiceCopyWith<$Res> {
  factory _$$ServiceImplCopyWith(
          _$ServiceImpl value, $Res Function(_$ServiceImpl) then) =
      __$$ServiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, double price, bool isSelected});
}

/// @nodoc
class __$$ServiceImplCopyWithImpl<$Res>
    extends _$ServiceCopyWithImpl<$Res, _$ServiceImpl>
    implements _$$ServiceImplCopyWith<$Res> {
  __$$ServiceImplCopyWithImpl(
      _$ServiceImpl _value, $Res Function(_$ServiceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? isSelected = null,
  }) {
    return _then(_$ServiceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceImpl implements _Service {
  const _$ServiceImpl(
      {required this.id,
      required this.name,
      required this.price,
      this.isSelected = false});

  factory _$ServiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double price;
  @override
  @JsonKey()
  final bool isSelected;

  @override
  String toString() {
    return 'Service(id: $id, name: $name, price: $price, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price, isSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceImplCopyWith<_$ServiceImpl> get copyWith =>
      __$$ServiceImplCopyWithImpl<_$ServiceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceImplToJson(
      this,
    );
  }
}

abstract class _Service implements Service {
  const factory _Service(
      {required final String id,
      required final String name,
      required final double price,
      final bool isSelected}) = _$ServiceImpl;

  factory _Service.fromJson(Map<String, dynamic> json) = _$ServiceImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get price;
  @override
  bool get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$ServiceImplCopyWith<_$ServiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
