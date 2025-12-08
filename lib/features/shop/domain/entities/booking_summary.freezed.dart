// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookingSummary _$BookingSummaryFromJson(Map<String, dynamic> json) {
  return _BookingSummary.fromJson(json);
}

/// @nodoc
mixin _$BookingSummary {
  int get shopId => throw _privateConstructorUsedError;
  String get shopName => throw _privateConstructorUsedError;
  String get shopAddress => throw _privateConstructorUsedError;
  String? get shopImageUrl => throw _privateConstructorUsedError;
  List<SelectedServiceItem> get services => throw _privateConstructorUsedError;
  List<SelectedServiceItem> get packages => throw _privateConstructorUsedError;
  List<SelectedServiceItem> get accessories =>
      throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  TimeSlotInfo get timeSlot => throw _privateConstructorUsedError;
  VehicleType get vehicleType => throw _privateConstructorUsedError;
  bool get pickupAndDelivery => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  double get adminFee => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  String? get promoCode => throw _privateConstructorUsedError;
  String? get paymentMethod => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingSummaryCopyWith<BookingSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingSummaryCopyWith<$Res> {
  factory $BookingSummaryCopyWith(
          BookingSummary value, $Res Function(BookingSummary) then) =
      _$BookingSummaryCopyWithImpl<$Res, BookingSummary>;
  @useResult
  $Res call(
      {int shopId,
      String shopName,
      String shopAddress,
      String? shopImageUrl,
      List<SelectedServiceItem> services,
      List<SelectedServiceItem> packages,
      List<SelectedServiceItem> accessories,
      DateTime date,
      TimeSlotInfo timeSlot,
      VehicleType vehicleType,
      bool pickupAndDelivery,
      double subtotal,
      double adminFee,
      double discount,
      String? promoCode,
      String? paymentMethod});

  $TimeSlotInfoCopyWith<$Res> get timeSlot;
}

/// @nodoc
class _$BookingSummaryCopyWithImpl<$Res, $Val extends BookingSummary>
    implements $BookingSummaryCopyWith<$Res> {
  _$BookingSummaryCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shopId = null,
    Object? shopName = null,
    Object? shopAddress = null,
    Object? shopImageUrl = freezed,
    Object? services = null,
    Object? packages = null,
    Object? accessories = null,
    Object? date = null,
    Object? timeSlot = null,
    Object? vehicleType = null,
    Object? pickupAndDelivery = null,
    Object? subtotal = null,
    Object? adminFee = null,
    Object? discount = null,
    Object? promoCode = freezed,
    Object? paymentMethod = freezed,
  }) {
    return _then(_value.copyWith(
      shopId: null == shopId
          ? _value.shopId
          : shopId as int,
      shopName: null == shopName
          ? _value.shopName
          : shopName as String,
      shopAddress: null == shopAddress
          ? _value.shopAddress
          : shopAddress as String,
      shopImageUrl: freezed == shopImageUrl
          ? _value.shopImageUrl
          : shopImageUrl as String?,
      services: null == services
          ? _value.services
          : services as List<SelectedServiceItem>,
      packages: null == packages
          ? _value.packages
          : packages as List<SelectedServiceItem>,
      accessories: null == accessories
          ? _value.accessories
          : accessories as List<SelectedServiceItem>,
      date: null == date
          ? _value.date
          : date as DateTime,
      timeSlot: null == timeSlot
          ? _value.timeSlot
          : timeSlot as TimeSlotInfo,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType as VehicleType,
      pickupAndDelivery: null == pickupAndDelivery
          ? _value.pickupAndDelivery
          : pickupAndDelivery as bool,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal as double,
      adminFee: null == adminFee
          ? _value.adminFee
          : adminFee as double,
      discount: null == discount
          ? _value.discount
          : discount as double,
      promoCode: freezed == promoCode
          ? _value.promoCode
          : promoCode as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TimeSlotInfoCopyWith<$Res> get timeSlot {
    return $TimeSlotInfoCopyWith<$Res>(_value.timeSlot, (value) {
      return _then(_value.copyWith(timeSlot: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookingSummaryImplCopyWith<$Res>
    implements $BookingSummaryCopyWith<$Res> {
  factory _$$BookingSummaryImplCopyWith(_$BookingSummaryImpl value,
          $Res Function(_$BookingSummaryImpl) then) =
      __$$BookingSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int shopId,
      String shopName,
      String shopAddress,
      String? shopImageUrl,
      List<SelectedServiceItem> services,
      List<SelectedServiceItem> packages,
      List<SelectedServiceItem> accessories,
      DateTime date,
      TimeSlotInfo timeSlot,
      VehicleType vehicleType,
      bool pickupAndDelivery,
      double subtotal,
      double adminFee,
      double discount,
      String? promoCode,
      String? paymentMethod});

  @override
  $TimeSlotInfoCopyWith<$Res> get timeSlot;
}

/// @nodoc
class __$$BookingSummaryImplCopyWithImpl<$Res>
    extends _$BookingSummaryCopyWithImpl<$Res, _$BookingSummaryImpl>
    implements _$$BookingSummaryImplCopyWith<$Res> {
  __$$BookingSummaryImplCopyWithImpl(
      _$BookingSummaryImpl _value, $Res Function(_$BookingSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shopId = null,
    Object? shopName = null,
    Object? shopAddress = null,
    Object? shopImageUrl = freezed,
    Object? services = null,
    Object? packages = null,
    Object? accessories = null,
    Object? date = null,
    Object? timeSlot = null,
    Object? vehicleType = null,
    Object? pickupAndDelivery = null,
    Object? subtotal = null,
    Object? adminFee = null,
    Object? discount = null,
    Object? promoCode = freezed,
    Object? paymentMethod = freezed,
  }) {
    return _then(_$BookingSummaryImpl(
      shopId: null == shopId
          ? _value.shopId
          : shopId as int,
      shopName: null == shopName
          ? _value.shopName
          : shopName as String,
      shopAddress: null == shopAddress
          ? _value.shopAddress
          : shopAddress as String,
      shopImageUrl: freezed == shopImageUrl
          ? _value.shopImageUrl
          : shopImageUrl as String?,
      services: null == services
          ? _value._services
          : services as List<SelectedServiceItem>,
      packages: null == packages
          ? _value._packages
          : packages as List<SelectedServiceItem>,
      accessories: null == accessories
          ? _value._accessories
          : accessories as List<SelectedServiceItem>,
      date: null == date
          ? _value.date
          : date as DateTime,
      timeSlot: null == timeSlot
          ? _value.timeSlot
          : timeSlot as TimeSlotInfo,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType as VehicleType,
      pickupAndDelivery: null == pickupAndDelivery
          ? _value.pickupAndDelivery
          : pickupAndDelivery as bool,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal as double,
      adminFee: null == adminFee
          ? _value.adminFee
          : adminFee as double,
      discount: null == discount
          ? _value.discount
          : discount as double,
      promoCode: freezed == promoCode
          ? _value.promoCode
          : promoCode as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingSummaryImpl extends _BookingSummary {
  const _$BookingSummaryImpl(
      {required this.shopId,
      required this.shopName,
      required this.shopAddress,
      this.shopImageUrl,
      required final List<SelectedServiceItem> services,
      required final List<SelectedServiceItem> packages,
      required final List<SelectedServiceItem> accessories,
      required this.date,
      required this.timeSlot,
      required this.vehicleType,
      this.pickupAndDelivery = false,
      this.subtotal = 0,
      this.adminFee = 0,
      this.discount = 0,
      this.promoCode,
      this.paymentMethod})
      : _services = services,
        _packages = packages,
        _accessories = accessories,
        super._();

  factory _$BookingSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingSummaryImplFromJson(json);

  @override
  final int shopId;
  @override
  final String shopName;
  @override
  final String shopAddress;
  @override
  final String? shopImageUrl;
  final List<SelectedServiceItem> _services;
  @override
  List<SelectedServiceItem> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    return EqualUnmodifiableListView(_services);
  }

  final List<SelectedServiceItem> _packages;
  @override
  List<SelectedServiceItem> get packages {
    if (_packages is EqualUnmodifiableListView) return _packages;
    return EqualUnmodifiableListView(_packages);
  }

  final List<SelectedServiceItem> _accessories;
  @override
  List<SelectedServiceItem> get accessories {
    if (_accessories is EqualUnmodifiableListView) return _accessories;
    return EqualUnmodifiableListView(_accessories);
  }

  @override
  final DateTime date;
  @override
  final TimeSlotInfo timeSlot;
  @override
  final VehicleType vehicleType;
  @override
  @JsonKey()
  final bool pickupAndDelivery;
  @override
  @JsonKey()
  final double subtotal;
  @override
  @JsonKey()
  final double adminFee;
  @override
  @JsonKey()
  final double discount;
  @override
  final String? promoCode;
  @override
  final String? paymentMethod;

  @override
  String toString() {
    return 'BookingSummary(shopId: $shopId, shopName: $shopName, shopAddress: $shopAddress, shopImageUrl: $shopImageUrl, services: $services, packages: $packages, accessories: $accessories, date: $date, timeSlot: $timeSlot, vehicleType: $vehicleType, pickupAndDelivery: $pickupAndDelivery, subtotal: $subtotal, adminFee: $adminFee, discount: $discount, promoCode: $promoCode, paymentMethod: $paymentMethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingSummaryImpl &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.shopName, shopName) ||
                other.shopName == shopName) &&
            (identical(other.shopAddress, shopAddress) ||
                other.shopAddress == shopAddress) &&
            (identical(other.shopImageUrl, shopImageUrl) ||
                other.shopImageUrl == shopImageUrl) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            const DeepCollectionEquality().equals(other._packages, _packages) &&
            const DeepCollectionEquality()
                .equals(other._accessories, _accessories) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.timeSlot, timeSlot) ||
                other.timeSlot == timeSlot) &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType) &&
            (identical(other.pickupAndDelivery, pickupAndDelivery) ||
                other.pickupAndDelivery == pickupAndDelivery) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.adminFee, adminFee) ||
                other.adminFee == adminFee) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.promoCode, promoCode) ||
                other.promoCode == promoCode) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      shopId,
      shopName,
      shopAddress,
      shopImageUrl,
      const DeepCollectionEquality().hash(_services),
      const DeepCollectionEquality().hash(_packages),
      const DeepCollectionEquality().hash(_accessories),
      date,
      timeSlot,
      vehicleType,
      pickupAndDelivery,
      subtotal,
      adminFee,
      discount,
      promoCode,
      paymentMethod);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingSummaryImplCopyWith<_$BookingSummaryImpl> get copyWith =>
      __$$BookingSummaryImplCopyWithImpl<_$BookingSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingSummaryImplToJson(this);
  }
}

