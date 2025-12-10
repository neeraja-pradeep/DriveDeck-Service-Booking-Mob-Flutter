// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookingRequest _$BookingRequestFromJson(Map<String, dynamic> json) {
  return _BookingRequest.fromJson(json);
}

/// @nodoc
mixin _$BookingRequest {
  /// Shop identifier (snake_case for API).
  @JsonKey(name: 'shop_id')
  int get shopId => throw _privateConstructorUsedError;

  /// Authenticated user identifier (must be in body, not just header).
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;

  /// Selected items.
  @JsonKey(name: 'selected_service_ids')
  List<String> get selectedServiceIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'selected_package_ids')
  List<String> get selectedPackageIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'selected_accessory_ids')
  List<String> get selectedAccessoryIds => throw _privateConstructorUsedError;

  /// Date to book (API expects yyyy-MM-dd) under appointment_date.
  @JsonKey(name: 'appointment_date', toJson: _dateOnly, fromJson: _dateFromJson)
  DateTime get appointmentDate => throw _privateConstructorUsedError;

  /// Required service reference (backend expects singular service_id).
  @JsonKey(name: 'service_id')
  int get serviceId => throw _privateConstructorUsedError;

  /// Slot identifier expected as start_slot by backend.
  @JsonKey(name: 'start_slot')
  int get timeSlotId => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_type')
  VehicleType get vehicleType => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_and_delivery')
  bool get pickupAndDelivery => throw _privateConstructorUsedError;
  @JsonKey(name: 'promo_code')
  String? get promoCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  String? get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_id')
  String? get vehicleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'notes')
  String? get notes => throw _privateConstructorUsedError;

  /// Pricing and duration metadata.
  @JsonKey(name: 'duration_in_blocks')
  int get durationInBlocks => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  double get amount => throw _privateConstructorUsedError;

  /// Booking status (e.g., pending/confirmed).
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingRequestCopyWith<BookingRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingRequestCopyWith<$Res> {
  factory $BookingRequestCopyWith(
          BookingRequest value, $Res Function(BookingRequest) then) =
      _$BookingRequestCopyWithImpl<$Res, BookingRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'shop_id') int shopId,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'selected_service_ids') List<String> selectedServiceIds,
      @JsonKey(name: 'selected_package_ids') List<String> selectedPackageIds,
      @JsonKey(name: 'selected_accessory_ids')
      List<String> selectedAccessoryIds,
      @JsonKey(
          name: 'appointment_date', toJson: _dateOnly, fromJson: _dateFromJson)
      DateTime appointmentDate,
      @JsonKey(name: 'service_id') int serviceId,
      @JsonKey(name: 'start_slot') int timeSlotId,
      @JsonKey(name: 'vehicle_type') VehicleType vehicleType,
      @JsonKey(name: 'pickup_and_delivery') bool pickupAndDelivery,
      @JsonKey(name: 'promo_code') String? promoCode,
      @JsonKey(name: 'payment_method') String? paymentMethod,
      @JsonKey(name: 'vehicle_id') String? vehicleId,
      @JsonKey(name: 'notes') String? notes,
      @JsonKey(name: 'duration_in_blocks') int durationInBlocks,
      @JsonKey(name: 'amount') double amount,
      @JsonKey(name: 'status') String status});
}

