// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookingData _$BookingDataFromJson(Map<String, dynamic> json) {
  return _BookingData.fromJson(json);
}

/// @nodoc
mixin _$BookingData {
// Shop information
  String get shopId => throw _privateConstructorUsedError;
  String get shopName => throw _privateConstructorUsedError;
  String get shopImageUrl => throw _privateConstructorUsedError;
  String get shopAddress => throw _privateConstructorUsedError;
  double get shopRating =>
      throw _privateConstructorUsedError; // Selected services/packages/accessories
  List<SelectedItem> get selectedServices => throw _privateConstructorUsedError;
  List<SelectedItem> get selectedPackages => throw _privateConstructorUsedError;
  List<SelectedItem> get selectedAccessories =>
      throw _privateConstructorUsedError; // Vehicle type
  String? get vehicleType => throw _privateConstructorUsedError;
  String? get vehicleId => throw _privateConstructorUsedError; // Date and time
  DateTime? get selectedDate => throw _privateConstructorUsedError;
  String? get selectedTimeSlot => throw _privateConstructorUsedError;
  String? get selectedTimeSlotId =>
      throw _privateConstructorUsedError; // Pickup and delivery
  bool get pickupAndDelivery =>
      throw _privateConstructorUsedError; // Contact info
  String? get phoneNumber =>
      throw _privateConstructorUsedError; // Price details
  double get subtotal => throw _privateConstructorUsedError;
  double get adminFee => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError; // Promo code
  String? get promoCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingDataCopyWith<BookingData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingDataCopyWith<$Res> {
  factory $BookingDataCopyWith(
          BookingData value, $Res Function(BookingData) then) =
      _$BookingDataCopyWithImpl<$Res, BookingData>;
  @useResult
  $Res call(
      {String shopId,
      String shopName,
      String shopImageUrl,
      String shopAddress,
      double shopRating,
      List<SelectedItem> selectedServices,
      List<SelectedItem> selectedPackages,
      List<SelectedItem> selectedAccessories,
      String? vehicleType,
      String? vehicleId,
      DateTime? selectedDate,
      String? selectedTimeSlot,
      String? selectedTimeSlotId,
      bool pickupAndDelivery,
      String? phoneNumber,
      double subtotal,
      double adminFee,
      double discount,
      String? promoCode});
}

/// @nodoc
class _$BookingDataCopyWithImpl<$Res, $Val extends BookingData>
    implements $BookingDataCopyWith<$Res> {
  _$BookingDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shopId = null,
    Object? shopName = null,
    Object? shopImageUrl = null,
    Object? shopAddress = null,
    Object? shopRating = null,
    Object? selectedServices = null,
    Object? selectedPackages = null,
    Object? selectedAccessories = null,
    Object? vehicleType = freezed,
    Object? vehicleId = freezed,
    Object? selectedDate = freezed,
    Object? selectedTimeSlot = freezed,
    Object? selectedTimeSlotId = freezed,
    Object? pickupAndDelivery = null,
    Object? phoneNumber = freezed,
    Object? subtotal = null,
    Object? adminFee = null,
    Object? discount = null,
    Object? promoCode = freezed,
  }) {
    return _then(_value.copyWith(
      shopId: null == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String,
      shopName: null == shopName
          ? _value.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String,
      shopImageUrl: null == shopImageUrl
          ? _value.shopImageUrl
          : shopImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      shopAddress: null == shopAddress
          ? _value.shopAddress
          : shopAddress // ignore: cast_nullable_to_non_nullable
              as String,
      shopRating: null == shopRating
          ? _value.shopRating
          : shopRating // ignore: cast_nullable_to_non_nullable
              as double,
      selectedServices: null == selectedServices
          ? _value.selectedServices
          : selectedServices // ignore: cast_nullable_to_non_nullable
              as List<SelectedItem>,
      selectedPackages: null == selectedPackages
          ? _value.selectedPackages
          : selectedPackages // ignore: cast_nullable_to_non_nullable
              as List<SelectedItem>,
      selectedAccessories: null == selectedAccessories
          ? _value.selectedAccessories
          : selectedAccessories // ignore: cast_nullable_to_non_nullable
              as List<SelectedItem>,
      vehicleType: freezed == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleId: freezed == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedTimeSlot: freezed == selectedTimeSlot
          ? _value.selectedTimeSlot
          : selectedTimeSlot // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedTimeSlotId: freezed == selectedTimeSlotId
          ? _value.selectedTimeSlotId
          : selectedTimeSlotId // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupAndDelivery: null == pickupAndDelivery
          ? _value.pickupAndDelivery
          : pickupAndDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      adminFee: null == adminFee
          ? _value.adminFee
          : adminFee // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      promoCode: freezed == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingDataImplCopyWith<$Res>
    implements $BookingDataCopyWith<$Res> {
  factory _$$BookingDataImplCopyWith(
          _$BookingDataImpl value, $Res Function(_$BookingDataImpl) then) =
      __$$BookingDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String shopId,
      String shopName,
      String shopImageUrl,
      String shopAddress,
      double shopRating,
      List<SelectedItem> selectedServices,
      List<SelectedItem> selectedPackages,
      List<SelectedItem> selectedAccessories,
      String? vehicleType,
      String? vehicleId,
      DateTime? selectedDate,
      String? selectedTimeSlot,
      String? selectedTimeSlotId,
      bool pickupAndDelivery,
      String? phoneNumber,
      double subtotal,
      double adminFee,
      double discount,
      String? promoCode});
}

/// @nodoc
class __$$BookingDataImplCopyWithImpl<$Res>
    extends _$BookingDataCopyWithImpl<$Res, _$BookingDataImpl>
    implements _$$BookingDataImplCopyWith<$Res> {
  __$$BookingDataImplCopyWithImpl(
      _$BookingDataImpl _value, $Res Function(_$BookingDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shopId = null,
    Object? shopName = null,
    Object? shopImageUrl = null,
    Object? shopAddress = null,
    Object? shopRating = null,
    Object? selectedServices = null,
    Object? selectedPackages = null,
    Object? selectedAccessories = null,
    Object? vehicleType = freezed,
    Object? vehicleId = freezed,
    Object? selectedDate = freezed,
    Object? selectedTimeSlot = freezed,
    Object? selectedTimeSlotId = freezed,
    Object? pickupAndDelivery = null,
    Object? phoneNumber = freezed,
    Object? subtotal = null,
    Object? adminFee = null,
    Object? discount = null,
    Object? promoCode = freezed,
  }) {
    return _then(_$BookingDataImpl(
      shopId: null == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String,
      shopName: null == shopName
          ? _value.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String,
      shopImageUrl: null == shopImageUrl
          ? _value.shopImageUrl
          : shopImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      shopAddress: null == shopAddress
          ? _value.shopAddress
          : shopAddress // ignore: cast_nullable_to_non_nullable
              as String,
      shopRating: null == shopRating
          ? _value.shopRating
          : shopRating // ignore: cast_nullable_to_non_nullable
              as double,
      selectedServices: null == selectedServices
          ? _value._selectedServices
          : selectedServices // ignore: cast_nullable_to_non_nullable
              as List<SelectedItem>,
      selectedPackages: null == selectedPackages
          ? _value._selectedPackages
          : selectedPackages // ignore: cast_nullable_to_non_nullable
              as List<SelectedItem>,
      selectedAccessories: null == selectedAccessories
          ? _value._selectedAccessories
          : selectedAccessories // ignore: cast_nullable_to_non_nullable
              as List<SelectedItem>,
      vehicleType: freezed == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleId: freezed == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedTimeSlot: freezed == selectedTimeSlot
          ? _value.selectedTimeSlot
          : selectedTimeSlot // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedTimeSlotId: freezed == selectedTimeSlotId
          ? _value.selectedTimeSlotId
          : selectedTimeSlotId // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupAndDelivery: null == pickupAndDelivery
          ? _value.pickupAndDelivery
          : pickupAndDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      adminFee: null == adminFee
          ? _value.adminFee
          : adminFee // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      promoCode: freezed == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingDataImpl implements _BookingData {
  const _$BookingDataImpl(
      {required this.shopId,
      required this.shopName,
      required this.shopImageUrl,
      required this.shopAddress,
      required this.shopRating,
      final List<SelectedItem> selectedServices = const [],
      final List<SelectedItem> selectedPackages = const [],
      final List<SelectedItem> selectedAccessories = const [],
      this.vehicleType,
      this.vehicleId,
      this.selectedDate,
      this.selectedTimeSlot,
      this.selectedTimeSlotId,
      this.pickupAndDelivery = false,
      this.phoneNumber,
      this.subtotal = 0.0,
      this.adminFee = 0.0,
      this.discount = 0.0,
      this.promoCode})
      : _selectedServices = selectedServices,
        _selectedPackages = selectedPackages,
        _selectedAccessories = selectedAccessories;

  factory _$BookingDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingDataImplFromJson(json);

// Shop information
  @override
  final String shopId;
  @override
  final String shopName;
  @override
  final String shopImageUrl;
  @override
  final String shopAddress;
  @override
  final double shopRating;
// Selected services/packages/accessories
  final List<SelectedItem> _selectedServices;
// Selected services/packages/accessories
  @override
  @JsonKey()
  List<SelectedItem> get selectedServices {
    if (_selectedServices is EqualUnmodifiableListView)
      return _selectedServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedServices);
  }

  final List<SelectedItem> _selectedPackages;
  @override
  @JsonKey()
  List<SelectedItem> get selectedPackages {
    if (_selectedPackages is EqualUnmodifiableListView)
      return _selectedPackages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedPackages);
  }

  final List<SelectedItem> _selectedAccessories;
  @override
  @JsonKey()
  List<SelectedItem> get selectedAccessories {
    if (_selectedAccessories is EqualUnmodifiableListView)
      return _selectedAccessories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedAccessories);
  }

// Vehicle type
  @override
  final String? vehicleType;
  @override
  final String? vehicleId;
// Date and time
  @override
  final DateTime? selectedDate;
  @override
  final String? selectedTimeSlot;
  @override
  final String? selectedTimeSlotId;
// Pickup and delivery
  @override
  @JsonKey()
  final bool pickupAndDelivery;
// Contact info
  @override
  final String? phoneNumber;
// Price details
  @override
  @JsonKey()
  final double subtotal;
  @override
  @JsonKey()
  final double adminFee;
  @override
  @JsonKey()
  final double discount;
// Promo code
  @override
  final String? promoCode;

  @override
  String toString() {
    return 'BookingData(shopId: $shopId, shopName: $shopName, shopImageUrl: $shopImageUrl, shopAddress: $shopAddress, shopRating: $shopRating, selectedServices: $selectedServices, selectedPackages: $selectedPackages, selectedAccessories: $selectedAccessories, vehicleType: $vehicleType, vehicleId: $vehicleId, selectedDate: $selectedDate, selectedTimeSlot: $selectedTimeSlot, selectedTimeSlotId: $selectedTimeSlotId, pickupAndDelivery: $pickupAndDelivery, phoneNumber: $phoneNumber, subtotal: $subtotal, adminFee: $adminFee, discount: $discount, promoCode: $promoCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingDataImpl &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.shopName, shopName) ||
                other.shopName == shopName) &&
            (identical(other.shopImageUrl, shopImageUrl) ||
                other.shopImageUrl == shopImageUrl) &&
            (identical(other.shopAddress, shopAddress) ||
                other.shopAddress == shopAddress) &&
            (identical(other.shopRating, shopRating) ||
                other.shopRating == shopRating) &&
            const DeepCollectionEquality()
                .equals(other._selectedServices, _selectedServices) &&
            const DeepCollectionEquality()
                .equals(other._selectedPackages, _selectedPackages) &&
            const DeepCollectionEquality()
                .equals(other._selectedAccessories, _selectedAccessories) &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType) &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.selectedTimeSlot, selectedTimeSlot) ||
                other.selectedTimeSlot == selectedTimeSlot) &&
            (identical(other.selectedTimeSlotId, selectedTimeSlotId) ||
                other.selectedTimeSlotId == selectedTimeSlotId) &&
            (identical(other.pickupAndDelivery, pickupAndDelivery) ||
                other.pickupAndDelivery == pickupAndDelivery) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.adminFee, adminFee) ||
                other.adminFee == adminFee) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.promoCode, promoCode) ||
                other.promoCode == promoCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        shopId,
        shopName,
        shopImageUrl,
        shopAddress,
        shopRating,
        const DeepCollectionEquality().hash(_selectedServices),
        const DeepCollectionEquality().hash(_selectedPackages),
        const DeepCollectionEquality().hash(_selectedAccessories),
        vehicleType,
        vehicleId,
        selectedDate,
        selectedTimeSlot,
        selectedTimeSlotId,
        pickupAndDelivery,
        phoneNumber,
        subtotal,
        adminFee,
        discount,
        promoCode
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingDataImplCopyWith<_$BookingDataImpl> get copyWith =>
      __$$BookingDataImplCopyWithImpl<_$BookingDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingDataImplToJson(
      this,
    );
  }
}

