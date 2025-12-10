// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_slot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TimeSlot _$TimeSlotFromJson(Map<String, dynamic> json) {
  return _TimeSlot.fromJson(json);
}

/// @nodoc
mixin _$TimeSlot {
  String get id => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  String get displayTime => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeSlotCopyWith<TimeSlot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeSlotCopyWith<$Res> {
  factory $TimeSlotCopyWith(TimeSlot value, $Res Function(TimeSlot) then) =
      _$TimeSlotCopyWithImpl<$Res, TimeSlot>;
  @useResult
  $Res call(
      {String id,
      String time,
      String displayTime,
      bool isAvailable,
      bool isSelected});
}

/// @nodoc
class _$TimeSlotCopyWithImpl<$Res, $Val extends TimeSlot>
    implements $TimeSlotCopyWith<$Res> {
  _$TimeSlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? time = null,
    Object? displayTime = null,
    Object? isAvailable = null,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      displayTime: null == displayTime
          ? _value.displayTime
          : displayTime // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeSlotImplCopyWith<$Res>
    implements $TimeSlotCopyWith<$Res> {
  factory _$$TimeSlotImplCopyWith(
          _$TimeSlotImpl value, $Res Function(_$TimeSlotImpl) then) =
      __$$TimeSlotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String time,
      String displayTime,
      bool isAvailable,
      bool isSelected});
}

/// @nodoc
class __$$TimeSlotImplCopyWithImpl<$Res>
    extends _$TimeSlotCopyWithImpl<$Res, _$TimeSlotImpl>
    implements _$$TimeSlotImplCopyWith<$Res> {
  __$$TimeSlotImplCopyWithImpl(
      _$TimeSlotImpl _value, $Res Function(_$TimeSlotImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? time = null,
    Object? displayTime = null,
    Object? isAvailable = null,
    Object? isSelected = null,
  }) {
    return _then(_$TimeSlotImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      displayTime: null == displayTime
          ? _value.displayTime
          : displayTime // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeSlotImpl implements _TimeSlot {
  const _$TimeSlotImpl(
      {required this.id,
      required this.time,
      required this.displayTime,
      this.isAvailable = true,
      this.isSelected = false});

  factory _$TimeSlotImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeSlotImplFromJson(json);

  @override
  final String id;
  @override
  final String time;
  @override
  final String displayTime;
  @override
  @JsonKey()
  final bool isAvailable;
  @override
  @JsonKey()
  final bool isSelected;

  @override
  String toString() {
    return 'TimeSlot(id: $id, time: $time, displayTime: $displayTime, isAvailable: $isAvailable, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeSlotImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.displayTime, displayTime) ||
                other.displayTime == displayTime) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, time, displayTime, isAvailable, isSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeSlotImplCopyWith<_$TimeSlotImpl> get copyWith =>
      __$$TimeSlotImplCopyWithImpl<_$TimeSlotImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeSlotImplToJson(
      this,
    );
  }
}

abstract class _TimeSlot implements TimeSlot {
  const factory _TimeSlot(
      {required final String id,
      required final String time,
      required final String displayTime,
      final bool isAvailable,
      final bool isSelected}) = _$TimeSlotImpl;

  factory _TimeSlot.fromJson(Map<String, dynamic> json) =
      _$TimeSlotImpl.fromJson;

  @override
  String get id;
  @override
  String get time;
  @override
  String get displayTime;
  @override
  bool get isAvailable;
  @override
  bool get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$TimeSlotImplCopyWith<_$TimeSlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BookingDate _$BookingDateFromJson(Map<String, dynamic> json) {
  return _BookingDate.fromJson(json);
}

/// @nodoc
mixin _$BookingDate {
  DateTime get date => throw _privateConstructorUsedError;
  List<TimeSlot> get timeSlots => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;

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
  $Res call({DateTime date, List<TimeSlot> timeSlots, bool isAvailable});
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
    Object? timeSlots = null,
    Object? isAvailable = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeSlots: null == timeSlots
          ? _value.timeSlots
          : timeSlots // ignore: cast_nullable_to_non_nullable
              as List<TimeSlot>,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $Res call({DateTime date, List<TimeSlot> timeSlots, bool isAvailable});
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
    Object? timeSlots = null,
    Object? isAvailable = null,
  }) {
    return _then(_$BookingDateImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeSlots: null == timeSlots
          ? _value._timeSlots
          : timeSlots // ignore: cast_nullable_to_non_nullable
              as List<TimeSlot>,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingDateImpl implements _BookingDate {
  const _$BookingDateImpl(
      {required this.date,
      required final List<TimeSlot> timeSlots,
      this.isAvailable = true})
      : _timeSlots = timeSlots;

  factory _$BookingDateImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingDateImplFromJson(json);

  @override
  final DateTime date;
  final List<TimeSlot> _timeSlots;
  @override
  List<TimeSlot> get timeSlots {
    if (_timeSlots is EqualUnmodifiableListView) return _timeSlots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timeSlots);
  }

  @override
  @JsonKey()
  final bool isAvailable;

  @override
  String toString() {
    return 'BookingDate(date: $date, timeSlots: $timeSlots, isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingDateImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality()
                .equals(other._timeSlots, _timeSlots) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date,
      const DeepCollectionEquality().hash(_timeSlots), isAvailable);

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

abstract class _BookingDate implements BookingDate {
  const factory _BookingDate(
      {required final DateTime date,
      required final List<TimeSlot> timeSlots,
      final bool isAvailable}) = _$BookingDateImpl;

  factory _BookingDate.fromJson(Map<String, dynamic> json) =
      _$BookingDateImpl.fromJson;

  @override
  DateTime get date;
  @override
  List<TimeSlot> get timeSlots;
  @override
  bool get isAvailable;
  @override
  @JsonKey(ignore: true)
  _$$BookingDateImplCopyWith<_$BookingDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