/// @nodoc
class _$BookingRequestCopyWithImpl<$Res, $Val extends BookingRequest>
    implements $BookingRequestCopyWith<$Res> {
  _$BookingRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shopId = null,
    Object? userId = null,
    Object? selectedServiceIds = null,
    Object? selectedPackageIds = null,
    Object? selectedAccessoryIds = null,
    Object? appointmentDate = null,
    Object? serviceId = null,
    Object? timeSlotId = null,
    Object? vehicleType = null,
    Object? pickupAndDelivery = null,
    Object? promoCode = freezed,
    Object? paymentMethod = freezed,
    Object? vehicleId = freezed,
    Object? notes = freezed,
    Object? durationInBlocks = null,
    Object? amount = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      shopId: null == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      selectedServiceIds: null == selectedServiceIds
          ? _value.selectedServiceIds
          : selectedServiceIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedPackageIds: null == selectedPackageIds
          ? _value.selectedPackageIds
          : selectedPackageIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedAccessoryIds: null == selectedAccessoryIds
          ? _value.selectedAccessoryIds
          : selectedAccessoryIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      appointmentDate: null == appointmentDate
          ? _value.appointmentDate
          : appointmentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as int,
      timeSlotId: null == timeSlotId
          ? _value.timeSlotId
          : timeSlotId // ignore: cast_nullable_to_non_nullable
              as int,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as VehicleType,
      pickupAndDelivery: null == pickupAndDelivery
          ? _value.pickupAndDelivery
          : pickupAndDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      promoCode: freezed == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleId: freezed == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      durationInBlocks: null == durationInBlocks
          ? _value.durationInBlocks
          : durationInBlocks // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingRequestImplCopyWith<$Res>
    implements $BookingRequestCopyWith<$Res> {
  factory _$$BookingRequestImplCopyWith(_$BookingRequestImpl value,
          $Res Function(_$BookingRequestImpl) then) =
      __$$BookingRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'shop_id') int shopId,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'selected_service_ids') List<String> selectedServiceIds,
      @JsonKey(name: 'selected_package_ids') List<String> selectedPackageIds,
      @JsonKey(name: 'selected_accessory_ids')
      List<String> selectedAccessoryIds,
      @JsonKey(
          name: 'appointment_date', toJson: _dateOnly, fromJson: _dateFromJson)
      DateTime appointmentDate,
      @JsonKey(name: 'service_id') int serviceId,
      @JsonKey(name: 'start_slot') int timeSlotId,
      @JsonKey(name: 'vehicle_type') VehicleType vehicleType,
      @JsonKey(name: 'pickup_and_delivery') bool pickupAndDelivery,
      @JsonKey(name: 'promo_code') String? promoCode,
      @JsonKey(name: 'payment_method') String? paymentMethod,
      @JsonKey(name: 'vehicle_id') String? vehicleId,
      @JsonKey(name: 'notes') String? notes,
      @JsonKey(name: 'duration_in_blocks') int durationInBlocks,
      @JsonKey(name: 'amount') double amount,
      @JsonKey(name: 'status') String status});
}

