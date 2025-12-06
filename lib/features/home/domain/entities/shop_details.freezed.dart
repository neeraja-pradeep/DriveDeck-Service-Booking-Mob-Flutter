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
  String get operatingDays => throw _privateConstructorUsedError;
  String get minBookingDuration => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  List<VehicleType> get vehicleTypes => throw _privateConstructorUsedError;
  List<Service> get services => throw _privateConstructorUsedError;
  List<Package> get packages => throw _privateConstructorUsedError;
  List<Accessory> get accessories => throw _privateConstructorUsedError;

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
      String operatingDays,
      String minBookingDuration,
      List<String> images,
      List<VehicleType> vehicleTypes,
      List<Service> services,
      List<Package> packages,
      List<Accessory> accessories});

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
    Object? operatingDays = null,
    Object? minBookingDuration = null,
    Object? images = null,
    Object? vehicleTypes = null,
    Object? services = null,
    Object? packages = null,
    Object? accessories = null,
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
      operatingDays: null == operatingDays
          ? _value.operatingDays
          : operatingDays // ignore: cast_nullable_to_non_nullable
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
      packages: null == packages
          ? _value.packages
          : packages // ignore: cast_nullable_to_non_nullable
              as List<Package>,
      accessories: null == accessories
          ? _value.accessories
          : accessories // ignore: cast_nullable_to_non_nullable
              as List<Accessory>,
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
      String operatingDays,
      String minBookingDuration,
      List<String> images,
      List<VehicleType> vehicleTypes,
      List<Service> services,
      List<Package> packages,
      List<Accessory> accessories});

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
    Object? operatingDays = null,
    Object? minBookingDuration = null,
    Object? images = null,
    Object? vehicleTypes = null,
    Object? services = null,
    Object? packages = null,
    Object? accessories = null,
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
      operatingDays: null == operatingDays
          ? _value.operatingDays
          : operatingDays // ignore: cast_nullable_to_non_nullable
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
      packages: null == packages
          ? _value._packages
          : packages // ignore: cast_nullable_to_non_nullable
              as List<Package>,
      accessories: null == accessories
          ? _value._accessories
          : accessories // ignore: cast_nullable_to_non_nullable
              as List<Accessory>,
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
      required this.operatingDays,
      required this.minBookingDuration,
      required final List<String> images,
      required final List<VehicleType> vehicleTypes,
      required final List<Service> services,
      final List<Package> packages = const [],
      final List<Accessory> accessories = const []})
      : _images = images,
        _vehicleTypes = vehicleTypes,
        _services = services,
        _packages = packages,
        _accessories = accessories;

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
  final String operatingDays;
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

  final List<Package> _packages;
  @override
  @JsonKey()
  List<Package> get packages {
    if (_packages is EqualUnmodifiableListView) return _packages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_packages);
  }

  final List<Accessory> _accessories;
  @override
  @JsonKey()
  List<Accessory> get accessories {
    if (_accessories is EqualUnmodifiableListView) return _accessories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accessories);
  }

  @override
  String toString() {
    return 'ShopDetails(id: $id, name: $name, category: $category, rating: $rating, reviewCount: $reviewCount, location: $location, description: $description, openHours: $openHours, operatingDays: $operatingDays, minBookingDuration: $minBookingDuration, images: $images, vehicleTypes: $vehicleTypes, services: $services, packages: $packages, accessories: $accessories)';
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
            (identical(other.operatingDays, operatingDays) ||
                other.operatingDays == operatingDays) &&
            (identical(other.minBookingDuration, minBookingDuration) ||
                other.minBookingDuration == minBookingDuration) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality()
                .equals(other._vehicleTypes, _vehicleTypes) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            const DeepCollectionEquality().equals(other._packages, _packages) &&
            const DeepCollectionEquality()
                .equals(other._accessories, _accessories));
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
      operatingDays,
      minBookingDuration,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_vehicleTypes),
      const DeepCollectionEquality().hash(_services),
      const DeepCollectionEquality().hash(_packages),
      const DeepCollectionEquality().hash(_accessories));

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
      required final String operatingDays,
      required final String minBookingDuration,
      required final List<String> images,
      required final List<VehicleType> vehicleTypes,
      required final List<Service> services,
      final List<Package> packages,
      final List<Accessory> accessories}) = _$ShopDetailsImpl;

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
  String get operatingDays;
  @override
  String get minBookingDuration;
  @override
  List<String> get images;
  @override
  List<VehicleType> get vehicleTypes;
  @override
  List<Service> get services;
  @override
  List<Package> get packages;
  @override
  List<Accessory> get accessories;
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

Package _$PackageFromJson(Map<String, dynamic> json) {
  return _Package.fromJson(json);
}

