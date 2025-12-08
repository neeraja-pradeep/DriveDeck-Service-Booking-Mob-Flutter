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
  int get shopId => throw _privateConstructorUsedError;
  List<String> get selectedServiceIds => throw _privateConstructorUsedError;
  List<String> get selectedPackageIds => throw _privateConstructorUsedError;
  List<String> get selectedAccessoryIds => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  int get timeSlotId => throw _privateConstructorUsedError;
  VehicleType get vehicleType => throw _privateConstructorUsedError;
  bool get pickupAndDelivery => throw _privateConstructorUsedError;
  String? get promoCode => throw _privateConstructorUsedError;
  String? get paymentMethod => throw _privateConstructorUsedError;
  String? get vehicleId => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

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
      {int shopId,
      List<String> selectedServiceIds,
      List<String> selectedPackageIds,
      List<String> selectedAccessoryIds,
      DateTime date,
      int timeSlotId,
      VehicleType vehicleType,
      bool pickupAndDelivery,
      String? promoCode,
      String? paymentMethod,
      String? vehicleId,
      String? notes});
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
    Object? selectedServiceIds = null,
    Object? selectedPackageIds = null,
    Object? selectedAccessoryIds = null,
    Object? date = null,
    Object? timeSlotId = null,
    Object? vehicleType = null,
    Object? pickupAndDelivery = null,
    Object? promoCode = freezed,
    Object? paymentMethod = freezed,
    Object? vehicleId = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      shopId: null == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
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
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      {int shopId,
      List<String> selectedServiceIds,
      List<String> selectedPackageIds,
      List<String> selectedAccessoryIds,
      DateTime date,
      int timeSlotId,
      VehicleType vehicleType,
      bool pickupAndDelivery,
      String? promoCode,
      String? paymentMethod,
      String? vehicleId,
      String? notes});
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
    Object? selectedServiceIds = null,
    Object? selectedPackageIds = null,
    Object? selectedAccessoryIds = null,
    Object? date = null,
    Object? timeSlotId = null,
    Object? vehicleType = null,
    Object? pickupAndDelivery = null,
    Object? promoCode = freezed,
    Object? paymentMethod = freezed,
    Object? vehicleId = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$BookingRequestImpl(
      shopId: null == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
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
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingRequestImpl implements _BookingRequest {
  const _$BookingRequestImpl(
      {required this.shopId,
      required final List<String> selectedServiceIds,
      required final List<String> selectedPackageIds,
      required final List<String> selectedAccessoryIds,
      required this.date,
      required this.timeSlotId,
      required this.vehicleType,
      this.pickupAndDelivery = false,
      this.promoCode,
      this.paymentMethod,
      this.vehicleId,
      this.notes})
      : _selectedServiceIds = selectedServiceIds,
        _selectedPackageIds = selectedPackageIds,
        _selectedAccessoryIds = selectedAccessoryIds;

  factory _$BookingRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingRequestImplFromJson(json);

  @override
  final int shopId;
  final List<String> _selectedServiceIds;
  @override
  List<String> get selectedServiceIds {
    if (_selectedServiceIds is EqualUnmodifiableListView)
      return _selectedServiceIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedServiceIds);
  }

  final List<String> _selectedPackageIds;
  @override
  List<String> get selectedPackageIds {
    if (_selectedPackageIds is EqualUnmodifiableListView)
      return _selectedPackageIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedPackageIds);
  }

  final List<String> _selectedAccessoryIds;
  @override
  List<String> get selectedAccessoryIds {
    if (_selectedAccessoryIds is EqualUnmodifiableListView)
      return _selectedAccessoryIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedAccessoryIds);
  }

  @override
  final DateTime date;
  @override
  final int timeSlotId;
  @override
  final VehicleType vehicleType;
  @override
  @JsonKey()
  final bool pickupAndDelivery;
  @override
  final String? promoCode;
  @override
  final String? paymentMethod;
  @override
  final String? vehicleId;
  @override
  final String? notes;

  @override
  String toString() {
    return 'BookingRequest(shopId: $shopId, selectedServiceIds: $selectedServiceIds, selectedPackageIds: $selectedPackageIds, selectedAccessoryIds: $selectedAccessoryIds, date: $date, timeSlotId: $timeSlotId, vehicleType: $vehicleType, pickupAndDelivery: $pickupAndDelivery, promoCode: $promoCode, paymentMethod: $paymentMethod, vehicleId: $vehicleId, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingRequestImpl &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            const DeepCollectionEquality()
                .equals(other._selectedServiceIds, _selectedServiceIds) &&
            const DeepCollectionEquality()
                .equals(other._selectedPackageIds, _selectedPackageIds) &&
            const DeepCollectionEquality()
                .equals(other._selectedAccessoryIds, _selectedAccessoryIds) &&
            (identical(other.date, date) || other.date == date) &&
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
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      shopId,
      const DeepCollectionEquality().hash(_selectedServiceIds),
      const DeepCollectionEquality().hash(_selectedPackageIds),
      const DeepCollectionEquality().hash(_selectedAccessoryIds),
      date,
      timeSlotId,
      vehicleType,
      pickupAndDelivery,
      promoCode,
      paymentMethod,
      vehicleId,
      notes);

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
      {required final int shopId,
      required final List<String> selectedServiceIds,
      required final List<String> selectedPackageIds,
      required final List<String> selectedAccessoryIds,
      required final DateTime date,
      required final int timeSlotId,
      required final VehicleType vehicleType,
      final bool pickupAndDelivery,
      final String? promoCode,
      final String? paymentMethod,
      final String? vehicleId,
      final String? notes}) = _$BookingRequestImpl;

  factory _BookingRequest.fromJson(Map<String, dynamic> json) =
      _$BookingRequestImpl.fromJson;

  @override
  int get shopId;
  @override
  List<String> get selectedServiceIds;
  @override
  List<String> get selectedPackageIds;
  @override
  List<String> get selectedAccessoryIds;
  @override
  DateTime get date;
  @override
  int get timeSlotId;
  @override
  VehicleType get vehicleType;
  @override
  bool get pickupAndDelivery;
  @override
  String? get promoCode;
  @override
  String? get paymentMethod;
  @override
  String? get vehicleId;
  @override
  String? get notes;
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