abstract class _BookingSummary extends BookingSummary {
  const factory _BookingSummary(
      {required final int shopId,
      required final String shopName,
      required final String shopAddress,
      final String? shopImageUrl,
      required final List<SelectedServiceItem> services,
      required final List<SelectedServiceItem> packages,
      required final List<SelectedServiceItem> accessories,
      required final DateTime date,
      required final TimeSlotInfo timeSlot,
      required final VehicleType vehicleType,
      final bool pickupAndDelivery,
      final double subtotal,
      final double adminFee,
      final double discount,
      final String? promoCode,
      final String? paymentMethod}) = _$BookingSummaryImpl;
  const _BookingSummary._() : super._();

  factory _BookingSummary.fromJson(Map<String, dynamic> json) =
      _$BookingSummaryImpl.fromJson;

  @override
  int get shopId;
  @override
  String get shopName;
  @override
  String get shopAddress;
  @override
  String? get shopImageUrl;
  @override
  List<SelectedServiceItem> get services;
  @override
  List<SelectedServiceItem> get packages;
  @override
  List<SelectedServiceItem> get accessories;
  @override
  DateTime get date;
  @override
  TimeSlotInfo get timeSlot;
  @override
  VehicleType get vehicleType;
  @override
  bool get pickupAndDelivery;
  @override
  double get subtotal;
  @override
  double get adminFee;
  @override
  double get discount;
  @override
  String? get promoCode;
  @override
  String? get paymentMethod;
  @override
  @JsonKey(ignore: true)
  _$$BookingSummaryImplCopyWith<_$BookingSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SelectedServiceItem _$SelectedServiceItemFromJson(Map<String, dynamic> json) {
  return _SelectedServiceItem.fromJson(json);
}

/// @nodoc
mixin _$SelectedServiceItem {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelectedServiceItemCopyWith<SelectedServiceItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedServiceItemCopyWith<$Res> {
  factory $SelectedServiceItemCopyWith(
          SelectedServiceItem value, $Res Function(SelectedServiceItem) then) =
      _$SelectedServiceItemCopyWithImpl<$Res, SelectedServiceItem>;
  @useResult
  $Res call({String id, String name, double price, String? description});
}

/// @nodoc
class _$SelectedServiceItemCopyWithImpl<$Res, $Val extends SelectedServiceItem>
    implements $SelectedServiceItemCopyWith<$Res> {
  _$SelectedServiceItemCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id as String,
      name: null == name
          ? _value.name
          : name as String,
      price: null == price
          ? _value.price
          : price as double,
      description: freezed == description
          ? _value.description
          : description as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectedServiceItemImplCopyWith<$Res>
    implements $SelectedServiceItemCopyWith<$Res> {
  factory _$$SelectedServiceItemImplCopyWith(_$SelectedServiceItemImpl value,
          $Res Function(_$SelectedServiceItemImpl) then) =
      __$$SelectedServiceItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, double price, String? description});
}

/// @nodoc
class __$$SelectedServiceItemImplCopyWithImpl<$Res>
    extends _$SelectedServiceItemCopyWithImpl<$Res, _$SelectedServiceItemImpl>
    implements _$$SelectedServiceItemImplCopyWith<$Res> {
  __$$SelectedServiceItemImplCopyWithImpl(_$SelectedServiceItemImpl _value,
      $Res Function(_$SelectedServiceItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? description = freezed,
  }) {
    return _then(_$SelectedServiceItemImpl(
      id: null == id
          ? _value.id
          : id as String,
      name: null == name
          ? _value.name
          : name as String,
      price: null == price
          ? _value.price
          : price as double,
      description: freezed == description
          ? _value.description
          : description as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelectedServiceItemImpl implements _SelectedServiceItem {
  const _$SelectedServiceItemImpl(
      {required this.id,
      required this.name,
      required this.price,
      this.description});

  factory _$SelectedServiceItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectedServiceItemImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double price;
  @override
  final String? description;

  @override
  String toString() {
    return 'SelectedServiceItem(id: $id, name: $name, price: $price, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedServiceItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedServiceItemImplCopyWith<_$SelectedServiceItemImpl> get copyWith =>
      __$$SelectedServiceItemImplCopyWithImpl<_$SelectedServiceItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectedServiceItemImplToJson(this);
  }
}

abstract class _SelectedServiceItem implements SelectedServiceItem {
  const factory _SelectedServiceItem(
      {required final String id,
      required final String name,
      required final double price,
      final String? description}) = _$SelectedServiceItemImpl;

  factory _SelectedServiceItem.fromJson(Map<String, dynamic> json) =
      _$SelectedServiceItemImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get price;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$SelectedServiceItemImplCopyWith<_$SelectedServiceItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