/// @nodoc
mixin _$Package {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  List<String> get includedServices => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PackageCopyWith<Package> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageCopyWith<$Res> {
  factory $PackageCopyWith(Package value, $Res Function(Package) then) =
      _$PackageCopyWithImpl<$Res, Package>;
  @useResult
  $Res call(
      {String id,
      String name,
      double price,
      List<String> includedServices,
      bool isSelected});
}

/// @nodoc
class _$PackageCopyWithImpl<$Res, $Val extends Package>
    implements $PackageCopyWith<$Res> {
  _$PackageCopyWithImpl(this._value, this._then);

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
    Object? includedServices = null,
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
      includedServices: null == includedServices
          ? _value.includedServices
          : includedServices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PackageImplCopyWith<$Res> implements $PackageCopyWith<$Res> {
  factory _$$PackageImplCopyWith(
          _$PackageImpl value, $Res Function(_$PackageImpl) then) =
      __$$PackageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      double price,
      List<String> includedServices,
      bool isSelected});
}

/// @nodoc
class __$$PackageImplCopyWithImpl<$Res>
    extends _$PackageCopyWithImpl<$Res, _$PackageImpl>
    implements _$$PackageImplCopyWith<$Res> {
  __$$PackageImplCopyWithImpl(
      _$PackageImpl _value, $Res Function(_$PackageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? includedServices = null,
    Object? isSelected = null,
  }) {
    return _then(_$PackageImpl(
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
      includedServices: null == includedServices
          ? _value._includedServices
          : includedServices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PackageImpl implements _Package {
  const _$PackageImpl(
      {required this.id,
      required this.name,
      required this.price,
      required final List<String> includedServices,
      this.isSelected = false})
      : _includedServices = includedServices;

  factory _$PackageImpl.fromJson(Map<String, dynamic> json) =>
      _$$PackageImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double price;
  final List<String> _includedServices;
  @override
  List<String> get includedServices {
    if (_includedServices is EqualUnmodifiableListView)
      return _includedServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_includedServices);
  }

  @override
  @JsonKey()
  final bool isSelected;

  @override
  String toString() {
    return 'Package(id: $id, name: $name, price: $price, includedServices: $includedServices, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality()
                .equals(other._includedServices, _includedServices) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price,
      const DeepCollectionEquality().hash(_includedServices), isSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PackageImplCopyWith<_$PackageImpl> get copyWith =>
      __$$PackageImplCopyWithImpl<_$PackageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PackageImplToJson(
      this,
    );
  }
}

abstract class _Package implements Package {
  const factory _Package(
      {required final String id,
      required final String name,
      required final double price,
      required final List<String> includedServices,
      final bool isSelected}) = _$PackageImpl;

  factory _Package.fromJson(Map<String, dynamic> json) = _$PackageImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get price;
  @override
  List<String> get includedServices;
  @override
  bool get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$PackageImplCopyWith<_$PackageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Accessory _$AccessoryFromJson(Map<String, dynamic> json) {
  return _Accessory.fromJson(json);
}

/// @nodoc
mixin _$Accessory {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccessoryCopyWith<Accessory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccessoryCopyWith<$Res> {
  factory $AccessoryCopyWith(Accessory value, $Res Function(Accessory) then) =
      _$AccessoryCopyWithImpl<$Res, Accessory>;
  @useResult
  $Res call(
      {String id,
      String name,
      double price,
      String? description,
      bool isSelected});
}

/// @nodoc
class _$AccessoryCopyWithImpl<$Res, $Val extends Accessory>
    implements $AccessoryCopyWith<$Res> {
  _$AccessoryCopyWithImpl(this._value, this._then);

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
    Object? description = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccessoryImplCopyWith<$Res>
    implements $AccessoryCopyWith<$Res> {
  factory _$$AccessoryImplCopyWith(
          _$AccessoryImpl value, $Res Function(_$AccessoryImpl) then) =
      __$$AccessoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      double price,
      String? description,
      bool isSelected});
}

/// @nodoc
class __$$AccessoryImplCopyWithImpl<$Res>
    extends _$AccessoryCopyWithImpl<$Res, _$AccessoryImpl>
    implements _$$AccessoryImplCopyWith<$Res> {
  __$$AccessoryImplCopyWithImpl(
      _$AccessoryImpl _value, $Res Function(_$AccessoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? description = freezed,
    Object? isSelected = null,
  }) {
    return _then(_$AccessoryImpl(
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccessoryImpl implements _Accessory {
  const _$AccessoryImpl(
      {required this.id,
      required this.name,
      required this.price,
      this.description,
      this.isSelected = false});

  factory _$AccessoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccessoryImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double price;
  @override
  final String? description;
  @override
  @JsonKey()
  final bool isSelected;

  @override
  String toString() {
    return 'Accessory(id: $id, name: $name, price: $price, description: $description, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccessoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, price, description, isSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccessoryImplCopyWith<_$AccessoryImpl> get copyWith =>
      __$$AccessoryImplCopyWithImpl<_$AccessoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccessoryImplToJson(
      this,
    );
  }
}

abstract class _Accessory implements Accessory {
  const factory _Accessory(
      {required final String id,
      required final String name,
      required final double price,
      final String? description,
      final bool isSelected}) = _$AccessoryImpl;

  factory _Accessory.fromJson(Map<String, dynamic> json) =
      _$AccessoryImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get price;
  @override
  String? get description;
  @override
  bool get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$AccessoryImplCopyWith<_$AccessoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
