// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_confirmation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookingConfirmation _$BookingConfirmationFromJson(Map<String, dynamic> json) {
  return _BookingConfirmation.fromJson(json);
}

/// @nodoc
mixin _$BookingConfirmation {
  int get bookingId => throw _privateConstructorUsedError;
  String get bookingReference => throw _privateConstructorUsedError;
  BookingStatus get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingConfirmationCopyWith<BookingConfirmation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingConfirmationCopyWith<$Res> {
  factory $BookingConfirmationCopyWith(
          BookingConfirmation value, $Res Function(BookingConfirmation) then) =
      _$BookingConfirmationCopyWithImpl<$Res, BookingConfirmation>;
  @useResult
  $Res call(
      {int bookingId,
      String bookingReference,
      BookingStatus status,
      DateTime createdAt,
      String? message});
}

/// @nodoc
class _$BookingConfirmationCopyWithImpl<$Res, $Val extends BookingConfirmation>
    implements $BookingConfirmationCopyWith<$Res> {
  _$BookingConfirmationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = null,
    Object? bookingReference = null,
    Object? status = null,
    Object? createdAt = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int,
      bookingReference: null == bookingReference
          ? _value.bookingReference
          : bookingReference // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BookingStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingConfirmationImplCopyWith<$Res>
    implements $BookingConfirmationCopyWith<$Res> {
  factory _$$BookingConfirmationImplCopyWith(_$BookingConfirmationImpl value,
          $Res Function(_$BookingConfirmationImpl) then) =
      __$$BookingConfirmationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int bookingId,
      String bookingReference,
      BookingStatus status,
      DateTime createdAt,
      String? message});
}

/// @nodoc
class __$$BookingConfirmationImplCopyWithImpl<$Res>
    extends _$BookingConfirmationCopyWithImpl<$Res, _$BookingConfirmationImpl>
    implements _$$BookingConfirmationImplCopyWith<$Res> {
  __$$BookingConfirmationImplCopyWithImpl(_$BookingConfirmationImpl _value,
      $Res Function(_$BookingConfirmationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = null,
    Object? bookingReference = null,
    Object? status = null,
    Object? createdAt = null,
    Object? message = freezed,
  }) {
    return _then(_$BookingConfirmationImpl(
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int,
      bookingReference: null == bookingReference
          ? _value.bookingReference
          : bookingReference // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BookingStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingConfirmationImpl implements _BookingConfirmation {
  const _$BookingConfirmationImpl(
      {required this.bookingId,
      required this.bookingReference,
      required this.status,
      required this.createdAt,
      this.message});

  factory _$BookingConfirmationImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingConfirmationImplFromJson(json);

  @override
  final int bookingId;
  @override
  final String bookingReference;
  @override
  final BookingStatus status;
  @override
  final DateTime createdAt;
  @override
  final String? message;

  @override
  String toString() {
    return 'BookingConfirmation(bookingId: $bookingId, bookingReference: $bookingReference, status: $status, createdAt: $createdAt, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingConfirmationImpl &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.bookingReference, bookingReference) ||
                other.bookingReference == bookingReference) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, bookingId, bookingReference, status, createdAt, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingConfirmationImplCopyWith<_$BookingConfirmationImpl> get copyWith =>
      __$$BookingConfirmationImplCopyWithImpl<_$BookingConfirmationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingConfirmationImplToJson(
      this,
    );
  }
}

abstract class _BookingConfirmation implements BookingConfirmation {
  const factory _BookingConfirmation(
      {required final int bookingId,
      required final String bookingReference,
      required final BookingStatus status,
      required final DateTime createdAt,
      final String? message}) = _$BookingConfirmationImpl;

  factory _BookingConfirmation.fromJson(Map<String, dynamic> json) =
      _$BookingConfirmationImpl.fromJson;

  @override
  int get bookingId;
  @override
  String get bookingReference;
  @override
  BookingStatus get status;
  @override
  DateTime get createdAt;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$BookingConfirmationImplCopyWith<_$BookingConfirmationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
