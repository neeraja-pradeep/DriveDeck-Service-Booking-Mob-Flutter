// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_wash_shop_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CarWashShopModel _$CarWashShopModelFromJson(Map<String, dynamic> json) {
  return _CarWashShopModel.fromJson(json);
}

/// @nodoc
mixin _$CarWashShopModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'cover_image')
  String? get image => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get address => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get phone => throw _privateConstructorUsedError;
  @HiveField(6)
  double? get latitude => throw _privateConstructorUsedError;
  @HiveField(7)
  double? get longitude => throw _privateConstructorUsedError;
  @HiveField(8)
  double? get rating => throw _privateConstructorUsedError;
  @HiveField(9)
  @JsonKey(name: 'review_count')
  int? get reviewCount => throw _privateConstructorUsedError;
  @HiveField(10)
  @JsonKey(name: 'distance_km')
  double? get distance => throw _privateConstructorUsedError;
  @HiveField(11)
  @JsonKey(name: 'opening_time')
  String? get openingTime => throw _privateConstructorUsedError;
  @HiveField(12)
  @JsonKey(name: 'closing_time')
  String? get closingTime => throw _privateConstructorUsedError;
  @HiveField(13)
  @JsonKey(name: 'is_open')
  bool get isOpen => throw _privateConstructorUsedError;
  @HiveField(14)
  @JsonKey(name: 'is_wishlisted')
  bool get isWishlisted => throw _privateConstructorUsedError;
  @HiveField(15)
  List<String>? get services => throw _privateConstructorUsedError;
  @HiveField(16)
  @JsonKey(name: 'price_range')
  String? get priceRange => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CarWashShopModelCopyWith<CarWashShopModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarWashShopModelCopyWith<$Res> {
  factory $CarWashShopModelCopyWith(
          CarWashShopModel value, $Res Function(CarWashShopModel) then) =
      _$CarWashShopModelCopyWithImpl<$Res, CarWashShopModel>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(2) String? description,
      @HiveField(3) @JsonKey(name: 'cover_image') String? image,
      @HiveField(4) String? address,
      @HiveField(5) String? phone,
      @HiveField(6) double? latitude,
      @HiveField(7) double? longitude,
      @HiveField(8) double? rating,
      @HiveField(9) @JsonKey(name: 'review_count') int? reviewCount,
      @HiveField(10) @JsonKey(name: 'distance_km') double? distance,
      @HiveField(11) @JsonKey(name: 'opening_time') String? openingTime,
      @HiveField(12) @JsonKey(name: 'closing_time') String? closingTime,
      @HiveField(13) @JsonKey(name: 'is_open') bool isOpen,
      @HiveField(14) @JsonKey(name: 'is_wishlisted') bool isWishlisted,
      @HiveField(15) List<String>? services,
      @HiveField(16) @JsonKey(name: 'price_range') String? priceRange});
}