/// @nodoc
class __$$BookingRequestImplCopyWithImpl<$Res>
    extends _$BookingRequestCopyWithImpl<$Res, _$BookingRequestImpl>
    implements _$$BookingRequestImplCopyWith<$Res> {
  __$$BookingRequestImplCopyWithImpl(
      _$BookingRequestImpl _value, $Res Function(_$BookingRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shopId = null,
    Object? userId = null,
    Object? selectedServiceIds = null,
    Object? selectedPackageIds = null,
    Object? selectedAccessoryIds = null,
    Object? appointmentDate = null,
    Object? serviceId = null,
    Object? timeSlotId = null,
    Object? vehicleType = null,
    Object? pickupAndDelivery = null,
    Object? promoCode = freezed,
    Object? paymentMethod = freezed,
    Object? vehicleId = freezed,
    Object? notes = freezed,
    Object? durationInBlocks = null,
    Object? amount = null,
    Object? status = null,
  }) {
    return _then(_$BookingRequestImpl(
      shopId: null == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      selectedServiceIds: null == selectedServiceIds
          ? _value._selectedServiceIds
          : selectedServiceIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedPackageIds: null == selectedPackageIds
          ? _value._selectedPackageIds
          : selectedPackageIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedAccessoryIds: null == selectedAccessoryIds
          ? _value._selectedAccessoryIds
          : selectedAccessoryIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      appointmentDate: null == appointmentDate
          ? _value.appointmentDate
          : appointmentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as int,
      timeSlotId: null == timeSlotId
          ? _value.timeSlotId
          : timeSlotId // ignore: cast_nullable_to_non_nullable
              as int,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as VehicleType,
      pickupAndDelivery: null == pickupAndDelivery
          ? _value.pickupAndDelivery
          : pickupAndDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      promoCode: freezed == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleId: freezed == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      durationInBlocks: null == durationInBlocks
          ? _value.durationInBlocks
          : durationInBlocks // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingRequestImpl implements _BookingRequest {
  const _$BookingRequestImpl(
      {@JsonKey(name: 'shop_id') required this.shopId,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'selected_service_ids')
      required final List<String> selectedServiceIds,
      @JsonKey(name: 'selected_package_ids')
      required final List<String> selectedPackageIds,
      @JsonKey(name: 'selected_accessory_ids')
      required final List<String> selectedAccessoryIds,
      @JsonKey(
          name: 'appointment_date', toJson: _dateOnly, fromJson: _dateFromJson)
      required this.appointmentDate,
      @JsonKey(name: 'service_id') required this.serviceId,
      @JsonKey(name: 'start_slot') required this.timeSlotId,
      @JsonKey(name: 'vehicle_type') required this.vehicleType,
      @JsonKey(name: 'pickup_and_delivery') this.pickupAndDelivery = false,
      @JsonKey(name: 'promo_code') this.promoCode,
      @JsonKey(name: 'payment_method') this.paymentMethod,
      @JsonKey(name: 'vehicle_id') this.vehicleId,
      @JsonKey(name: 'notes') this.notes,
      @JsonKey(name: 'duration_in_blocks') required this.durationInBlocks,
      @JsonKey(name: 'amount') required this.amount,
      @JsonKey(name: 'status') this.status = 'pending'})
      : _selectedServiceIds = selectedServiceIds,
        _selectedPackageIds = selectedPackageIds,
        _selectedAccessoryIds = selectedAccessoryIds;

  factory _$BookingRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingRequestImplFromJson(json);

  /// Shop identifier (snake_case for API).
  @override
  @JsonKey(name: 'shop_id')
  final int shopId;

  /// Authenticated user identifier (must be in body, not just header).
  @override
  @JsonKey(name: 'user_id')
  final int userId;

  /// Selected items.
  final List<String> _selectedServiceIds;

  /// Selected items.
  @override
  @JsonKey(name: 'selected_service_ids')
  List<String> get selectedServiceIds {
    if (_selectedServiceIds is EqualUnmodifiableListView)
      return _selectedServiceIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedServiceIds);
  }

  final List<String> _selectedPackageIds;
  @override
  @JsonKey(name: 'selected_package_ids')
  List<String> get selectedPackageIds {
    if (_selectedPackageIds is EqualUnmodifiableListView)
      return _selectedPackageIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedPackageIds);
  }

  final List<String> _selectedAccessoryIds;
  @override
  @JsonKey(name: 'selected_accessory_ids')
  List<String> get selectedAccessoryIds {
    if (_selectedAccessoryIds is EqualUnmodifiableListView)
      return _selectedAccessoryIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedAccessoryIds);
  }

  /// Date to book (API expects yyyy-MM-dd) under appointment_date.
  @override
  @JsonKey(name: 'appointment_date', toJson: _dateOnly, fromJson: _dateFromJson)
  final DateTime appointmentDate;

  /// Required service reference (backend expects singular service_id).
  @override
  @JsonKey(name: 'service_id')
  final int serviceId;

  /// Slot identifier expected as start_slot by backend.
  @override
  @JsonKey(name: 'start_slot')
  final int timeSlotId;
  @override
  @JsonKey(name: 'vehicle_type')
  final VehicleType vehicleType;
  @override
  @JsonKey(name: 'pickup_and_delivery')
  final bool pickupAndDelivery;
  @override
  @JsonKey(name: 'promo_code')
  final String? promoCode;
  @override
  @JsonKey(name: 'payment_method')
  final String? paymentMethod;
  @override
  @JsonKey(name: 'vehicle_id')
  final String? vehicleId;
  @override
  @JsonKey(name: 'notes')
  final String? notes;

  /// Pricing and duration metadata.
  @override
  @JsonKey(name: 'duration_in_blocks')
  final int durationInBlocks;
  @override
  @JsonKey(name: 'amount')
  final double amount;

  /// Booking status (e.g., pending/confirmed).
  @override
  @JsonKey(name: 'status')
  final String status;

  @override
  String toString() {
    return 'BookingRequest(shopId: $shopId, userId: $userId, selectedServiceIds: $selectedServiceIds, selectedPackageIds: $selectedPackageIds, selectedAccessoryIds: $selectedAccessoryIds, appointmentDate: $appointmentDate, serviceId: $serviceId, timeSlotId: $timeSlotId, vehicleType: $vehicleType, pickupAndDelivery: $pickupAndDelivery, promoCode: $promoCode, paymentMethod: $paymentMethod, vehicleId: $vehicleId, notes: $notes, durationInBlocks: $durationInBlocks, amount: $amount, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingRequestImpl &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality()
                .equals(other._selectedServiceIds, _selectedServiceIds) &&
            const DeepCollectionEquality()
                .equals(other._selectedPackageIds, _selectedPackageIds) &&
            const DeepCollectionEquality()
                .equals(other._selectedAccessoryIds, _selectedAccessoryIds) &&
            (identical(other.appointmentDate, appointmentDate) ||
                other.appointmentDate == appointmentDate) &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.timeSlotId, timeSlotId) ||
                other.timeSlotId == timeSlotId) &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType) &&
            (identical(other.pickupAndDelivery, pickupAndDelivery) ||
                other.pickupAndDelivery == pickupAndDelivery) &&
            (identical(other.promoCode, promoCode) ||
                other.promoCode == promoCode) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.durationInBlocks, durationInBlocks) ||
                other.durationInBlocks == durationInBlocks) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      shopId,
      userId,
      const DeepCollectionEquality().hash(_selectedServiceIds),
      const DeepCollectionEquality().hash(_selectedPackageIds),
      const DeepCollectionEquality().hash(_selectedAccessoryIds),
      appointmentDate,
      serviceId,
      timeSlotId,
      vehicleType,
      pickupAndDelivery,
      promoCode,
      paymentMethod,
      vehicleId,
      notes,
      durationInBlocks,
      amount,
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingRequestImplCopyWith<_$BookingRequestImpl> get copyWith =>
      __$$BookingRequestImplCopyWithImpl<_$BookingRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingRequestImplToJson(
      this,
    );
  }
}