abstract class _BookingData implements BookingData {
  const factory _BookingData(
      {required final String shopId,
      required final String shopName,
      required final String shopImageUrl,
      required final String shopAddress,
      required final double shopRating,
      final List<SelectedItem> selectedServices,
      final List<SelectedItem> selectedPackages,
      final List<SelectedItem> selectedAccessories,
      final String? vehicleType,
      final String? vehicleId,
      final DateTime? selectedDate,
      final String? selectedTimeSlot,
      final String? selectedTimeSlotId,
      final bool pickupAndDelivery,
      final String? phoneNumber,
      final double subtotal,
      final double adminFee,
      final double discount,
      final String? promoCode}) = _$BookingDataImpl;

  factory _BookingData.fromJson(Map<String, dynamic> json) =
      _$BookingDataImpl.fromJson;

  @override // Shop information
  String get shopId;
  @override
  String get shopName;
  @override
  String get shopImageUrl;
  @override
  String get shopAddress;
  @override
  double get shopRating;
  @override // Selected services/packages/accessories
  List<SelectedItem> get selectedServices;
  @override
  List<SelectedItem> get selectedPackages;
  @override
  List<SelectedItem> get selectedAccessories;
  @override // Vehicle type
  String? get vehicleType;
  @override
  String? get vehicleId;
  @override // Date and time
  DateTime? get selectedDate;
  @override
  String? get selectedTimeSlot;
  @override
  String? get selectedTimeSlotId;
  @override // Pickup and delivery
  bool get pickupAndDelivery;
  @override // Contact info
  String? get phoneNumber;
  @override // Price details
  double get subtotal;
  @override
  double get adminFee;
  @override
  double get discount;
  @override // Promo code
  String? get promoCode;
  @override
  @JsonKey(ignore: true)
  _$$BookingDataImplCopyWith<_$BookingDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SelectedItem _$SelectedItemFromJson(Map<String, dynamic> json) {
  return _SelectedItem.fromJson(json);
}

/// @nodoc
mixin _$SelectedItem {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelectedItemCopyWith<SelectedItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedItemCopyWith<$Res> {
  factory $SelectedItemCopyWith(
          SelectedItem value, $Res Function(SelectedItem) then) =
      _$SelectedItemCopyWithImpl<$Res, SelectedItem>;
  @useResult
  $Res call({String id, String name, double price, String? description});
}

/// @nodoc
class _$SelectedItemCopyWithImpl<$Res, $Val extends SelectedItem>
    implements $SelectedItemCopyWith<$Res> {
  _$SelectedItemCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectedItemImplCopyWith<$Res>
    implements $SelectedItemCopyWith<$Res> {
  factory _$$SelectedItemImplCopyWith(
          _$SelectedItemImpl value, $Res Function(_$SelectedItemImpl) then) =
      __$$SelectedItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, double price, String? description});
}

/// @nodoc
class __$$SelectedItemImplCopyWithImpl<$Res>
    extends _$SelectedItemCopyWithImpl<$Res, _$SelectedItemImpl>
    implements _$$SelectedItemImplCopyWith<$Res> {
  __$$SelectedItemImplCopyWithImpl(
      _$SelectedItemImpl _value, $Res Function(_$SelectedItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? description = freezed,
  }) {
    return _then(_$SelectedItemImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelectedItemImpl implements _SelectedItem {
  const _$SelectedItemImpl(
      {required this.id,
      required this.name,
      required this.price,
      this.description});

  factory _$SelectedItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectedItemImplFromJson(json);

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
    return 'SelectedItem(id: $id, name: $name, price: $price, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedItemImpl &&
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
  _$$SelectedItemImplCopyWith<_$SelectedItemImpl> get copyWith =>
      __$$SelectedItemImplCopyWithImpl<_$SelectedItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectedItemImplToJson(
      this,
    );
  }
}

abstract class _SelectedItem implements SelectedItem {
  const factory _SelectedItem(
      {required final String id,
      required final String name,
      required final double price,
      final String? description}) = _$SelectedItemImpl;

  factory _SelectedItem.fromJson(Map<String, dynamic> json) =
      _$SelectedItemImpl.fromJson;

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
  _$$SelectedItemImplCopyWith<_$SelectedItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