/// @nodoc
class _$CarWashShopModelCopyWithImpl<$Res, $Val extends CarWashShopModel>
    implements $CarWashShopModelCopyWith<$Res> {
  _$CarWashShopModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? image = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? rating = freezed,
    Object? reviewCount = freezed,
    Object? distance = freezed,
    Object? openingTime = freezed,
    Object? closingTime = freezed,
    Object? isOpen = null,
    Object? isWishlisted = null,
    Object? services = freezed,
    Object? priceRange = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      reviewCount: freezed == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      openingTime: freezed == openingTime
          ? _value.openingTime
          : openingTime // ignore: cast_nullable_to_non_nullable
              as String?,
      closingTime: freezed == closingTime
          ? _value.closingTime
          : closingTime // ignore: cast_nullable_to_non_nullable
              as String?,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isWishlisted: null == isWishlisted
          ? _value.isWishlisted
          : isWishlisted // ignore: cast_nullable_to_non_nullable
              as bool,
      services: freezed == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      priceRange: freezed == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarWashShopModelImplCopyWith<$Res>
    implements $CarWashShopModelCopyWith<$Res> {
  factory _$$CarWashShopModelImplCopyWith(_$CarWashShopModelImpl value,
          $Res Function(_$CarWashShopModelImpl) then) =
      __$$CarWashShopModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(2) String? description,
      @HiveField(3) @JsonKey(name: 'cover_image') String? image,
      @HiveField(4) String? address,
      @HiveField(5) String? phone,
      @HiveField(6) double? latitude,
      @HiveField(7) double? longitude,
      @HiveField(8) double? rating,
      @HiveField(9) @JsonKey(name: 'review_count') int? reviewCount,
      @HiveField(10) @JsonKey(name: 'distance_km') double? distance,
      @HiveField(11) @JsonKey(name: 'opening_time') String? openingTime,
      @HiveField(12) @JsonKey(name: 'closing_time') String? closingTime,
      @HiveField(13) @JsonKey(name: 'is_open') bool isOpen,
      @HiveField(14) @JsonKey(name: 'is_wishlisted') bool isWishlisted,
      @HiveField(15) List<String>? services,
      @HiveField(16) @JsonKey(name: 'price_range') String? priceRange});
}

/// @nodoc
class __$$CarWashShopModelImplCopyWithImpl<$Res>
    extends _$CarWashShopModelCopyWithImpl<$Res, _$CarWashShopModelImpl>
    implements _$$CarWashShopModelImplCopyWith<$Res> {
  __$$CarWashShopModelImplCopyWithImpl(_$CarWashShopModelImpl _value,
      $Res Function(_$CarWashShopModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? image = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? rating = freezed,
    Object? reviewCount = freezed,
    Object? distance = freezed,
    Object? openingTime = freezed,
    Object? closingTime = freezed,
    Object? isOpen = null,
    Object? isWishlisted = null,
    Object? services = freezed,
    Object? priceRange = freezed,
  }) {
    return _then(_$CarWashShopModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      reviewCount: freezed == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      openingTime: freezed == openingTime
          ? _value.openingTime
          : openingTime // ignore: cast_nullable_to_non_nullable
              as String?,
      closingTime: freezed == closingTime
          ? _value.closingTime
          : closingTime // ignore: cast_nullable_to_non_nullable
              as String?,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isWishlisted: null == isWishlisted
          ? _value.isWishlisted
          : isWishlisted // ignore: cast_nullable_to_non_nullable
              as bool,
      services: freezed == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      priceRange: freezed == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarWashShopModelImpl extends _CarWashShopModel {
  const _$CarWashShopModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) this.description,
      @HiveField(3) @JsonKey(name: 'cover_image') this.image,
      @HiveField(4) this.address,
      @HiveField(5) this.phone,
      @HiveField(6) this.latitude,
      @HiveField(7) this.longitude,
      @HiveField(8) this.rating,
      @HiveField(9) @JsonKey(name: 'review_count') this.reviewCount,
      @HiveField(10) @JsonKey(name: 'distance_km') this.distance,
      @HiveField(11) @JsonKey(name: 'opening_time') this.openingTime,
      @HiveField(12) @JsonKey(name: 'closing_time') this.closingTime,
      @HiveField(13) @JsonKey(name: 'is_open') this.isOpen = false,
      @HiveField(14) @JsonKey(name: 'is_wishlisted') this.isWishlisted = false,
      @HiveField(15) final List<String>? services,
      @HiveField(16) @JsonKey(name: 'price_range') this.priceRange})
      : _services = services,
        super._();

  factory _$CarWashShopModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarWashShopModelImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String? description;
  @override
  @HiveField(3)
  @JsonKey(name: 'cover_image')
  final String? image;
  @override
  @HiveField(4)
  final String? address;
  @override
  @HiveField(5)
  final String? phone;
  @override
  @HiveField(6)
  final double? latitude;
  @override
  @HiveField(7)
  final double? longitude;
  @override
  @HiveField(8)
  final double? rating;
  @override
  @HiveField(9)
  @JsonKey(name: 'review_count')
  final int? reviewCount;
  @override
  @HiveField(10)
  @JsonKey(name: 'distance_km')
  final double? distance;
  @override
  @HiveField(11)
  @JsonKey(name: 'opening_time')
  final String? openingTime;
  @override
  @HiveField(12)
  @JsonKey(name: 'closing_time')
  final String? closingTime;
  @override
  @HiveField(13)
  @JsonKey(name: 'is_open')
  final bool isOpen;
  @override
  @HiveField(14)
  @JsonKey(name: 'is_wishlisted')
  final bool isWishlisted;
  final List<String>? _services;
  @override
  @HiveField(15)
  List<String>? get services {
    final value = _services;
    if (value == null) return null;
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(16)
  @JsonKey(name: 'price_range')
  final String? priceRange;

  @override
  String toString() {
    return 'CarWashShopModel(id: $id, name: $name, description: $description, image: $image, address: $address, phone: $phone, latitude: $latitude, longitude: $longitude, rating: $rating, reviewCount: $reviewCount, distance: $distance, openingTime: $openingTime, closingTime: $closingTime, isOpen: $isOpen, isWishlisted: $isWishlisted, services: $services, priceRange: $priceRange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarWashShopModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.openingTime, openingTime) ||
                other.openingTime == openingTime) &&
            (identical(other.closingTime, closingTime) ||
                other.closingTime == closingTime) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.isWishlisted, isWishlisted) ||
                other.isWishlisted == isWishlisted) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            (identical(other.priceRange, priceRange) ||
                other.priceRange == priceRange));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      image,
      address,
      phone,
      latitude,
      longitude,
      rating,
      reviewCount,
      distance,
      openingTime,
      closingTime,
      isOpen,
      isWishlisted,
      const DeepCollectionEquality().hash(_services),
      priceRange);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CarWashShopModelImplCopyWith<_$CarWashShopModelImpl> get copyWith =>
      __$$CarWashShopModelImplCopyWithImpl<_$CarWashShopModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarWashShopModelImplToJson(
      this,
    );
  }
}

