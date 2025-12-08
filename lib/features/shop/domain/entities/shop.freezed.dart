// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Shop _$ShopFromJson(Map<String, dynamic> json) {
  return _Shop.fromJson(json);
}

/// @nodoc
mixin _$Shop {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get reviewCount => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get area => throw _privateConstructorUsedError;
  double get distanceKm => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get openHours => throw _privateConstructorUsedError;
  String get operatingDays => throw _privateConstructorUsedError;
  String get minBookingDuration => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  List<ShopVehicleType> get vehicleTypes => throw _privateConstructorUsedError;
  List<ShopService> get services => throw _privateConstructorUsedError;
  List<ShopPackage> get packages => throw _privateConstructorUsedError;
  List<ShopAccessory> get accessories => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopCopyWith<Shop> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopCopyWith<$Res> {
  factory $ShopCopyWith(Shop value, $Res Function(Shop) then) =
      _$ShopCopyWithImpl<$Res, Shop>;
  @useResult
  $Res call({
    int id,
    String name,
    String category,
    double rating,
    int reviewCount,
    String address,
    String area,
    double distanceKm,
    String description,
    String openHours,
    String operatingDays,
    String minBookingDuration,
    List<String> images,
    List<ShopVehicleType> vehicleTypes,
    List<ShopService> services,
    List<ShopPackage> packages,
    List<ShopAccessory> accessories,
    bool isFavorite,
    String? phoneNumber,
    double? latitude,
    double? longitude,
  });
}

/// @nodoc
class _$ShopCopyWithImpl<$Res, $Val extends Shop>
    implements $ShopCopyWith<$Res> {
  _$ShopCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? address = null,
    Object? area = null,
    Object? distanceKm = null,
    Object? description = null,
    Object? openHours = null,
    Object? operatingDays = null,
    Object? minBookingDuration = null,
    Object? images = null,
    Object? vehicleTypes = null,
    Object? services = null,
    Object? packages = null,
    Object? accessories = null,
    Object? isFavorite = null,
    Object? phoneNumber = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id ? _value.id : id as int,
      name: null == name ? _value.name : name as String,
      category: null == category ? _value.category : category as String,
      rating: null == rating ? _value.rating : rating as double,
      reviewCount: null == reviewCount ? _value.reviewCount : reviewCount as int,
      address: null == address ? _value.address : address as String,
      area: null == area ? _value.area : area as String,
      distanceKm: null == distanceKm ? _value.distanceKm : distanceKm as double,
      description: null == description ? _value.description : description as String,
      openHours: null == openHours ? _value.openHours : openHours as String,
      operatingDays: null == operatingDays ? _value.operatingDays : operatingDays as String,
      minBookingDuration: null == minBookingDuration ? _value.minBookingDuration : minBookingDuration as String,
      images: null == images ? _value.images : images as List<String>,
      vehicleTypes: null == vehicleTypes ? _value.vehicleTypes : vehicleTypes as List<ShopVehicleType>,
      services: null == services ? _value.services : services as List<ShopService>,
      packages: null == packages ? _value.packages : packages as List<ShopPackage>,
      accessories: null == accessories ? _value.accessories : accessories as List<ShopAccessory>,
      isFavorite: null == isFavorite ? _value.isFavorite : isFavorite as bool,
      phoneNumber: freezed == phoneNumber ? _value.phoneNumber : phoneNumber as String?,
      latitude: freezed == latitude ? _value.latitude : latitude as double?,
      longitude: freezed == longitude ? _value.longitude : longitude as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShopImplCopyWith<$Res> implements $ShopCopyWith<$Res> {
  factory _$$ShopImplCopyWith(
          _$ShopImpl value, $Res Function(_$ShopImpl) then) =
      __$$ShopImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String category,
    double rating,
    int reviewCount,
    String address,
    String area,
    double distanceKm,
    String description,
    String openHours,
    String operatingDays,
    String minBookingDuration,
    List<String> images,
    List<ShopVehicleType> vehicleTypes,
    List<ShopService> services,
    List<ShopPackage> packages,
    List<ShopAccessory> accessories,
    bool isFavorite,
    String? phoneNumber,
    double? latitude,
    double? longitude,
  });
}