abstract class _BookingRequest implements BookingRequest {
  const factory _BookingRequest(
      {@JsonKey(name: 'shop_id') required final int shopId,
      @JsonKey(name: 'user_id') required final int userId,
      @JsonKey(name: 'selected_service_ids')
      required final List<String> selectedServiceIds,
      @JsonKey(name: 'selected_package_ids')
      required final List<String> selectedPackageIds,
      @JsonKey(name: 'selected_accessory_ids')
      required final List<String> selectedAccessoryIds,
      @JsonKey(
          name: 'appointment_date', toJson: _dateOnly, fromJson: _dateFromJson)
      required final DateTime appointmentDate,
      @JsonKey(name: 'service_id') required final int serviceId,
      @JsonKey(name: 'start_slot') required final int timeSlotId,
      @JsonKey(name: 'vehicle_type') required final VehicleType vehicleType,
      @JsonKey(name: 'pickup_and_delivery') final bool pickupAndDelivery,
      @JsonKey(name: 'promo_code') final String? promoCode,
      @JsonKey(name: 'payment_method') final String? paymentMethod,
      @JsonKey(name: 'vehicle_id') final String? vehicleId,
      @JsonKey(name: 'notes') final String? notes,
      @JsonKey(name: 'duration_in_blocks') required final int durationInBlocks,
      @JsonKey(name: 'amount') required final double amount,
      @JsonKey(name: 'status') final String status}) = _$BookingRequestImpl;

  factory _BookingRequest.fromJson(Map<String, dynamic> json) =
      _$BookingRequestImpl.fromJson;

  @override

  /// Shop identifier (snake_case for API).
  @JsonKey(name: 'shop_id')
  int get shopId;
  @override

  /// Authenticated user identifier (must be in body, not just header).
  @JsonKey(name: 'user_id')
  int get userId;
  @override

  /// Selected items.
  @JsonKey(name: 'selected_service_ids')
  List<String> get selectedServiceIds;
  @override
  @JsonKey(name: 'selected_package_ids')
  List<String> get selectedPackageIds;
  @override
  @JsonKey(name: 'selected_accessory_ids')
  List<String> get selectedAccessoryIds;
  @override

  /// Date to book (API expects yyyy-MM-dd) under appointment_date.
  @JsonKey(name: 'appointment_date', toJson: _dateOnly, fromJson: _dateFromJson)
  DateTime get appointmentDate;
  @override