abstract class _CarWashShopModel extends CarWashShopModel {
  const factory _CarWashShopModel(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String name,
      @HiveField(2) final String? description,
      @HiveField(3) @JsonKey(name: 'cover_image') final String? image,
      @HiveField(4) final String? address,
      @HiveField(5) final String? phone,
      @HiveField(6) final double? latitude,
      @HiveField(7) final double? longitude,
      @HiveField(8) final double? rating,
      @HiveField(9) @JsonKey(name: 'review_count') final int? reviewCount,
      @HiveField(10) @JsonKey(name: 'distance_km') final double? distance,
      @HiveField(11) @JsonKey(name: 'opening_time') final String? openingTime,
      @HiveField(12) @JsonKey(name: 'closing_time') final String? closingTime,
      @HiveField(13) @JsonKey(name: 'is_open') final bool isOpen,
      @HiveField(14) @JsonKey(name: 'is_wishlisted') final bool isWishlisted,
      @HiveField(15) final List<String>? services,
      @HiveField(16)
      @JsonKey(name: 'price_range')
      final String? priceRange}) = _$CarWashShopModelImpl;
  const _CarWashShopModel._() : super._();

  factory _CarWashShopModel.fromJson(Map<String, dynamic> json) =
      _$CarWashShopModelImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String? get description;
  @override
  @HiveField(3)
  @JsonKey(name: 'cover_image')
  String? get image;
  @override
  @HiveField(4)
  String? get address;
  @override
  @HiveField(5)
  String? get phone;
  @override
  @HiveField(6)
  double? get latitude;
  @override
  @HiveField(7)
  double? get longitude;
  @override
  @HiveField(8)
  double? get rating;
  @override
  @HiveField(9)
  @JsonKey(name: 'review_count')
  int? get reviewCount;
  @override
  @HiveField(10)
  @JsonKey(name: 'distance_km')
  double? get distance;
  @override
  @HiveField(11)
  @JsonKey(name: 'opening_time')
  String? get openingTime;
  @override
  @HiveField(12)
  @JsonKey(name: 'closing_time')
  String? get closingTime;
  @override
  @HiveField(13)
  @JsonKey(name: 'is_open')
  bool get isOpen;
  @override
  @HiveField(14)
  @JsonKey(name: 'is_wishlisted')
  bool get isWishlisted;
  @override
  @HiveField(15)
  List<String>? get services;
  @override
  @HiveField(16)
  @JsonKey(name: 'price_range')
  String? get priceRange;
  @override
  @JsonKey(ignore: true)
  _$$CarWashShopModelImplCopyWith<_$CarWashShopModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShopsResponse _$ShopsResponseFromJson(Map<String, dynamic> json) {
  return _ShopsResponse.fromJson(json);
}