/// @nodoc
class __$$ShopImplCopyWithImpl<$Res>
    extends _$ShopCopyWithImpl<$Res, _$ShopImpl>
    implements _$$ShopImplCopyWith<$Res> {
  __$$ShopImplCopyWithImpl(_$ShopImpl _value, $Res Function(_$ShopImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? address = null,
    Object? area = null,
    Object? distanceKm = null,
    Object? description = null,
    Object? openHours = null,
    Object? operatingDays = null,
    Object? minBookingDuration = null,
    Object? images = null,
    Object? vehicleTypes = null,
    Object? services = null,
    Object? packages = null,
    Object? accessories = null,
    Object? isFavorite = null,
    Object? phoneNumber = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$ShopImpl(
      id: null == id ? _value.id : id as int,
      name: null == name ? _value.name : name as String,
      category: null == category ? _value.category : category as String,
      rating: null == rating ? _value.rating : rating as double,
      reviewCount: null == reviewCount ? _value.reviewCount : reviewCount as int,
      address: null == address ? _value.address : address as String,
      area: null == area ? _value.area : area as String,
      distanceKm: null == distanceKm ? _value.distanceKm : distanceKm as double,
      description: null == description ? _value.description : description as String,
      openHours: null == openHours ? _value.openHours : openHours as String,
      operatingDays: null == operatingDays ? _value.operatingDays : operatingDays as String,
      minBookingDuration: null == minBookingDuration ? _value.minBookingDuration : minBookingDuration as String,
      images: null == images ? _value._images : images as List<String>,
      vehicleTypes: null == vehicleTypes ? _value._vehicleTypes : vehicleTypes as List<ShopVehicleType>,
      services: null == services ? _value._services : services as List<ShopService>,
      packages: null == packages ? _value._packages : packages as List<ShopPackage>,
      accessories: null == accessories ? _value._accessories : accessories as List<ShopAccessory>,
      isFavorite: null == isFavorite ? _value.isFavorite : isFavorite as bool,
      phoneNumber: freezed == phoneNumber ? _value.phoneNumber : phoneNumber as String?,
      latitude: freezed == latitude ? _value.latitude : latitude as double?,
      longitude: freezed == longitude ? _value.longitude : longitude as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShopImpl implements _Shop {
  const _$ShopImpl({
    required this.id,
    required this.name,
    required this.category,
    required this.rating,
    required this.reviewCount,
    required this.address,
    required this.area,
    required this.distanceKm,
    required this.description,
    required this.openHours,
    required this.operatingDays,
    required this.minBookingDuration,
    required final List<String> images,
    required final List<ShopVehicleType> vehicleTypes,
    required final List<ShopService> services,
    final List<ShopPackage> packages = const [],
    final List<ShopAccessory> accessories = const [],
    this.isFavorite = false,
    this.phoneNumber,
    this.latitude,
    this.longitude,
  })  : _images = images,
        _vehicleTypes = vehicleTypes,
        _services = services,
        _packages = packages,
        _accessories = accessories;

  factory _$ShopImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopImplFromJson(json);

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
  final String address;
  @override
  final String area;
  @override
  final double distanceKm;
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
  List<String> get images => List.unmodifiable(_images);
  final List<ShopVehicleType> _vehicleTypes;
  @override
  List<ShopVehicleType> get vehicleTypes => List.unmodifiable(_vehicleTypes);
  final List<ShopService> _services;
  @override
  List<ShopService> get services => List.unmodifiable(_services);
  final List<ShopPackage> _packages;
  @override
  @JsonKey()
  List<ShopPackage> get packages => List.unmodifiable(_packages);
  final List<ShopAccessory> _accessories;
  @override
  @JsonKey()
  List<ShopAccessory> get accessories => List.unmodifiable(_accessories);
  @override
  @JsonKey()
  final bool isFavorite;
  @override
  final String? phoneNumber;
  @override
  final double? latitude;
  @override
  final double? longitude;

  @override
  String toString() {
    return 'Shop(id: $id, name: $name, category: $category, rating: $rating, reviewCount: $reviewCount, address: $address, area: $area, distanceKm: $distanceKm, description: $description, openHours: $openHours, operatingDays: $operatingDays, minBookingDuration: $minBookingDuration, images: $images, vehicleTypes: $vehicleTypes, services: $services, packages: $packages, accessories: $accessories, isFavorite: $isFavorite, phoneNumber: $phoneNumber, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) || other.category == category) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm) &&
            (identical(other.description, description) || other.description == description) &&
            (identical(other.openHours, openHours) || other.openHours == openHours) &&
            (identical(other.operatingDays, operatingDays) || other.operatingDays == operatingDays) &&
            (identical(other.minBookingDuration, minBookingDuration) || other.minBookingDuration == minBookingDuration) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._vehicleTypes, _vehicleTypes) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            const DeepCollectionEquality().equals(other._packages, _packages) &&
            const DeepCollectionEquality().equals(other._accessories, _accessories) &&
            (identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite) &&
            (identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber) &&
            (identical(other.latitude, latitude) || other.latitude == latitude) &&
            (identical(other.longitude, longitude) || other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        category,
        rating,
        reviewCount,
        address,
        area,
        distanceKm,
        description,
        openHours,
        operatingDays,
        minBookingDuration,
        const DeepCollectionEquality().hash(_images),
        const DeepCollectionEquality().hash(_vehicleTypes),
        const DeepCollectionEquality().hash(_services),
        const DeepCollectionEquality().hash(_packages),
        const DeepCollectionEquality().hash(_accessories),
        isFavorite,
        phoneNumber,
        latitude,
        longitude,
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopImplCopyWith<_$ShopImpl> get copyWith =>
      __$$ShopImplCopyWithImpl<_$ShopImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShopImplToJson(this);
  }
}

abstract class _Shop implements Shop {
  const factory _Shop({
    required final int id,
    required final String name,
    required final String category,
    required final double rating,
    required final int reviewCount,
    required final String address,
    required final String area,
    required final double distanceKm,
    required final String description,
    required final String openHours,
    required final String operatingDays,
    required final String minBookingDuration,
    required final List<String> images,
    required final List<ShopVehicleType> vehicleTypes,
    required final List<ShopService> services,
    final List<ShopPackage> packages,
    final List<ShopAccessory> accessories,
    final bool isFavorite,
    final String? phoneNumber,
    final double? latitude,
    final double? longitude,
  }) = _$ShopImpl;

  factory _Shop.fromJson(Map<String, dynamic> json) = _$ShopImpl.fromJson;

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
  String get address;
  @override
  String get area;
  @override
  double get distanceKm;
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
  List<ShopVehicleType> get vehicleTypes;
  @override
  List<ShopService> get services;
  @override
  List<ShopPackage> get packages;
  @override
  List<ShopAccessory> get accessories;
  @override
  bool get isFavorite;
  @override
  String? get phoneNumber;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  @JsonKey(ignore: true)
  _$$ShopImplCopyWith<_$ShopImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// Simplified freezed implementations for other entities
// These would normally be generated but are provided as stubs

/// @nodoc
mixin _$ShopVehicleType {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  double? get priceMultiplier => throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  $ShopVehicleTypeCopyWith<ShopVehicleType> get copyWith =>
      throw _privateConstructorUsedError;
}

abstract class $ShopVehicleTypeCopyWith<$Res> {
  factory $ShopVehicleTypeCopyWith(
          ShopVehicleType value, $Res Function(ShopVehicleType) then) =
      _$ShopVehicleTypeCopyWithImpl<$Res, ShopVehicleType>;
  $Res call({String id, String name, String? icon, double? priceMultiplier});
}

class _$ShopVehicleTypeCopyWithImpl<$Res, $Val extends ShopVehicleType>
    implements $ShopVehicleTypeCopyWith<$Res> {
  _$ShopVehicleTypeCopyWithImpl(this._value, this._then);
  final $Val _value;
  final $Res Function($Val) _then;

  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = freezed,
    Object? priceMultiplier = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id ? _value.id : id as String,
      name: null == name ? _value.name : name as String,
      icon: freezed == icon ? _value.icon : icon as String?,
      priceMultiplier: freezed == priceMultiplier ? _value.priceMultiplier : priceMultiplier as double?,
    ) as $Val);
  }
}

@JsonSerializable()
class _$ShopVehicleTypeImpl implements _ShopVehicleType {
  const _$ShopVehicleTypeImpl({
    required this.id,
    required this.name,
    this.icon,
    this.priceMultiplier,
  });

  factory _$ShopVehicleTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopVehicleTypeImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? icon;
  @override
  final double? priceMultiplier;

  @override
  Map<String, dynamic> toJson() => _$$ShopVehicleTypeImplToJson(this);

  @override
  $ShopVehicleTypeCopyWith<ShopVehicleType> get copyWith =>
      _$ShopVehicleTypeCopyWithImpl<ShopVehicleType>(this, (v) => v as ShopVehicleType);
}

abstract class _ShopVehicleType implements ShopVehicleType {
  const factory _ShopVehicleType({
    required final String id,
    required final String name,
    final String? icon,
    final double? priceMultiplier,
  }) = _$ShopVehicleTypeImpl;
  factory _ShopVehicleType.fromJson(Map<String, dynamic> json) =
      _$ShopVehicleTypeImpl.fromJson;
}

// Similar simplified implementations for ShopService, ShopPackage, ShopAccessory, etc.
// In production, run `flutter pub run build_runner build` to generate these properly

/// @nodoc
mixin _$ShopService {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get durationMinutes => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  bool get isPopular => throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

@JsonSerializable()
class _$ShopServiceImpl implements _ShopService {
  const _$ShopServiceImpl({
    required this.id,
    required this.name,
    required this.price,
    this.description,
    this.durationMinutes,
    this.categoryId,
    this.isPopular = false,
  });

  factory _$ShopServiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopServiceImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double price;
  @override
  final String? description;
  @override
  final int? durationMinutes;
  @override
  final String? categoryId;
  @override
  final bool isPopular;

  @override
  Map<String, dynamic> toJson() => _$$ShopServiceImplToJson(this);
}

abstract class _ShopService implements ShopService {
  const factory _ShopService({
    required final String id,
    required final String name,
    required final double price,
    final String? description,
    final int? durationMinutes,
    final String? categoryId,
    final bool isPopular,
  }) = _$ShopServiceImpl;
  factory _ShopService.fromJson(Map<String, dynamic> json) =
      _$ShopServiceImpl.fromJson;
}

/// @nodoc
mixin _$ShopPackage {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  List<String> get includedServiceIds => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get discountPercentage => throw _privateConstructorUsedError;
  bool get isPopular => throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

@JsonSerializable()
class _$ShopPackageImpl implements _ShopPackage {
  const _$ShopPackageImpl({
    required this.id,
    required this.name,
    required this.price,
    required final List<String> includedServiceIds,
    this.description,
    this.discountPercentage,
    this.isPopular = false,
  }) : _includedServiceIds = includedServiceIds;

  factory _$ShopPackageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopPackageImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double price;
  final List<String> _includedServiceIds;
  @override
  List<String> get includedServiceIds => List.unmodifiable(_includedServiceIds);
  @override
  final String? description;
  @override
  final double? discountPercentage;
  @override
  final bool isPopular;

  @override
  Map<String, dynamic> toJson() => _$$ShopPackageImplToJson(this);
}

abstract class _ShopPackage implements ShopPackage {
  const factory _ShopPackage({
    required final String id,
    required final String name,
    required final double price,
    required final List<String> includedServiceIds,
    final String? description,
    final double? discountPercentage,
    final bool isPopular,
  }) = _$ShopPackageImpl;
  factory _ShopPackage.fromJson(Map<String, dynamic> json) =
      _$ShopPackageImpl.fromJson;
}

/// @nodoc
mixin _$ShopAccessory {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  bool get inStock => throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

@JsonSerializable()
class _$ShopAccessoryImpl implements _ShopAccessory {
  const _$ShopAccessoryImpl({
    required this.id,
    required this.name,
    required this.price,
    this.description,
    this.imageUrl,
    this.inStock = true,
  });

  factory _$ShopAccessoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopAccessoryImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double price;
  @override
  final String? description;
  @override
  final String? imageUrl;
  @override
  final bool inStock;

  @override
  Map<String, dynamic> toJson() => _$$ShopAccessoryImplToJson(this);
}

abstract class _ShopAccessory implements ShopAccessory {
  const factory _ShopAccessory({
    required final String id,
    required final String name,
    required final double price,
    final String? description,
    final String? imageUrl,
    final bool inStock,
  }) = _$ShopAccessoryImpl;
  factory _ShopAccessory.fromJson(Map<String, dynamic> json) =
      _$ShopAccessoryImpl.fromJson;
}

/// @nodoc
mixin _$ShopTimeSlot {
  int get slotNumber => throw _privateConstructorUsedError;
  String get startTime => throw _privateConstructorUsedError;
  String get endTime => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  int? get availableCapacity => throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

@JsonSerializable()
class _$ShopTimeSlotImpl implements _ShopTimeSlot {
  const _$ShopTimeSlotImpl({
    required this.slotNumber,
    required this.startTime,
    required this.endTime,
    required this.isAvailable,
    this.availableCapacity,
  });

  factory _$ShopTimeSlotImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopTimeSlotImplFromJson(json);

  @override
  final int slotNumber;
  @override
  final String startTime;
  @override
  final String endTime;
  @override
  final bool isAvailable;
  @override
  final int? availableCapacity;

  @override
  Map<String, dynamic> toJson() => _$$ShopTimeSlotImplToJson(this);
}

abstract class _ShopTimeSlot implements ShopTimeSlot {
  const factory _ShopTimeSlot({
    required final int slotNumber,
    required final String startTime,
    required final String endTime,
    required final bool isAvailable,
    final int? availableCapacity,
  }) = _$ShopTimeSlotImpl;
  factory _ShopTimeSlot.fromJson(Map<String, dynamic> json) =
      _$ShopTimeSlotImpl.fromJson;
}

/// @nodoc
mixin _$ShopDateAvailability {
  DateTime get date => throw _privateConstructorUsedError;
  List<ShopTimeSlot> get slots => throw _privateConstructorUsedError;
  bool get isOpen => throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

@JsonSerializable()
class _$ShopDateAvailabilityImpl implements _ShopDateAvailability {
  const _$ShopDateAvailabilityImpl({
    required this.date,
    required final List<ShopTimeSlot> slots,
    this.isOpen = true,
  }) : _slots = slots;

  factory _$ShopDateAvailabilityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopDateAvailabilityImplFromJson(json);

  @override
  final DateTime date;
  final List<ShopTimeSlot> _slots;
  @override
  List<ShopTimeSlot> get slots => List.unmodifiable(_slots);
  @override
  final bool isOpen;

  @override
  Map<String, dynamic> toJson() => _$$ShopDateAvailabilityImplToJson(this);
}

abstract class _ShopDateAvailability implements ShopDateAvailability {
  const factory _ShopDateAvailability({
    required final DateTime date,
    required final List<ShopTimeSlot> slots,
    final bool isOpen,
  }) = _$ShopDateAvailabilityImpl;
  factory _ShopDateAvailability.fromJson(Map<String, dynamic> json) =
      _$ShopDateAvailabilityImpl.fromJson;
}