  /// Required service reference (backend expects singular service_id).
  @JsonKey(name: 'service_id')
  int get serviceId;
  @override

  /// Slot identifier expected as start_slot by backend.
  @JsonKey(name: 'start_slot')
  int get timeSlotId;
  @override
  @JsonKey(name: 'vehicle_type')
  VehicleType get vehicleType;
  @override
  @JsonKey(name: 'pickup_and_delivery')
  bool get pickupAndDelivery;
  @override
  @JsonKey(name: 'promo_code')
  String? get promoCode;
  @override
  @JsonKey(name: 'payment_method')
  String? get paymentMethod;
  @override
  @JsonKey(name: 'vehicle_id')
  String? get vehicleId;
  @override
  @JsonKey(name: 'notes')
  String? get notes;
  @override

  /// Pricing and duration metadata.
  @JsonKey(name: 'duration_in_blocks')
  int get durationInBlocks;
  @override
  @JsonKey(name: 'amount')
  double get amount;
  @override

  /// Booking status (e.g., pending/confirmed).
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$BookingRequestImplCopyWith<_$BookingRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BookingDate _$BookingDateFromJson(Map<String, dynamic> json) {
  return _BookingDate.fromJson(json);
}

/// @nodoc
mixin _$BookingDate {
  DateTime get date => throw _privateConstructorUsedError;
  List<TimeSlotInfo> get slots => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingDateCopyWith<BookingDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingDateCopyWith<$Res> {
  factory $BookingDateCopyWith(
          BookingDate value, $Res Function(BookingDate) then) =
      _$BookingDateCopyWithImpl<$Res, BookingDate>;
  @useResult
  $Res call({DateTime date, List<TimeSlotInfo> slots});
}

/// @nodoc
class _$BookingDateCopyWithImpl<$Res, $Val extends BookingDate>
    implements $BookingDateCopyWith<$Res> {
  _$BookingDateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? slots = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      slots: null == slots
          ? _value.slots
          : slots // ignore: cast_nullable_to_non_nullable
              as List<TimeSlotInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingDateImplCopyWith<$Res>
    implements $BookingDateCopyWith<$Res> {
  factory _$$BookingDateImplCopyWith(
          _$BookingDateImpl value, $Res Function(_$BookingDateImpl) then) =
      __$$BookingDateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, List<TimeSlotInfo> slots});
}

/// @nodoc
class __$$BookingDateImplCopyWithImpl<$Res>
    extends _$BookingDateCopyWithImpl<$Res, _$BookingDateImpl>
    implements _$$BookingDateImplCopyWith<$Res> {
  __$$BookingDateImplCopyWithImpl(
      _$BookingDateImpl _value, $Res Function(_$BookingDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? slots = null,
  }) {
    return _then(_$BookingDateImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      slots: null == slots
          ? _value._slots
          : slots // ignore: cast_nullable_to_non_nullable
              as List<TimeSlotInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingDateImpl extends _BookingDate {
  const _$BookingDateImpl(
      {required this.date, required final List<TimeSlotInfo> slots})
      : _slots = slots,
        super._();

  factory _$BookingDateImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingDateImplFromJson(json);

  @override
  final DateTime date;
  final List<TimeSlotInfo> _slots;
  @override
  List<TimeSlotInfo> get slots {
    if (_slots is EqualUnmodifiableListView) return _slots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_slots);
  }

  @override
  String toString() {
    return 'BookingDate(date: $date, slots: $slots)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingDateImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._slots, _slots));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, const DeepCollectionEquality().hash(_slots));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingDateImplCopyWith<_$BookingDateImpl> get copyWith =>
      __$$BookingDateImplCopyWithImpl<_$BookingDateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingDateImplToJson(
      this,
    );
  }
}

abstract class _BookingDate extends BookingDate {
  const factory _BookingDate(
      {required final DateTime date,
      required final List<TimeSlotInfo> slots}) = _$BookingDateImpl;
  const _BookingDate._() : super._();

  factory _BookingDate.fromJson(Map<String, dynamic> json) =
      _$BookingDateImpl.fromJson;

  @override
  DateTime get date;
  @override
  List<TimeSlotInfo> get slots;
  @override
  @JsonKey(ignore: true)
  _$$BookingDateImplCopyWith<_$BookingDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimeSlotInfo _$TimeSlotInfoFromJson(Map<String, dynamic> json) {
  return _TimeSlotInfo.fromJson(json);
}

/// @nodoc
mixin _$TimeSlotInfo {
  int get id => throw _privateConstructorUsedError;
  String get startTime => throw _privateConstructorUsedError;
  String get endTime => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  int? get availableCapacity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeSlotInfoCopyWith<TimeSlotInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeSlotInfoCopyWith<$Res> {
  factory $TimeSlotInfoCopyWith(
          TimeSlotInfo value, $Res Function(TimeSlotInfo) then) =
      _$TimeSlotInfoCopyWithImpl<$Res, TimeSlotInfo>;
  @useResult
  $Res call(
      {int id,
      String startTime,
      String endTime,
      bool isAvailable,
      int? availableCapacity});
}

/// @nodoc
class _$TimeSlotInfoCopyWithImpl<$Res, $Val extends TimeSlotInfo>
    implements $TimeSlotInfoCopyWith<$Res> {
  _$TimeSlotInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? isAvailable = null,
    Object? availableCapacity = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      availableCapacity: freezed == availableCapacity
          ? _value.availableCapacity
          : availableCapacity // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeSlotInfoImplCopyWith<$Res>
    implements $TimeSlotInfoCopyWith<$Res> {
  factory _$$TimeSlotInfoImplCopyWith(
          _$TimeSlotInfoImpl value, $Res Function(_$TimeSlotInfoImpl) then) =
      __$$TimeSlotInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String startTime,
      String endTime,
      bool isAvailable,
      int? availableCapacity});
}

/// @nodoc
class __$$TimeSlotInfoImplCopyWithImpl<$Res>
    extends _$TimeSlotInfoCopyWithImpl<$Res, _$TimeSlotInfoImpl>
    implements _$$TimeSlotInfoImplCopyWith<$Res> {
  __$$TimeSlotInfoImplCopyWithImpl(
      _$TimeSlotInfoImpl _value, $Res Function(_$TimeSlotInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? isAvailable = null,
    Object? availableCapacity = freezed,
  }) {
    return _then(_$TimeSlotInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      availableCapacity: freezed == availableCapacity
          ? _value.availableCapacity
          : availableCapacity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeSlotInfoImpl extends _TimeSlotInfo {
  const _$TimeSlotInfoImpl(
      {required this.id,
      required this.startTime,
      required this.endTime,
      required this.isAvailable,
      this.availableCapacity})
      : super._();

  factory _$TimeSlotInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeSlotInfoImplFromJson(json);

  @override
  final int id;
  @override
  final String startTime;
  @override
  final String endTime;
  @override
  final bool isAvailable;
  @override
  final int? availableCapacity;

  @override
  String toString() {
    return 'TimeSlotInfo(id: $id, startTime: $startTime, endTime: $endTime, isAvailable: $isAvailable, availableCapacity: $availableCapacity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeSlotInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.availableCapacity, availableCapacity) ||
                other.availableCapacity == availableCapacity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, startTime, endTime, isAvailable, availableCapacity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeSlotInfoImplCopyWith<_$TimeSlotInfoImpl> get copyWith =>
      __$$TimeSlotInfoImplCopyWithImpl<_$TimeSlotInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeSlotInfoImplToJson(
      this,
    );
  }
}

abstract class _TimeSlotInfo extends TimeSlotInfo {
  const factory _TimeSlotInfo(
      {required final int id,
      required final String startTime,
      required final String endTime,
      required final bool isAvailable,
      final int? availableCapacity}) = _$TimeSlotInfoImpl;
  const _TimeSlotInfo._() : super._();

  factory _TimeSlotInfo.fromJson(Map<String, dynamic> json) =
      _$TimeSlotInfoImpl.fromJson;

  @override
  int get id;
  @override
  String get startTime;
  @override
  String get endTime;
  @override
  bool get isAvailable;
  @override
  int? get availableCapacity;
  @override
  @JsonKey(ignore: true)
  _$$TimeSlotInfoImplCopyWith<_$TimeSlotInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