/// @nodoc
mixin _$ShopsResponse {
  List<CarWashShopModel> get results => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopsResponseCopyWith<ShopsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopsResponseCopyWith<$Res> {
  factory $ShopsResponseCopyWith(
          ShopsResponse value, $Res Function(ShopsResponse) then) =
      _$ShopsResponseCopyWithImpl<$Res, ShopsResponse>;
  @useResult
  $Res call(
      {List<CarWashShopModel> results,
      int? count,
      String? next,
      String? previous});
}

/// @nodoc
class _$ShopsResponseCopyWithImpl<$Res, $Val extends ShopsResponse>
    implements $ShopsResponseCopyWith<$Res> {
  _$ShopsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<CarWashShopModel>,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShopsResponseImplCopyWith<$Res>
    implements $ShopsResponseCopyWith<$Res> {
  factory _$$ShopsResponseImplCopyWith(
          _$ShopsResponseImpl value, $Res Function(_$ShopsResponseImpl) then) =
      __$$ShopsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CarWashShopModel> results,
      int? count,
      String? next,
      String? previous});
}

/// @nodoc
class __$$ShopsResponseImplCopyWithImpl<$Res>
    extends _$ShopsResponseCopyWithImpl<$Res, _$ShopsResponseImpl>
    implements _$$ShopsResponseImplCopyWith<$Res> {
  __$$ShopsResponseImplCopyWithImpl(
      _$ShopsResponseImpl _value, $Res Function(_$ShopsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
  }) {
    return _then(_$ShopsResponseImpl(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<CarWashShopModel>,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShopsResponseImpl implements _ShopsResponse {
  const _$ShopsResponseImpl(
      {required final List<CarWashShopModel> results,
      this.count,
      this.next,
      this.previous})
      : _results = results;

  factory _$ShopsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopsResponseImplFromJson(json);

  final List<CarWashShopModel> _results;
  @override
  List<CarWashShopModel> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  final int? count;
  @override
  final String? next;
  @override
  final String? previous;

  @override
  String toString() {
    return 'ShopsResponse(results: $results, count: $count, next: $next, previous: $previous)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopsResponseImpl &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_results), count, next, previous);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopsResponseImplCopyWith<_$ShopsResponseImpl> get copyWith =>
      __$$ShopsResponseImplCopyWithImpl<_$ShopsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShopsResponseImplToJson(
      this,
    );
  }
}

abstract class _ShopsResponse implements ShopsResponse {
  const factory _ShopsResponse(
      {required final List<CarWashShopModel> results,
      final int? count,
      final String? next,
      final String? previous}) = _$ShopsResponseImpl;

  factory _ShopsResponse.fromJson(Map<String, dynamic> json) =
      _$ShopsResponseImpl.fromJson;

  @override
  List<CarWashShopModel> get results;
  @override
  int? get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  @JsonKey(ignore: true)
  _$$ShopsResponseImplCopyWith<_$ShopsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
