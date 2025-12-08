// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Failure {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) unknown,
    required TResult Function(String message, int? attemptsRemaining)
        invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) phoneNumberAlreadyExists,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) sessionExpired,
    required TResult Function(String message) accountNotFound,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        validation,
    required TResult Function(String message) parsing,
    required TResult Function(String message, String? code) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message, String? code) generic,
    required TResult Function(
            LocationPermissionStatus status, String message, String? code)
        locationPermissionDenied,
    required TResult Function(String message, String? code)
        locationServiceDisabled,
    required TResult Function(String message, String? code) locationFetch,
    required TResult Function(String message) bookingNotFound,
    required TResult Function(String message) bookingAlreadyCancelled,
    required TResult Function(String message, String? reason)
        cancellationNotAllowed,
    required TResult Function(String message) bookingFetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? unknown,
    TResult? Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? phoneNumberAlreadyExists,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? sessionExpired,
    TResult? Function(String message)? accountNotFound,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult? Function(String message)? parsing,
    TResult? Function(String message, String? code)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message, String? code)? generic,
    TResult? Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult? Function(String message, String? code)? locationServiceDisabled,
    TResult? Function(String message, String? code)? locationFetch,
    TResult? Function(String message)? bookingNotFound,
    TResult? Function(String message)? bookingAlreadyCancelled,
    TResult? Function(String message, String? reason)? cancellationNotAllowed,
    TResult? Function(String message)? bookingFetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? unknown,
    TResult Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? phoneNumberAlreadyExists,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? sessionExpired,
    TResult Function(String message)? accountNotFound,
    TResult Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult Function(String message)? parsing,
    TResult Function(String message, String? code)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message, String? code)? generic,
    TResult Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult Function(String message, String? code)? locationServiceDisabled,
    TResult Function(String message, String? code)? locationFetch,
    TResult Function(String message)? bookingNotFound,
    TResult Function(String message)? bookingAlreadyCancelled,
    TResult Function(String message, String? reason)? cancellationNotAllowed,
    TResult Function(String message)? bookingFetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidOtpFailure value) invalidOtp,
    required TResult Function(OtpExpiredFailure value) otpExpired,
    required TResult Function(PhoneNumberAlreadyExistsFailure value)
        phoneNumberAlreadyExists,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(AccountNotFoundFailure value) accountNotFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(_ParsingFailure value) parsing,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_NotFoundFailure value) notFound,
    required TResult Function(_PermissionFailure value) permission,
    required TResult Function(_GenericFailure value) generic,
    required TResult Function(_LocationPermissionDeniedFailure value)
        locationPermissionDenied,
    required TResult Function(_LocationServiceDisabledFailure value)
        locationServiceDisabled,
    required TResult Function(_LocationFetchFailure value) locationFetch,
    required TResult Function(BookingNotFoundFailure value) bookingNotFound,
    required TResult Function(BookingAlreadyCancelledFailure value)
        bookingAlreadyCancelled,
    required TResult Function(CancellationNotAllowedFailure value)
        cancellationNotAllowed,
    required TResult Function(BookingFetchFailure value) bookingFetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidOtpFailure value)? invalidOtp,
    TResult? Function(OtpExpiredFailure value)? otpExpired,
    TResult? Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(AccountNotFoundFailure value)? accountNotFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(_ParsingFailure value)? parsing,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_NotFoundFailure value)? notFound,
    TResult? Function(_PermissionFailure value)? permission,
    TResult? Function(_GenericFailure value)? generic,
    TResult? Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult? Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult? Function(_LocationFetchFailure value)? locationFetch,
    TResult? Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult? Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult? Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult? Function(BookingFetchFailure value)? bookingFetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidOtpFailure value)? invalidOtp,
    TResult Function(OtpExpiredFailure value)? otpExpired,
    TResult Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(AccountNotFoundFailure value)? accountNotFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(_ParsingFailure value)? parsing,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_NotFoundFailure value)? notFound,
    TResult Function(_PermissionFailure value)? permission,
    TResult Function(_GenericFailure value)? generic,
    TResult Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult Function(_LocationFetchFailure value)? locationFetch,
    TResult Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult Function(BookingFetchFailure value)? bookingFetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NetworkFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$NetworkFailureImplCopyWith(_$NetworkFailureImpl value,
          $Res Function(_$NetworkFailureImpl) then) =
      __$$NetworkFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NetworkFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NetworkFailureImpl>
    implements _$$NetworkFailureImplCopyWith<$Res> {
  __$$NetworkFailureImplCopyWithImpl(
      _$NetworkFailureImpl _value, $Res Function(_$NetworkFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NetworkFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NetworkFailureImpl extends NetworkFailure {
  const _$NetworkFailureImpl({this.message = 'Network error occurred'})
      : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.network(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkFailureImplCopyWith<_$NetworkFailureImpl> get copyWith =>
      __$$NetworkFailureImplCopyWithImpl<_$NetworkFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) unknown,
    required TResult Function(String message, int? attemptsRemaining)
        invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) phoneNumberAlreadyExists,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) sessionExpired,
    required TResult Function(String message) accountNotFound,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        validation,
    required TResult Function(String message) parsing,
    required TResult Function(String message, String? code) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message, String? code) generic,
    required TResult Function(
            LocationPermissionStatus status, String message, String? code)
        locationPermissionDenied,
    required TResult Function(String message, String? code)
        locationServiceDisabled,
    required TResult Function(String message, String? code) locationFetch,
    required TResult Function(String message) bookingNotFound,
    required TResult Function(String message) bookingAlreadyCancelled,
    required TResult Function(String message, String? reason)
        cancellationNotAllowed,
    required TResult Function(String message) bookingFetch,
  }) {
    return network(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? unknown,
    TResult? Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? phoneNumberAlreadyExists,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? sessionExpired,
    TResult? Function(String message)? accountNotFound,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult? Function(String message)? parsing,
    TResult? Function(String message, String? code)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message, String? code)? generic,
    TResult? Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult? Function(String message, String? code)? locationServiceDisabled,
    TResult? Function(String message, String? code)? locationFetch,
    TResult? Function(String message)? bookingNotFound,
    TResult? Function(String message)? bookingAlreadyCancelled,
    TResult? Function(String message, String? reason)? cancellationNotAllowed,
    TResult? Function(String message)? bookingFetch,
  }) {
    return network?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? unknown,
    TResult Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? phoneNumberAlreadyExists,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? sessionExpired,
    TResult Function(String message)? accountNotFound,
    TResult Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult Function(String message)? parsing,
    TResult Function(String message, String? code)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message, String? code)? generic,
    TResult Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult Function(String message, String? code)? locationServiceDisabled,
    TResult Function(String message, String? code)? locationFetch,
    TResult Function(String message)? bookingNotFound,
    TResult Function(String message)? bookingAlreadyCancelled,
    TResult Function(String message, String? reason)? cancellationNotAllowed,
    TResult Function(String message)? bookingFetch,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidOtpFailure value) invalidOtp,
    required TResult Function(OtpExpiredFailure value) otpExpired,
    required TResult Function(PhoneNumberAlreadyExistsFailure value)
        phoneNumberAlreadyExists,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(AccountNotFoundFailure value) accountNotFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(_ParsingFailure value) parsing,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_NotFoundFailure value) notFound,
    required TResult Function(_PermissionFailure value) permission,
    required TResult Function(_GenericFailure value) generic,
    required TResult Function(_LocationPermissionDeniedFailure value)
        locationPermissionDenied,
    required TResult Function(_LocationServiceDisabledFailure value)
        locationServiceDisabled,
    required TResult Function(_LocationFetchFailure value) locationFetch,
    required TResult Function(BookingNotFoundFailure value) bookingNotFound,
    required TResult Function(BookingAlreadyCancelledFailure value)
        bookingAlreadyCancelled,
    required TResult Function(CancellationNotAllowedFailure value)
        cancellationNotAllowed,
    required TResult Function(BookingFetchFailure value) bookingFetch,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidOtpFailure value)? invalidOtp,
    TResult? Function(OtpExpiredFailure value)? otpExpired,
    TResult? Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(AccountNotFoundFailure value)? accountNotFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(_ParsingFailure value)? parsing,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_NotFoundFailure value)? notFound,
    TResult? Function(_PermissionFailure value)? permission,
    TResult? Function(_GenericFailure value)? generic,
    TResult? Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult? Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult? Function(_LocationFetchFailure value)? locationFetch,
    TResult? Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult? Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult? Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult? Function(BookingFetchFailure value)? bookingFetch,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidOtpFailure value)? invalidOtp,
    TResult Function(OtpExpiredFailure value)? otpExpired,
    TResult Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(AccountNotFoundFailure value)? accountNotFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(_ParsingFailure value)? parsing,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_NotFoundFailure value)? notFound,
    TResult Function(_PermissionFailure value)? permission,
    TResult Function(_GenericFailure value)? generic,
    TResult Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult Function(_LocationFetchFailure value)? locationFetch,
    TResult Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult Function(BookingFetchFailure value)? bookingFetch,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class NetworkFailure extends Failure {
  const factory NetworkFailure({final String message}) = _$NetworkFailureImpl;
  const NetworkFailure._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$NetworkFailureImplCopyWith<_$NetworkFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ServerFailureImplCopyWith(
          _$ServerFailureImpl value, $Res Function(_$ServerFailureImpl) then) =
      __$$ServerFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, int? statusCode});
}

/// @nodoc
class __$$ServerFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ServerFailureImpl>
    implements _$$ServerFailureImplCopyWith<$Res> {
  __$$ServerFailureImplCopyWithImpl(
      _$ServerFailureImpl _value, $Res Function(_$ServerFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? statusCode = freezed,
  }) {
    return _then(_$ServerFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$ServerFailureImpl extends ServerFailure {
  const _$ServerFailureImpl({required this.message, this.statusCode})
      : super._();

  @override
  final String message;
  @override
  final int? statusCode;

  @override
  String toString() {
    return 'Failure.server(message: $message, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, statusCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      __$$ServerFailureImplCopyWithImpl<_$ServerFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) unknown,
    required TResult Function(String message, int? attemptsRemaining)
        invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) phoneNumberAlreadyExists,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) sessionExpired,
    required TResult Function(String message) accountNotFound,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        validation,
    required TResult Function(String message) parsing,
    required TResult Function(String message, String? code) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message, String? code) generic,
    required TResult Function(
            LocationPermissionStatus status, String message, String? code)
        locationPermissionDenied,
    required TResult Function(String message, String? code)
        locationServiceDisabled,
    required TResult Function(String message, String? code) locationFetch,
    required TResult Function(String message) bookingNotFound,
    required TResult Function(String message) bookingAlreadyCancelled,
    required TResult Function(String message, String? reason)
        cancellationNotAllowed,
    required TResult Function(String message) bookingFetch,
  }) {
    return server(message, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? unknown,
    TResult? Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? phoneNumberAlreadyExists,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? sessionExpired,
    TResult? Function(String message)? accountNotFound,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult? Function(String message)? parsing,
    TResult? Function(String message, String? code)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message, String? code)? generic,
    TResult? Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult? Function(String message, String? code)? locationServiceDisabled,
    TResult? Function(String message, String? code)? locationFetch,
    TResult? Function(String message)? bookingNotFound,
    TResult? Function(String message)? bookingAlreadyCancelled,
    TResult? Function(String message, String? reason)? cancellationNotAllowed,
    TResult? Function(String message)? bookingFetch,
  }) {
    return server?.call(message, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? unknown,
    TResult Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? phoneNumberAlreadyExists,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? sessionExpired,
    TResult Function(String message)? accountNotFound,
    TResult Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult Function(String message)? parsing,
    TResult Function(String message, String? code)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message, String? code)? generic,
    TResult Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult Function(String message, String? code)? locationServiceDisabled,
    TResult Function(String message, String? code)? locationFetch,
    TResult Function(String message)? bookingNotFound,
    TResult Function(String message)? bookingAlreadyCancelled,
    TResult Function(String message, String? reason)? cancellationNotAllowed,
    TResult Function(String message)? bookingFetch,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(message, statusCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidOtpFailure value) invalidOtp,
    required TResult Function(OtpExpiredFailure value) otpExpired,
    required TResult Function(PhoneNumberAlreadyExistsFailure value)
        phoneNumberAlreadyExists,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(AccountNotFoundFailure value) accountNotFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(_ParsingFailure value) parsing,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_NotFoundFailure value) notFound,
    required TResult Function(_PermissionFailure value) permission,
    required TResult Function(_GenericFailure value) generic,
    required TResult Function(_LocationPermissionDeniedFailure value)
        locationPermissionDenied,
    required TResult Function(_LocationServiceDisabledFailure value)
        locationServiceDisabled,
    required TResult Function(_LocationFetchFailure value) locationFetch,
    required TResult Function(BookingNotFoundFailure value) bookingNotFound,
    required TResult Function(BookingAlreadyCancelledFailure value)
        bookingAlreadyCancelled,
    required TResult Function(CancellationNotAllowedFailure value)
        cancellationNotAllowed,
    required TResult Function(BookingFetchFailure value) bookingFetch,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidOtpFailure value)? invalidOtp,
    TResult? Function(OtpExpiredFailure value)? otpExpired,
    TResult? Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(AccountNotFoundFailure value)? accountNotFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(_ParsingFailure value)? parsing,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_NotFoundFailure value)? notFound,
    TResult? Function(_PermissionFailure value)? permission,
    TResult? Function(_GenericFailure value)? generic,
    TResult? Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult? Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult? Function(_LocationFetchFailure value)? locationFetch,
    TResult? Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult? Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult? Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult? Function(BookingFetchFailure value)? bookingFetch,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidOtpFailure value)? invalidOtp,
    TResult Function(OtpExpiredFailure value)? otpExpired,
    TResult Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(AccountNotFoundFailure value)? accountNotFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(_ParsingFailure value)? parsing,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_NotFoundFailure value)? notFound,
    TResult Function(_PermissionFailure value)? permission,
    TResult Function(_GenericFailure value)? generic,
    TResult Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult Function(_LocationFetchFailure value)? locationFetch,
    TResult Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult Function(BookingFetchFailure value)? bookingFetch,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class ServerFailure extends Failure {
  const factory ServerFailure(
      {required final String message,
      final int? statusCode}) = _$ServerFailureImpl;
  const ServerFailure._() : super._();

  @override
  String get message;
  int? get statusCode;
  @override
  @JsonKey(ignore: true)
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CacheFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$CacheFailureImplCopyWith(
          _$CacheFailureImpl value, $Res Function(_$CacheFailureImpl) then) =
      __$$CacheFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CacheFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$CacheFailureImpl>
    implements _$$CacheFailureImplCopyWith<$Res> {
  __$$CacheFailureImplCopyWithImpl(
      _$CacheFailureImpl _value, $Res Function(_$CacheFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$CacheFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CacheFailureImpl extends CacheFailure {
  const _$CacheFailureImpl({this.message = 'Cache error occurred'}) : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.cache(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CacheFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CacheFailureImplCopyWith<_$CacheFailureImpl> get copyWith =>
      __$$CacheFailureImplCopyWithImpl<_$CacheFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) unknown,
    required TResult Function(String message, int? attemptsRemaining)
        invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) phoneNumberAlreadyExists,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) sessionExpired,
    required TResult Function(String message) accountNotFound,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        validation,
    required TResult Function(String message) parsing,
    required TResult Function(String message, String? code) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message, String? code) generic,
    required TResult Function(
            LocationPermissionStatus status, String message, String? code)
        locationPermissionDenied,
    required TResult Function(String message, String? code)
        locationServiceDisabled,
    required TResult Function(String message, String? code) locationFetch,
    required TResult Function(String message) bookingNotFound,
    required TResult Function(String message) bookingAlreadyCancelled,
    required TResult Function(String message, String? reason)
        cancellationNotAllowed,
    required TResult Function(String message) bookingFetch,
  }) {
    return cache(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? unknown,
    TResult? Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? phoneNumberAlreadyExists,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? sessionExpired,
    TResult? Function(String message)? accountNotFound,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult? Function(String message)? parsing,
    TResult? Function(String message, String? code)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message, String? code)? generic,
    TResult? Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult? Function(String message, String? code)? locationServiceDisabled,
    TResult? Function(String message, String? code)? locationFetch,
    TResult? Function(String message)? bookingNotFound,
    TResult? Function(String message)? bookingAlreadyCancelled,
    TResult? Function(String message, String? reason)? cancellationNotAllowed,
    TResult? Function(String message)? bookingFetch,
  }) {
    return cache?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? unknown,
    TResult Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? phoneNumberAlreadyExists,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? sessionExpired,
    TResult Function(String message)? accountNotFound,
    TResult Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult Function(String message)? parsing,
    TResult Function(String message, String? code)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message, String? code)? generic,
    TResult Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult Function(String message, String? code)? locationServiceDisabled,
    TResult Function(String message, String? code)? locationFetch,
    TResult Function(String message)? bookingNotFound,
    TResult Function(String message)? bookingAlreadyCancelled,
    TResult Function(String message, String? reason)? cancellationNotAllowed,
    TResult Function(String message)? bookingFetch,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidOtpFailure value) invalidOtp,
    required TResult Function(OtpExpiredFailure value) otpExpired,
    required TResult Function(PhoneNumberAlreadyExistsFailure value)
        phoneNumberAlreadyExists,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(AccountNotFoundFailure value) accountNotFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(_ParsingFailure value) parsing,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_NotFoundFailure value) notFound,
    required TResult Function(_PermissionFailure value) permission,
    required TResult Function(_GenericFailure value) generic,
    required TResult Function(_LocationPermissionDeniedFailure value)
        locationPermissionDenied,
    required TResult Function(_LocationServiceDisabledFailure value)
        locationServiceDisabled,
    required TResult Function(_LocationFetchFailure value) locationFetch,
    required TResult Function(BookingNotFoundFailure value) bookingNotFound,
    required TResult Function(BookingAlreadyCancelledFailure value)
        bookingAlreadyCancelled,
    required TResult Function(CancellationNotAllowedFailure value)
        cancellationNotAllowed,
    required TResult Function(BookingFetchFailure value) bookingFetch,
  }) {
    return cache(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidOtpFailure value)? invalidOtp,
    TResult? Function(OtpExpiredFailure value)? otpExpired,
    TResult? Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(AccountNotFoundFailure value)? accountNotFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(_ParsingFailure value)? parsing,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_NotFoundFailure value)? notFound,
    TResult? Function(_PermissionFailure value)? permission,
    TResult? Function(_GenericFailure value)? generic,
    TResult? Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult? Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult? Function(_LocationFetchFailure value)? locationFetch,
    TResult? Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult? Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult? Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult? Function(BookingFetchFailure value)? bookingFetch,
  }) {
    return cache?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidOtpFailure value)? invalidOtp,
    TResult Function(OtpExpiredFailure value)? otpExpired,
    TResult Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(AccountNotFoundFailure value)? accountNotFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(_ParsingFailure value)? parsing,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_NotFoundFailure value)? notFound,
    TResult Function(_PermissionFailure value)? permission,
    TResult Function(_GenericFailure value)? generic,
    TResult Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult Function(_LocationFetchFailure value)? locationFetch,
    TResult Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult Function(BookingFetchFailure value)? bookingFetch,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache(this);
    }
    return orElse();
  }
}

abstract class CacheFailure extends Failure {
  const factory CacheFailure({final String message}) = _$CacheFailureImpl;
  const CacheFailure._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$CacheFailureImplCopyWith<_$CacheFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$UnknownFailureImplCopyWith(_$UnknownFailureImpl value,
          $Res Function(_$UnknownFailureImpl) then) =
      __$$UnknownFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnknownFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnknownFailureImpl>
    implements _$$UnknownFailureImplCopyWith<$Res> {
  __$$UnknownFailureImplCopyWithImpl(
      _$UnknownFailureImpl _value, $Res Function(_$UnknownFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnknownFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnknownFailureImpl extends UnknownFailure {
  const _$UnknownFailureImpl({this.message = 'An unexpected error occurred'})
      : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.unknown(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownFailureImplCopyWith<_$UnknownFailureImpl> get copyWith =>
      __$$UnknownFailureImplCopyWithImpl<_$UnknownFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) unknown,
    required TResult Function(String message, int? attemptsRemaining)
        invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) phoneNumberAlreadyExists,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) sessionExpired,
    required TResult Function(String message) accountNotFound,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        validation,
    required TResult Function(String message) parsing,
    required TResult Function(String message, String? code) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message, String? code) generic,
    required TResult Function(
            LocationPermissionStatus status, String message, String? code)
        locationPermissionDenied,
    required TResult Function(String message, String? code)
        locationServiceDisabled,
    required TResult Function(String message, String? code) locationFetch,
    required TResult Function(String message) bookingNotFound,
    required TResult Function(String message) bookingAlreadyCancelled,
    required TResult Function(String message, String? reason)
        cancellationNotAllowed,
    required TResult Function(String message) bookingFetch,
  }) {
    return unknown(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? unknown,
    TResult? Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? phoneNumberAlreadyExists,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? sessionExpired,
    TResult? Function(String message)? accountNotFound,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult? Function(String message)? parsing,
    TResult? Function(String message, String? code)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message, String? code)? generic,
    TResult? Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult? Function(String message, String? code)? locationServiceDisabled,
    TResult? Function(String message, String? code)? locationFetch,
    TResult? Function(String message)? bookingNotFound,
    TResult? Function(String message)? bookingAlreadyCancelled,
    TResult? Function(String message, String? reason)? cancellationNotAllowed,
    TResult? Function(String message)? bookingFetch,
  }) {
    return unknown?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? unknown,
    TResult Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? phoneNumberAlreadyExists,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? sessionExpired,
    TResult Function(String message)? accountNotFound,
    TResult Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult Function(String message)? parsing,
    TResult Function(String message, String? code)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message, String? code)? generic,
    TResult Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult Function(String message, String? code)? locationServiceDisabled,
    TResult Function(String message, String? code)? locationFetch,
    TResult Function(String message)? bookingNotFound,
    TResult Function(String message)? bookingAlreadyCancelled,
    TResult Function(String message, String? reason)? cancellationNotAllowed,
    TResult Function(String message)? bookingFetch,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidOtpFailure value) invalidOtp,
    required TResult Function(OtpExpiredFailure value) otpExpired,
    required TResult Function(PhoneNumberAlreadyExistsFailure value)
        phoneNumberAlreadyExists,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(AccountNotFoundFailure value) accountNotFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(_ParsingFailure value) parsing,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_NotFoundFailure value) notFound,
    required TResult Function(_PermissionFailure value) permission,
    required TResult Function(_GenericFailure value) generic,
    required TResult Function(_LocationPermissionDeniedFailure value)
        locationPermissionDenied,
    required TResult Function(_LocationServiceDisabledFailure value)
        locationServiceDisabled,
    required TResult Function(_LocationFetchFailure value) locationFetch,
    required TResult Function(BookingNotFoundFailure value) bookingNotFound,
    required TResult Function(BookingAlreadyCancelledFailure value)
        bookingAlreadyCancelled,
    required TResult Function(CancellationNotAllowedFailure value)
        cancellationNotAllowed,
    required TResult Function(BookingFetchFailure value) bookingFetch,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidOtpFailure value)? invalidOtp,
    TResult? Function(OtpExpiredFailure value)? otpExpired,
    TResult? Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(AccountNotFoundFailure value)? accountNotFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(_ParsingFailure value)? parsing,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_NotFoundFailure value)? notFound,
    TResult? Function(_PermissionFailure value)? permission,
    TResult? Function(_GenericFailure value)? generic,
    TResult? Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult? Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult? Function(_LocationFetchFailure value)? locationFetch,
    TResult? Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult? Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult? Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult? Function(BookingFetchFailure value)? bookingFetch,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidOtpFailure value)? invalidOtp,
    TResult Function(OtpExpiredFailure value)? otpExpired,
    TResult Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(AccountNotFoundFailure value)? accountNotFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(_ParsingFailure value)? parsing,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_NotFoundFailure value)? notFound,
    TResult Function(_PermissionFailure value)? permission,
    TResult Function(_GenericFailure value)? generic,
    TResult Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult Function(_LocationFetchFailure value)? locationFetch,
    TResult Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult Function(BookingFetchFailure value)? bookingFetch,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UnknownFailure extends Failure {
  const factory UnknownFailure({final String message}) = _$UnknownFailureImpl;
  const UnknownFailure._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$UnknownFailureImplCopyWith<_$UnknownFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidOtpFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$InvalidOtpFailureImplCopyWith(_$InvalidOtpFailureImpl value,
          $Res Function(_$InvalidOtpFailureImpl) then) =
      __$$InvalidOtpFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, int? attemptsRemaining});
}

/// @nodoc
class __$$InvalidOtpFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$InvalidOtpFailureImpl>
    implements _$$InvalidOtpFailureImplCopyWith<$Res> {
  __$$InvalidOtpFailureImplCopyWithImpl(_$InvalidOtpFailureImpl _value,
      $Res Function(_$InvalidOtpFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? attemptsRemaining = freezed,
  }) {
    return _then(_$InvalidOtpFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      attemptsRemaining: freezed == attemptsRemaining
          ? _value.attemptsRemaining
          : attemptsRemaining // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$InvalidOtpFailureImpl extends InvalidOtpFailure {
  const _$InvalidOtpFailureImpl(
      {this.message = 'Invalid OTP code', this.attemptsRemaining})
      : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final int? attemptsRemaining;

  @override
  String toString() {
    return 'Failure.invalidOtp(message: $message, attemptsRemaining: $attemptsRemaining)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidOtpFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.attemptsRemaining, attemptsRemaining) ||
                other.attemptsRemaining == attemptsRemaining));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, attemptsRemaining);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidOtpFailureImplCopyWith<_$InvalidOtpFailureImpl> get copyWith =>
      __$$InvalidOtpFailureImplCopyWithImpl<_$InvalidOtpFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) unknown,
    required TResult Function(String message, int? attemptsRemaining)
        invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) phoneNumberAlreadyExists,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) sessionExpired,
    required TResult Function(String message) accountNotFound,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        validation,
    required TResult Function(String message) parsing,
    required TResult Function(String message, String? code) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message, String? code) generic,
    required TResult Function(
            LocationPermissionStatus status, String message, String? code)
        locationPermissionDenied,
    required TResult Function(String message, String? code)
        locationServiceDisabled,
    required TResult Function(String message, String? code) locationFetch,
    required TResult Function(String message) bookingNotFound,
    required TResult Function(String message) bookingAlreadyCancelled,
    required TResult Function(String message, String? reason)
        cancellationNotAllowed,
    required TResult Function(String message) bookingFetch,
  }) {
    return invalidOtp(message, attemptsRemaining);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? unknown,
    TResult? Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? phoneNumberAlreadyExists,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? sessionExpired,
    TResult? Function(String message)? accountNotFound,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult? Function(String message)? parsing,
    TResult? Function(String message, String? code)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message, String? code)? generic,
    TResult? Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult? Function(String message, String? code)? locationServiceDisabled,
    TResult? Function(String message, String? code)? locationFetch,
    TResult? Function(String message)? bookingNotFound,
    TResult? Function(String message)? bookingAlreadyCancelled,
    TResult? Function(String message, String? reason)? cancellationNotAllowed,
    TResult? Function(String message)? bookingFetch,
  }) {
    return invalidOtp?.call(message, attemptsRemaining);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? unknown,
    TResult Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? phoneNumberAlreadyExists,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? sessionExpired,
    TResult Function(String message)? accountNotFound,
    TResult Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult Function(String message)? parsing,
    TResult Function(String message, String? code)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message, String? code)? generic,
    TResult Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult Function(String message, String? code)? locationServiceDisabled,
    TResult Function(String message, String? code)? locationFetch,
    TResult Function(String message)? bookingNotFound,
    TResult Function(String message)? bookingAlreadyCancelled,
    TResult Function(String message, String? reason)? cancellationNotAllowed,
    TResult Function(String message)? bookingFetch,
    required TResult orElse(),
  }) {
    if (invalidOtp != null) {
      return invalidOtp(message, attemptsRemaining);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidOtpFailure value) invalidOtp,
    required TResult Function(OtpExpiredFailure value) otpExpired,
    required TResult Function(PhoneNumberAlreadyExistsFailure value)
        phoneNumberAlreadyExists,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(AccountNotFoundFailure value) accountNotFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(_ParsingFailure value) parsing,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_NotFoundFailure value) notFound,
    required TResult Function(_PermissionFailure value) permission,
    required TResult Function(_GenericFailure value) generic,
    required TResult Function(_LocationPermissionDeniedFailure value)
        locationPermissionDenied,
    required TResult Function(_LocationServiceDisabledFailure value)
        locationServiceDisabled,
    required TResult Function(_LocationFetchFailure value) locationFetch,
    required TResult Function(BookingNotFoundFailure value) bookingNotFound,
    required TResult Function(BookingAlreadyCancelledFailure value)
        bookingAlreadyCancelled,
    required TResult Function(CancellationNotAllowedFailure value)
        cancellationNotAllowed,
    required TResult Function(BookingFetchFailure value) bookingFetch,
  }) {
    return invalidOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidOtpFailure value)? invalidOtp,
    TResult? Function(OtpExpiredFailure value)? otpExpired,
    TResult? Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(AccountNotFoundFailure value)? accountNotFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(_ParsingFailure value)? parsing,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_NotFoundFailure value)? notFound,
    TResult? Function(_PermissionFailure value)? permission,
    TResult? Function(_GenericFailure value)? generic,
    TResult? Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult? Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult? Function(_LocationFetchFailure value)? locationFetch,
    TResult? Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult? Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult? Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult? Function(BookingFetchFailure value)? bookingFetch,
  }) {
    return invalidOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidOtpFailure value)? invalidOtp,
    TResult Function(OtpExpiredFailure value)? otpExpired,
    TResult Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(AccountNotFoundFailure value)? accountNotFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(_ParsingFailure value)? parsing,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_NotFoundFailure value)? notFound,
    TResult Function(_PermissionFailure value)? permission,
    TResult Function(_GenericFailure value)? generic,
    TResult Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult Function(_LocationFetchFailure value)? locationFetch,
    TResult Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult Function(BookingFetchFailure value)? bookingFetch,
    required TResult orElse(),
  }) {
    if (invalidOtp != null) {
      return invalidOtp(this);
    }
    return orElse();
  }
}

abstract class InvalidOtpFailure extends Failure {
  const factory InvalidOtpFailure(
      {final String message,
      final int? attemptsRemaining}) = _$InvalidOtpFailureImpl;
  const InvalidOtpFailure._() : super._();

  @override
  String get message;
  int? get attemptsRemaining;
  @override
  @JsonKey(ignore: true)
  _$$InvalidOtpFailureImplCopyWith<_$InvalidOtpFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OtpExpiredFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$OtpExpiredFailureImplCopyWith(_$OtpExpiredFailureImpl value,
          $Res Function(_$OtpExpiredFailureImpl) then) =
      __$$OtpExpiredFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$OtpExpiredFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$OtpExpiredFailureImpl>
    implements _$$OtpExpiredFailureImplCopyWith<$Res> {
  __$$OtpExpiredFailureImplCopyWithImpl(_$OtpExpiredFailureImpl _value,
      $Res Function(_$OtpExpiredFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$OtpExpiredFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OtpExpiredFailureImpl extends OtpExpiredFailure {
  const _$OtpExpiredFailureImpl(
      {this.message = 'OTP has expired. Please request a new one.'})
      : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.otpExpired(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpExpiredFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpExpiredFailureImplCopyWith<_$OtpExpiredFailureImpl> get copyWith =>
      __$$OtpExpiredFailureImplCopyWithImpl<_$OtpExpiredFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) unknown,
    required TResult Function(String message, int? attemptsRemaining)
        invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) phoneNumberAlreadyExists,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) sessionExpired,
    required TResult Function(String message) accountNotFound,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        validation,
    required TResult Function(String message) parsing,
    required TResult Function(String message, String? code) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message, String? code) generic,
    required TResult Function(
            LocationPermissionStatus status, String message, String? code)
        locationPermissionDenied,
    required TResult Function(String message, String? code)
        locationServiceDisabled,
    required TResult Function(String message, String? code) locationFetch,
    required TResult Function(String message) bookingNotFound,
    required TResult Function(String message) bookingAlreadyCancelled,
    required TResult Function(String message, String? reason)
        cancellationNotAllowed,
    required TResult Function(String message) bookingFetch,
  }) {
    return otpExpired(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? unknown,
    TResult? Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? phoneNumberAlreadyExists,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? sessionExpired,
    TResult? Function(String message)? accountNotFound,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult? Function(String message)? parsing,
    TResult? Function(String message, String? code)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message, String? code)? generic,
    TResult? Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult? Function(String message, String? code)? locationServiceDisabled,
    TResult? Function(String message, String? code)? locationFetch,
    TResult? Function(String message)? bookingNotFound,
    TResult? Function(String message)? bookingAlreadyCancelled,
    TResult? Function(String message, String? reason)? cancellationNotAllowed,
    TResult? Function(String message)? bookingFetch,
  }) {
    return otpExpired?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? unknown,
    TResult Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? phoneNumberAlreadyExists,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? sessionExpired,
    TResult Function(String message)? accountNotFound,
    TResult Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult Function(String message)? parsing,
    TResult Function(String message, String? code)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message, String? code)? generic,
    TResult Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult Function(String message, String? code)? locationServiceDisabled,
    TResult Function(String message, String? code)? locationFetch,
    TResult Function(String message)? bookingNotFound,
    TResult Function(String message)? bookingAlreadyCancelled,
    TResult Function(String message, String? reason)? cancellationNotAllowed,
    TResult Function(String message)? bookingFetch,
    required TResult orElse(),
  }) {
    if (otpExpired != null) {
      return otpExpired(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidOtpFailure value) invalidOtp,
    required TResult Function(OtpExpiredFailure value) otpExpired,
    required TResult Function(PhoneNumberAlreadyExistsFailure value)
        phoneNumberAlreadyExists,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(AccountNotFoundFailure value) accountNotFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(_ParsingFailure value) parsing,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_NotFoundFailure value) notFound,
    required TResult Function(_PermissionFailure value) permission,
    required TResult Function(_GenericFailure value) generic,
    required TResult Function(_LocationPermissionDeniedFailure value)
        locationPermissionDenied,
    required TResult Function(_LocationServiceDisabledFailure value)
        locationServiceDisabled,
    required TResult Function(_LocationFetchFailure value) locationFetch,
    required TResult Function(BookingNotFoundFailure value) bookingNotFound,
    required TResult Function(BookingAlreadyCancelledFailure value)
        bookingAlreadyCancelled,
    required TResult Function(CancellationNotAllowedFailure value)
        cancellationNotAllowed,
    required TResult Function(BookingFetchFailure value) bookingFetch,
  }) {
    return otpExpired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidOtpFailure value)? invalidOtp,
    TResult? Function(OtpExpiredFailure value)? otpExpired,
    TResult? Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(AccountNotFoundFailure value)? accountNotFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(_ParsingFailure value)? parsing,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_NotFoundFailure value)? notFound,
    TResult? Function(_PermissionFailure value)? permission,
    TResult? Function(_GenericFailure value)? generic,
    TResult? Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult? Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult? Function(_LocationFetchFailure value)? locationFetch,
    TResult? Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult? Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult? Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult? Function(BookingFetchFailure value)? bookingFetch,
  }) {
    return otpExpired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidOtpFailure value)? invalidOtp,
    TResult Function(OtpExpiredFailure value)? otpExpired,
    TResult Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(AccountNotFoundFailure value)? accountNotFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(_ParsingFailure value)? parsing,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_NotFoundFailure value)? notFound,
    TResult Function(_PermissionFailure value)? permission,
    TResult Function(_GenericFailure value)? generic,
    TResult Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult Function(_LocationFetchFailure value)? locationFetch,
    TResult Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult Function(BookingFetchFailure value)? bookingFetch,
    required TResult orElse(),
  }) {
    if (otpExpired != null) {
      return otpExpired(this);
    }
    return orElse();
  }
}

abstract class OtpExpiredFailure extends Failure {
  const factory OtpExpiredFailure({final String message}) =
      _$OtpExpiredFailureImpl;
  const OtpExpiredFailure._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$OtpExpiredFailureImplCopyWith<_$OtpExpiredFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PhoneNumberAlreadyExistsFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$PhoneNumberAlreadyExistsFailureImplCopyWith(
          _$PhoneNumberAlreadyExistsFailureImpl value,
          $Res Function(_$PhoneNumberAlreadyExistsFailureImpl) then) =
      __$$PhoneNumberAlreadyExistsFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$PhoneNumberAlreadyExistsFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$PhoneNumberAlreadyExistsFailureImpl>
    implements _$$PhoneNumberAlreadyExistsFailureImplCopyWith<$Res> {
  __$$PhoneNumberAlreadyExistsFailureImplCopyWithImpl(
      _$PhoneNumberAlreadyExistsFailureImpl _value,
      $Res Function(_$PhoneNumberAlreadyExistsFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$PhoneNumberAlreadyExistsFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PhoneNumberAlreadyExistsFailureImpl
    extends PhoneNumberAlreadyExistsFailure {
  const _$PhoneNumberAlreadyExistsFailureImpl(
      {this.message = 'This phone number is already registered'})
      : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.phoneNumberAlreadyExists(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneNumberAlreadyExistsFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneNumberAlreadyExistsFailureImplCopyWith<
          _$PhoneNumberAlreadyExistsFailureImpl>
      get copyWith => __$$PhoneNumberAlreadyExistsFailureImplCopyWithImpl<
          _$PhoneNumberAlreadyExistsFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) unknown,
    required TResult Function(String message, int? attemptsRemaining)
        invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) phoneNumberAlreadyExists,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) sessionExpired,
    required TResult Function(String message) accountNotFound,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        validation,
    required TResult Function(String message) parsing,
    required TResult Function(String message, String? code) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message, String? code) generic,
    required TResult Function(
            LocationPermissionStatus status, String message, String? code)
        locationPermissionDenied,
    required TResult Function(String message, String? code)
        locationServiceDisabled,
    required TResult Function(String message, String? code) locationFetch,
    required TResult Function(String message) bookingNotFound,
    required TResult Function(String message) bookingAlreadyCancelled,
    required TResult Function(String message, String? reason)
        cancellationNotAllowed,
    required TResult Function(String message) bookingFetch,
  }) {
    return phoneNumberAlreadyExists(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? unknown,
    TResult? Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? phoneNumberAlreadyExists,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? sessionExpired,
    TResult? Function(String message)? accountNotFound,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult? Function(String message)? parsing,
    TResult? Function(String message, String? code)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message, String? code)? generic,
    TResult? Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult? Function(String message, String? code)? locationServiceDisabled,
    TResult? Function(String message, String? code)? locationFetch,
    TResult? Function(String message)? bookingNotFound,
    TResult? Function(String message)? bookingAlreadyCancelled,
    TResult? Function(String message, String? reason)? cancellationNotAllowed,
    TResult? Function(String message)? bookingFetch,
  }) {
    return phoneNumberAlreadyExists?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? unknown,
    TResult Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? phoneNumberAlreadyExists,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? sessionExpired,
    TResult Function(String message)? accountNotFound,
    TResult Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult Function(String message)? parsing,
    TResult Function(String message, String? code)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message, String? code)? generic,
    TResult Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult Function(String message, String? code)? locationServiceDisabled,
    TResult Function(String message, String? code)? locationFetch,
    TResult Function(String message)? bookingNotFound,
    TResult Function(String message)? bookingAlreadyCancelled,
    TResult Function(String message, String? reason)? cancellationNotAllowed,
    TResult Function(String message)? bookingFetch,
    required TResult orElse(),
  }) {
    if (phoneNumberAlreadyExists != null) {
      return phoneNumberAlreadyExists(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidOtpFailure value) invalidOtp,
    required TResult Function(OtpExpiredFailure value) otpExpired,
    required TResult Function(PhoneNumberAlreadyExistsFailure value)
        phoneNumberAlreadyExists,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(AccountNotFoundFailure value) accountNotFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(_ParsingFailure value) parsing,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_NotFoundFailure value) notFound,
    required TResult Function(_PermissionFailure value) permission,
    required TResult Function(_GenericFailure value) generic,
    required TResult Function(_LocationPermissionDeniedFailure value)
        locationPermissionDenied,
    required TResult Function(_LocationServiceDisabledFailure value)
        locationServiceDisabled,
    required TResult Function(_LocationFetchFailure value) locationFetch,
    required TResult Function(BookingNotFoundFailure value) bookingNotFound,
    required TResult Function(BookingAlreadyCancelledFailure value)
        bookingAlreadyCancelled,
    required TResult Function(CancellationNotAllowedFailure value)
        cancellationNotAllowed,
    required TResult Function(BookingFetchFailure value) bookingFetch,
  }) {
    return phoneNumberAlreadyExists(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidOtpFailure value)? invalidOtp,
    TResult? Function(OtpExpiredFailure value)? otpExpired,
    TResult? Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(AccountNotFoundFailure value)? accountNotFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(_ParsingFailure value)? parsing,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_NotFoundFailure value)? notFound,
    TResult? Function(_PermissionFailure value)? permission,
    TResult? Function(_GenericFailure value)? generic,
    TResult? Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult? Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult? Function(_LocationFetchFailure value)? locationFetch,
    TResult? Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult? Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult? Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult? Function(BookingFetchFailure value)? bookingFetch,
  }) {
    return phoneNumberAlreadyExists?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidOtpFailure value)? invalidOtp,
    TResult Function(OtpExpiredFailure value)? otpExpired,
    TResult Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(AccountNotFoundFailure value)? accountNotFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(_ParsingFailure value)? parsing,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_NotFoundFailure value)? notFound,
    TResult Function(_PermissionFailure value)? permission,
    TResult Function(_GenericFailure value)? generic,
    TResult Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult Function(_LocationFetchFailure value)? locationFetch,
    TResult Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult Function(BookingFetchFailure value)? bookingFetch,
    required TResult orElse(),
  }) {
    if (phoneNumberAlreadyExists != null) {
      return phoneNumberAlreadyExists(this);
    }
    return orElse();
  }
}

abstract class PhoneNumberAlreadyExistsFailure extends Failure {
  const factory PhoneNumberAlreadyExistsFailure({final String message}) =
      _$PhoneNumberAlreadyExistsFailureImpl;
  const PhoneNumberAlreadyExistsFailure._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$PhoneNumberAlreadyExistsFailureImplCopyWith<
          _$PhoneNumberAlreadyExistsFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidCredentialsFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$InvalidCredentialsFailureImplCopyWith(
          _$InvalidCredentialsFailureImpl value,
          $Res Function(_$InvalidCredentialsFailureImpl) then) =
      __$$InvalidCredentialsFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$InvalidCredentialsFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$InvalidCredentialsFailureImpl>
    implements _$$InvalidCredentialsFailureImplCopyWith<$Res> {
  __$$InvalidCredentialsFailureImplCopyWithImpl(
      _$InvalidCredentialsFailureImpl _value,
      $Res Function(_$InvalidCredentialsFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$InvalidCredentialsFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InvalidCredentialsFailureImpl extends InvalidCredentialsFailure {
  const _$InvalidCredentialsFailureImpl({this.message = 'Invalid credentials'})
      : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.invalidCredentials(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidCredentialsFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidCredentialsFailureImplCopyWith<_$InvalidCredentialsFailureImpl>
      get copyWith => __$$InvalidCredentialsFailureImplCopyWithImpl<
          _$InvalidCredentialsFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) unknown,
    required TResult Function(String message, int? attemptsRemaining)
        invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) phoneNumberAlreadyExists,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) sessionExpired,
    required TResult Function(String message) accountNotFound,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        validation,
    required TResult Function(String message) parsing,
    required TResult Function(String message, String? code) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message, String? code) generic,
    required TResult Function(
            LocationPermissionStatus status, String message, String? code)
        locationPermissionDenied,
    required TResult Function(String message, String? code)
        locationServiceDisabled,
    required TResult Function(String message, String? code) locationFetch,
    required TResult Function(String message) bookingNotFound,
    required TResult Function(String message) bookingAlreadyCancelled,
    required TResult Function(String message, String? reason)
        cancellationNotAllowed,
    required TResult Function(String message) bookingFetch,
  }) {
    return invalidCredentials(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? unknown,
    TResult? Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? phoneNumberAlreadyExists,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? sessionExpired,
    TResult? Function(String message)? accountNotFound,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult? Function(String message)? parsing,
    TResult? Function(String message, String? code)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message, String? code)? generic,
    TResult? Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult? Function(String message, String? code)? locationServiceDisabled,
    TResult? Function(String message, String? code)? locationFetch,
    TResult? Function(String message)? bookingNotFound,
    TResult? Function(String message)? bookingAlreadyCancelled,
    TResult? Function(String message, String? reason)? cancellationNotAllowed,
    TResult? Function(String message)? bookingFetch,
  }) {
    return invalidCredentials?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? unknown,
    TResult Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? phoneNumberAlreadyExists,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? sessionExpired,
    TResult Function(String message)? accountNotFound,
    TResult Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult Function(String message)? parsing,
    TResult Function(String message, String? code)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message, String? code)? generic,
    TResult Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult Function(String message, String? code)? locationServiceDisabled,
    TResult Function(String message, String? code)? locationFetch,
    TResult Function(String message)? bookingNotFound,
    TResult Function(String message)? bookingAlreadyCancelled,
    TResult Function(String message, String? reason)? cancellationNotAllowed,
    TResult Function(String message)? bookingFetch,
    required TResult orElse(),
  }) {
    if (invalidCredentials != null) {
      return invalidCredentials(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidOtpFailure value) invalidOtp,
    required TResult Function(OtpExpiredFailure value) otpExpired,
    required TResult Function(PhoneNumberAlreadyExistsFailure value)
        phoneNumberAlreadyExists,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(AccountNotFoundFailure value) accountNotFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(_ParsingFailure value) parsing,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_NotFoundFailure value) notFound,
    required TResult Function(_PermissionFailure value) permission,
    required TResult Function(_GenericFailure value) generic,
    required TResult Function(_LocationPermissionDeniedFailure value)
        locationPermissionDenied,
    required TResult Function(_LocationServiceDisabledFailure value)
        locationServiceDisabled,
    required TResult Function(_LocationFetchFailure value) locationFetch,
    required TResult Function(BookingNotFoundFailure value) bookingNotFound,
    required TResult Function(BookingAlreadyCancelledFailure value)
        bookingAlreadyCancelled,
    required TResult Function(CancellationNotAllowedFailure value)
        cancellationNotAllowed,
    required TResult Function(BookingFetchFailure value) bookingFetch,
  }) {
    return invalidCredentials(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidOtpFailure value)? invalidOtp,
    TResult? Function(OtpExpiredFailure value)? otpExpired,
    TResult? Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(AccountNotFoundFailure value)? accountNotFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(_ParsingFailure value)? parsing,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_NotFoundFailure value)? notFound,
    TResult? Function(_PermissionFailure value)? permission,
    TResult? Function(_GenericFailure value)? generic,
    TResult? Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult? Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult? Function(_LocationFetchFailure value)? locationFetch,
    TResult? Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult? Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult? Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult? Function(BookingFetchFailure value)? bookingFetch,
  }) {
    return invalidCredentials?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidOtpFailure value)? invalidOtp,
    TResult Function(OtpExpiredFailure value)? otpExpired,
    TResult Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(AccountNotFoundFailure value)? accountNotFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(_ParsingFailure value)? parsing,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_NotFoundFailure value)? notFound,
    TResult Function(_PermissionFailure value)? permission,
    TResult Function(_GenericFailure value)? generic,
    TResult Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult Function(_LocationFetchFailure value)? locationFetch,
    TResult Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult Function(BookingFetchFailure value)? bookingFetch,
    required TResult orElse(),
  }) {
    if (invalidCredentials != null) {
      return invalidCredentials(this);
    }
    return orElse();
  }
}

abstract class InvalidCredentialsFailure extends Failure {
  const factory InvalidCredentialsFailure({final String message}) =
      _$InvalidCredentialsFailureImpl;
  const InvalidCredentialsFailure._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$InvalidCredentialsFailureImplCopyWith<_$InvalidCredentialsFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SessionExpiredFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$SessionExpiredFailureImplCopyWith(
          _$SessionExpiredFailureImpl value,
          $Res Function(_$SessionExpiredFailureImpl) then) =
      __$$SessionExpiredFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SessionExpiredFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$SessionExpiredFailureImpl>
    implements _$$SessionExpiredFailureImplCopyWith<$Res> {
  __$$SessionExpiredFailureImplCopyWithImpl(_$SessionExpiredFailureImpl _value,
      $Res Function(_$SessionExpiredFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SessionExpiredFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SessionExpiredFailureImpl extends SessionExpiredFailure {
  const _$SessionExpiredFailureImpl(
      {this.message = 'Your session has expired. Please login again.'})
      : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.sessionExpired(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionExpiredFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionExpiredFailureImplCopyWith<_$SessionExpiredFailureImpl>
      get copyWith => __$$SessionExpiredFailureImplCopyWithImpl<
          _$SessionExpiredFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) unknown,
    required TResult Function(String message, int? attemptsRemaining)
        invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) phoneNumberAlreadyExists,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) sessionExpired,
    required TResult Function(String message) accountNotFound,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        validation,
    required TResult Function(String message) parsing,
    required TResult Function(String message, String? code) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message, String? code) generic,
    required TResult Function(
            LocationPermissionStatus status, String message, String? code)
        locationPermissionDenied,
    required TResult Function(String message, String? code)
        locationServiceDisabled,
    required TResult Function(String message, String? code) locationFetch,
    required TResult Function(String message) bookingNotFound,
    required TResult Function(String message) bookingAlreadyCancelled,
    required TResult Function(String message, String? reason)
        cancellationNotAllowed,
    required TResult Function(String message) bookingFetch,
  }) {
    return sessionExpired(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? unknown,
    TResult? Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? phoneNumberAlreadyExists,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? sessionExpired,
    TResult? Function(String message)? accountNotFound,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult? Function(String message)? parsing,
    TResult? Function(String message, String? code)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message, String? code)? generic,
    TResult? Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult? Function(String message, String? code)? locationServiceDisabled,
    TResult? Function(String message, String? code)? locationFetch,
    TResult? Function(String message)? bookingNotFound,
    TResult? Function(String message)? bookingAlreadyCancelled,
    TResult? Function(String message, String? reason)? cancellationNotAllowed,
    TResult? Function(String message)? bookingFetch,
  }) {
    return sessionExpired?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? unknown,
    TResult Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? phoneNumberAlreadyExists,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? sessionExpired,
    TResult Function(String message)? accountNotFound,
    TResult Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult Function(String message)? parsing,
    TResult Function(String message, String? code)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message, String? code)? generic,
    TResult Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult Function(String message, String? code)? locationServiceDisabled,
    TResult Function(String message, String? code)? locationFetch,
    TResult Function(String message)? bookingNotFound,
    TResult Function(String message)? bookingAlreadyCancelled,
    TResult Function(String message, String? reason)? cancellationNotAllowed,
    TResult Function(String message)? bookingFetch,
    required TResult orElse(),
  }) {
    if (sessionExpired != null) {
      return sessionExpired(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidOtpFailure value) invalidOtp,
    required TResult Function(OtpExpiredFailure value) otpExpired,
    required TResult Function(PhoneNumberAlreadyExistsFailure value)
        phoneNumberAlreadyExists,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(AccountNotFoundFailure value) accountNotFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(_ParsingFailure value) parsing,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_NotFoundFailure value) notFound,
    required TResult Function(_PermissionFailure value) permission,
    required TResult Function(_GenericFailure value) generic,
    required TResult Function(_LocationPermissionDeniedFailure value)
        locationPermissionDenied,
    required TResult Function(_LocationServiceDisabledFailure value)
        locationServiceDisabled,
    required TResult Function(_LocationFetchFailure value) locationFetch,
    required TResult Function(BookingNotFoundFailure value) bookingNotFound,
    required TResult Function(BookingAlreadyCancelledFailure value)
        bookingAlreadyCancelled,
    required TResult Function(CancellationNotAllowedFailure value)
        cancellationNotAllowed,
    required TResult Function(BookingFetchFailure value) bookingFetch,
  }) {
    return sessionExpired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidOtpFailure value)? invalidOtp,
    TResult? Function(OtpExpiredFailure value)? otpExpired,
    TResult? Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(AccountNotFoundFailure value)? accountNotFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(_ParsingFailure value)? parsing,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_NotFoundFailure value)? notFound,
    TResult? Function(_PermissionFailure value)? permission,
    TResult? Function(_GenericFailure value)? generic,
    TResult? Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult? Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult? Function(_LocationFetchFailure value)? locationFetch,
    TResult? Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult? Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult? Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult? Function(BookingFetchFailure value)? bookingFetch,
  }) {
    return sessionExpired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidOtpFailure value)? invalidOtp,
    TResult Function(OtpExpiredFailure value)? otpExpired,
    TResult Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(AccountNotFoundFailure value)? accountNotFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(_ParsingFailure value)? parsing,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_NotFoundFailure value)? notFound,
    TResult Function(_PermissionFailure value)? permission,
    TResult Function(_GenericFailure value)? generic,
    TResult Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult Function(_LocationFetchFailure value)? locationFetch,
    TResult Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult Function(BookingFetchFailure value)? bookingFetch,
    required TResult orElse(),
  }) {
    if (sessionExpired != null) {
      return sessionExpired(this);
    }
    return orElse();
  }
}

abstract class SessionExpiredFailure extends Failure {
  const factory SessionExpiredFailure({final String message}) =
      _$SessionExpiredFailureImpl;
  const SessionExpiredFailure._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$SessionExpiredFailureImplCopyWith<_$SessionExpiredFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountNotFoundFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$AccountNotFoundFailureImplCopyWith(
          _$AccountNotFoundFailureImpl value,
          $Res Function(_$AccountNotFoundFailureImpl) then) =
      __$$AccountNotFoundFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AccountNotFoundFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$AccountNotFoundFailureImpl>
    implements _$$AccountNotFoundFailureImplCopyWith<$Res> {
  __$$AccountNotFoundFailureImplCopyWithImpl(
      _$AccountNotFoundFailureImpl _value,
      $Res Function(_$AccountNotFoundFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AccountNotFoundFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AccountNotFoundFailureImpl extends AccountNotFoundFailure {
  const _$AccountNotFoundFailureImpl({this.message = 'Account not found'})
      : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.accountNotFound(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountNotFoundFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountNotFoundFailureImplCopyWith<_$AccountNotFoundFailureImpl>
      get copyWith => __$$AccountNotFoundFailureImplCopyWithImpl<
          _$AccountNotFoundFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) unknown,
    required TResult Function(String message, int? attemptsRemaining)
        invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) phoneNumberAlreadyExists,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) sessionExpired,
    required TResult Function(String message) accountNotFound,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        validation,
    required TResult Function(String message) parsing,
    required TResult Function(String message, String? code) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message, String? code) generic,
    required TResult Function(
            LocationPermissionStatus status, String message, String? code)
        locationPermissionDenied,
    required TResult Function(String message, String? code)
        locationServiceDisabled,
    required TResult Function(String message, String? code) locationFetch,
    required TResult Function(String message) bookingNotFound,
    required TResult Function(String message) bookingAlreadyCancelled,
    required TResult Function(String message, String? reason)
        cancellationNotAllowed,
    required TResult Function(String message) bookingFetch,
  }) {
    return accountNotFound(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? unknown,
    TResult? Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? phoneNumberAlreadyExists,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? sessionExpired,
    TResult? Function(String message)? accountNotFound,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult? Function(String message)? parsing,
    TResult? Function(String message, String? code)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message, String? code)? generic,
    TResult? Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult? Function(String message, String? code)? locationServiceDisabled,
    TResult? Function(String message, String? code)? locationFetch,
    TResult? Function(String message)? bookingNotFound,
    TResult? Function(String message)? bookingAlreadyCancelled,
    TResult? Function(String message, String? reason)? cancellationNotAllowed,
    TResult? Function(String message)? bookingFetch,
  }) {
    return accountNotFound?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? unknown,
    TResult Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? phoneNumberAlreadyExists,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? sessionExpired,
    TResult Function(String message)? accountNotFound,
    TResult Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult Function(String message)? parsing,
    TResult Function(String message, String? code)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message, String? code)? generic,
    TResult Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult Function(String message, String? code)? locationServiceDisabled,
    TResult Function(String message, String? code)? locationFetch,
    TResult Function(String message)? bookingNotFound,
    TResult Function(String message)? bookingAlreadyCancelled,
    TResult Function(String message, String? reason)? cancellationNotAllowed,
    TResult Function(String message)? bookingFetch,
    required TResult orElse(),
  }) {
    if (accountNotFound != null) {
      return accountNotFound(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidOtpFailure value) invalidOtp,
    required TResult Function(OtpExpiredFailure value) otpExpired,
    required TResult Function(PhoneNumberAlreadyExistsFailure value)
        phoneNumberAlreadyExists,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(AccountNotFoundFailure value) accountNotFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(_ParsingFailure value) parsing,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_NotFoundFailure value) notFound,
    required TResult Function(_PermissionFailure value) permission,
    required TResult Function(_GenericFailure value) generic,
    required TResult Function(_LocationPermissionDeniedFailure value)
        locationPermissionDenied,
    required TResult Function(_LocationServiceDisabledFailure value)
        locationServiceDisabled,
    required TResult Function(_LocationFetchFailure value) locationFetch,
    required TResult Function(BookingNotFoundFailure value) bookingNotFound,
    required TResult Function(BookingAlreadyCancelledFailure value)
        bookingAlreadyCancelled,
    required TResult Function(CancellationNotAllowedFailure value)
        cancellationNotAllowed,
    required TResult Function(BookingFetchFailure value) bookingFetch,
  }) {
    return accountNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidOtpFailure value)? invalidOtp,
    TResult? Function(OtpExpiredFailure value)? otpExpired,
    TResult? Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(AccountNotFoundFailure value)? accountNotFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(_ParsingFailure value)? parsing,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_NotFoundFailure value)? notFound,
    TResult? Function(_PermissionFailure value)? permission,
    TResult? Function(_GenericFailure value)? generic,
    TResult? Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult? Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult? Function(_LocationFetchFailure value)? locationFetch,
    TResult? Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult? Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult? Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult? Function(BookingFetchFailure value)? bookingFetch,
  }) {
    return accountNotFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidOtpFailure value)? invalidOtp,
    TResult Function(OtpExpiredFailure value)? otpExpired,
    TResult Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(AccountNotFoundFailure value)? accountNotFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(_ParsingFailure value)? parsing,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_NotFoundFailure value)? notFound,
    TResult Function(_PermissionFailure value)? permission,
    TResult Function(_GenericFailure value)? generic,
    TResult Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult Function(_LocationFetchFailure value)? locationFetch,
    TResult Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult Function(BookingFetchFailure value)? bookingFetch,
    required TResult orElse(),
  }) {
    if (accountNotFound != null) {
      return accountNotFound(this);
    }
    return orElse();
  }
}

abstract class AccountNotFoundFailure extends Failure {
  const factory AccountNotFoundFailure({final String message}) =
      _$AccountNotFoundFailureImpl;
  const AccountNotFoundFailure._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$AccountNotFoundFailureImplCopyWith<_$AccountNotFoundFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidationFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ValidationFailureImplCopyWith(_$ValidationFailureImpl value,
          $Res Function(_$ValidationFailureImpl) then) =
      __$$ValidationFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Map<String, String>? fieldErrors});
}

/// @nodoc
class __$$ValidationFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ValidationFailureImpl>
    implements _$$ValidationFailureImplCopyWith<$Res> {
  __$$ValidationFailureImplCopyWithImpl(_$ValidationFailureImpl _value,
      $Res Function(_$ValidationFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? fieldErrors = freezed,
  }) {
    return _then(_$ValidationFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      fieldErrors: freezed == fieldErrors
          ? _value._fieldErrors
          : fieldErrors // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

/// @nodoc

class _$ValidationFailureImpl extends ValidationFailure {
  const _$ValidationFailureImpl(
      {required this.message, final Map<String, String>? fieldErrors})
      : _fieldErrors = fieldErrors,
        super._();

  @override
  final String message;
  final Map<String, String>? _fieldErrors;
  @override
  Map<String, String>? get fieldErrors {
    final value = _fieldErrors;
    if (value == null) return null;
    if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Failure.validation(message: $message, fieldErrors: $fieldErrors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._fieldErrors, _fieldErrors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_fieldErrors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationFailureImplCopyWith<_$ValidationFailureImpl> get copyWith =>
      __$$ValidationFailureImplCopyWithImpl<_$ValidationFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) unknown,
    required TResult Function(String message, int? attemptsRemaining)
        invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) phoneNumberAlreadyExists,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) sessionExpired,
    required TResult Function(String message) accountNotFound,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        validation,
    required TResult Function(String message) parsing,
    required TResult Function(String message, String? code) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message, String? code) generic,
    required TResult Function(
            LocationPermissionStatus status, String message, String? code)
        locationPermissionDenied,
    required TResult Function(String message, String? code)
        locationServiceDisabled,
    required TResult Function(String message, String? code) locationFetch,
    required TResult Function(String message) bookingNotFound,
    required TResult Function(String message) bookingAlreadyCancelled,
    required TResult Function(String message, String? reason)
        cancellationNotAllowed,
    required TResult Function(String message) bookingFetch,
  }) {
    return validation(message, fieldErrors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? unknown,
    TResult? Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? phoneNumberAlreadyExists,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? sessionExpired,
    TResult? Function(String message)? accountNotFound,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult? Function(String message)? parsing,
    TResult? Function(String message, String? code)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message, String? code)? generic,
    TResult? Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult? Function(String message, String? code)? locationServiceDisabled,
    TResult? Function(String message, String? code)? locationFetch,
    TResult? Function(String message)? bookingNotFound,
    TResult? Function(String message)? bookingAlreadyCancelled,
    TResult? Function(String message, String? reason)? cancellationNotAllowed,
    TResult? Function(String message)? bookingFetch,
  }) {
    return validation?.call(message, fieldErrors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? unknown,
    TResult Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? phoneNumberAlreadyExists,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? sessionExpired,
    TResult Function(String message)? accountNotFound,
    TResult Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult Function(String message)? parsing,
    TResult Function(String message, String? code)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message, String? code)? generic,
    TResult Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult Function(String message, String? code)? locationServiceDisabled,
    TResult Function(String message, String? code)? locationFetch,
    TResult Function(String message)? bookingNotFound,
    TResult Function(String message)? bookingAlreadyCancelled,
    TResult Function(String message, String? reason)? cancellationNotAllowed,
    TResult Function(String message)? bookingFetch,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(message, fieldErrors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidOtpFailure value) invalidOtp,
    required TResult Function(OtpExpiredFailure value) otpExpired,
    required TResult Function(PhoneNumberAlreadyExistsFailure value)
        phoneNumberAlreadyExists,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(AccountNotFoundFailure value) accountNotFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(_ParsingFailure value) parsing,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_NotFoundFailure value) notFound,
    required TResult Function(_PermissionFailure value) permission,
    required TResult Function(_GenericFailure value) generic,
    required TResult Function(_LocationPermissionDeniedFailure value)
        locationPermissionDenied,
    required TResult Function(_LocationServiceDisabledFailure value)
        locationServiceDisabled,
    required TResult Function(_LocationFetchFailure value) locationFetch,
    required TResult Function(BookingNotFoundFailure value) bookingNotFound,
    required TResult Function(BookingAlreadyCancelledFailure value)
        bookingAlreadyCancelled,
    required TResult Function(CancellationNotAllowedFailure value)
        cancellationNotAllowed,
    required TResult Function(BookingFetchFailure value) bookingFetch,
  }) {
    return validation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidOtpFailure value)? invalidOtp,
    TResult? Function(OtpExpiredFailure value)? otpExpired,
    TResult? Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(AccountNotFoundFailure value)? accountNotFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(_ParsingFailure value)? parsing,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_NotFoundFailure value)? notFound,
    TResult? Function(_PermissionFailure value)? permission,
    TResult? Function(_GenericFailure value)? generic,
    TResult? Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult? Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult? Function(_LocationFetchFailure value)? locationFetch,
    TResult? Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult? Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult? Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult? Function(BookingFetchFailure value)? bookingFetch,
  }) {
    return validation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidOtpFailure value)? invalidOtp,
    TResult Function(OtpExpiredFailure value)? otpExpired,
    TResult Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(AccountNotFoundFailure value)? accountNotFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(_ParsingFailure value)? parsing,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_NotFoundFailure value)? notFound,
    TResult Function(_PermissionFailure value)? permission,
    TResult Function(_GenericFailure value)? generic,
    TResult Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult Function(_LocationFetchFailure value)? locationFetch,
    TResult Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult Function(BookingFetchFailure value)? bookingFetch,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(this);
    }
    return orElse();
  }
}

abstract class ValidationFailure extends Failure {
  const factory ValidationFailure(
      {required final String message,
      final Map<String, String>? fieldErrors}) = _$ValidationFailureImpl;
  const ValidationFailure._() : super._();

  @override
  String get message;
  Map<String, String>? get fieldErrors;
  @override
  @JsonKey(ignore: true)
  _$$ValidationFailureImplCopyWith<_$ValidationFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParsingFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ParsingFailureImplCopyWith(_$ParsingFailureImpl value,
          $Res Function(_$ParsingFailureImpl) then) =
      __$$ParsingFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ParsingFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ParsingFailureImpl>
    implements _$$ParsingFailureImplCopyWith<$Res> {
  __$$ParsingFailureImplCopyWithImpl(
      _$ParsingFailureImpl _value, $Res Function(_$ParsingFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ParsingFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ParsingFailureImpl extends _ParsingFailure {
  const _$ParsingFailureImpl({this.message = 'Failed to parse data'})
      : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.parsing(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParsingFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParsingFailureImplCopyWith<_$ParsingFailureImpl> get copyWith =>
      __$$ParsingFailureImplCopyWithImpl<_$ParsingFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) unknown,
    required TResult Function(String message, int? attemptsRemaining)
        invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) phoneNumberAlreadyExists,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) sessionExpired,
    required TResult Function(String message) accountNotFound,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        validation,
    required TResult Function(String message) parsing,
    required TResult Function(String message, String? code) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message, String? code) generic,
    required TResult Function(
            LocationPermissionStatus status, String message, String? code)
        locationPermissionDenied,
    required TResult Function(String message, String? code)
        locationServiceDisabled,
    required TResult Function(String message, String? code) locationFetch,
    required TResult Function(String message) bookingNotFound,
    required TResult Function(String message) bookingAlreadyCancelled,
    required TResult Function(String message, String? reason)
        cancellationNotAllowed,
    required TResult Function(String message) bookingFetch,
  }) {
    return parsing(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? unknown,
    TResult? Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? phoneNumberAlreadyExists,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? sessionExpired,
    TResult? Function(String message)? accountNotFound,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult? Function(String message)? parsing,
    TResult? Function(String message, String? code)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message, String? code)? generic,
    TResult? Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult? Function(String message, String? code)? locationServiceDisabled,
    TResult? Function(String message, String? code)? locationFetch,
    TResult? Function(String message)? bookingNotFound,
    TResult? Function(String message)? bookingAlreadyCancelled,
    TResult? Function(String message, String? reason)? cancellationNotAllowed,
    TResult? Function(String message)? bookingFetch,
  }) {
    return parsing?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? unknown,
    TResult Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? phoneNumberAlreadyExists,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? sessionExpired,
    TResult Function(String message)? accountNotFound,
    TResult Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult Function(String message)? parsing,
    TResult Function(String message, String? code)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message, String? code)? generic,
    TResult Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult Function(String message, String? code)? locationServiceDisabled,
    TResult Function(String message, String? code)? locationFetch,
    TResult Function(String message)? bookingNotFound,
    TResult Function(String message)? bookingAlreadyCancelled,
    TResult Function(String message, String? reason)? cancellationNotAllowed,
    TResult Function(String message)? bookingFetch,
    required TResult orElse(),
  }) {
    if (parsing != null) {
      return parsing(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidOtpFailure value) invalidOtp,
    required TResult Function(OtpExpiredFailure value) otpExpired,
    required TResult Function(PhoneNumberAlreadyExistsFailure value)
        phoneNumberAlreadyExists,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(AccountNotFoundFailure value) accountNotFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(_ParsingFailure value) parsing,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_NotFoundFailure value) notFound,
    required TResult Function(_PermissionFailure value) permission,
    required TResult Function(_GenericFailure value) generic,
    required TResult Function(_LocationPermissionDeniedFailure value)
        locationPermissionDenied,
    required TResult Function(_LocationServiceDisabledFailure value)
        locationServiceDisabled,
    required TResult Function(_LocationFetchFailure value) locationFetch,
    required TResult Function(BookingNotFoundFailure value) bookingNotFound,
    required TResult Function(BookingAlreadyCancelledFailure value)
        bookingAlreadyCancelled,
    required TResult Function(CancellationNotAllowedFailure value)
        cancellationNotAllowed,
    required TResult Function(BookingFetchFailure value) bookingFetch,
  }) {
    return parsing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidOtpFailure value)? invalidOtp,
    TResult? Function(OtpExpiredFailure value)? otpExpired,
    TResult? Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(AccountNotFoundFailure value)? accountNotFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(_ParsingFailure value)? parsing,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_NotFoundFailure value)? notFound,
    TResult? Function(_PermissionFailure value)? permission,
    TResult? Function(_GenericFailure value)? generic,
    TResult? Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult? Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult? Function(_LocationFetchFailure value)? locationFetch,
    TResult? Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult? Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult? Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult? Function(BookingFetchFailure value)? bookingFetch,
  }) {
    return parsing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidOtpFailure value)? invalidOtp,
    TResult Function(OtpExpiredFailure value)? otpExpired,
    TResult Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(AccountNotFoundFailure value)? accountNotFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(_ParsingFailure value)? parsing,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_NotFoundFailure value)? notFound,
    TResult Function(_PermissionFailure value)? permission,
    TResult Function(_GenericFailure value)? generic,
    TResult Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult Function(_LocationFetchFailure value)? locationFetch,
    TResult Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult Function(BookingFetchFailure value)? bookingFetch,
    required TResult orElse(),
  }) {
    if (parsing != null) {
      return parsing(this);
    }
    return orElse();
  }
}

abstract class _ParsingFailure extends Failure {
  const factory _ParsingFailure({final String message}) = _$ParsingFailureImpl;
  const _ParsingFailure._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ParsingFailureImplCopyWith<_$ParsingFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthorizedFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$UnauthorizedFailureImplCopyWith(_$UnauthorizedFailureImpl value,
          $Res Function(_$UnauthorizedFailureImpl) then) =
      __$$UnauthorizedFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class __$$UnauthorizedFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnauthorizedFailureImpl>
    implements _$$UnauthorizedFailureImplCopyWith<$Res> {
  __$$UnauthorizedFailureImplCopyWithImpl(_$UnauthorizedFailureImpl _value,
      $Res Function(_$UnauthorizedFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
  }) {
    return _then(_$UnauthorizedFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnauthorizedFailureImpl extends _UnauthorizedFailure {
  const _$UnauthorizedFailureImpl(
      {this.message = 'Authentication required', this.code})
      : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? code;

  @override
  String toString() {
    return 'Failure.unauthorized(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthorizedFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthorizedFailureImplCopyWith<_$UnauthorizedFailureImpl> get copyWith =>
      __$$UnauthorizedFailureImplCopyWithImpl<_$UnauthorizedFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) unknown,
    required TResult Function(String message, int? attemptsRemaining)
        invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) phoneNumberAlreadyExists,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) sessionExpired,
    required TResult Function(String message) accountNotFound,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        validation,
    required TResult Function(String message) parsing,
    required TResult Function(String message, String? code) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message, String? code) generic,
    required TResult Function(
            LocationPermissionStatus status, String message, String? code)
        locationPermissionDenied,
    required TResult Function(String message, String? code)
        locationServiceDisabled,
    required TResult Function(String message, String? code) locationFetch,
    required TResult Function(String message) bookingNotFound,
    required TResult Function(String message) bookingAlreadyCancelled,
    required TResult Function(String message, String? reason)
        cancellationNotAllowed,
    required TResult Function(String message) bookingFetch,
  }) {
    return unauthorized(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? unknown,
    TResult? Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? phoneNumberAlreadyExists,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? sessionExpired,
    TResult? Function(String message)? accountNotFound,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult? Function(String message)? parsing,
    TResult? Function(String message, String? code)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message, String? code)? generic,
    TResult? Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult? Function(String message, String? code)? locationServiceDisabled,
    TResult? Function(String message, String? code)? locationFetch,
    TResult? Function(String message)? bookingNotFound,
    TResult? Function(String message)? bookingAlreadyCancelled,
    TResult? Function(String message, String? reason)? cancellationNotAllowed,
    TResult? Function(String message)? bookingFetch,
  }) {
    return unauthorized?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? unknown,
    TResult Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? phoneNumberAlreadyExists,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? sessionExpired,
    TResult Function(String message)? accountNotFound,
    TResult Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult Function(String message)? parsing,
    TResult Function(String message, String? code)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message, String? code)? generic,
    TResult Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult Function(String message, String? code)? locationServiceDisabled,
    TResult Function(String message, String? code)? locationFetch,
    TResult Function(String message)? bookingNotFound,
    TResult Function(String message)? bookingAlreadyCancelled,
    TResult Function(String message, String? reason)? cancellationNotAllowed,
    TResult Function(String message)? bookingFetch,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidOtpFailure value) invalidOtp,
    required TResult Function(OtpExpiredFailure value) otpExpired,
    required TResult Function(PhoneNumberAlreadyExistsFailure value)
        phoneNumberAlreadyExists,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(AccountNotFoundFailure value) accountNotFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(_ParsingFailure value) parsing,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_NotFoundFailure value) notFound,
    required TResult Function(_PermissionFailure value) permission,
    required TResult Function(_GenericFailure value) generic,
    required TResult Function(_LocationPermissionDeniedFailure value)
        locationPermissionDenied,
    required TResult Function(_LocationServiceDisabledFailure value)
        locationServiceDisabled,
    required TResult Function(_LocationFetchFailure value) locationFetch,
    required TResult Function(BookingNotFoundFailure value) bookingNotFound,
    required TResult Function(BookingAlreadyCancelledFailure value)
        bookingAlreadyCancelled,
    required TResult Function(CancellationNotAllowedFailure value)
        cancellationNotAllowed,
    required TResult Function(BookingFetchFailure value) bookingFetch,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidOtpFailure value)? invalidOtp,
    TResult? Function(OtpExpiredFailure value)? otpExpired,
    TResult? Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(AccountNotFoundFailure value)? accountNotFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(_ParsingFailure value)? parsing,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_NotFoundFailure value)? notFound,
    TResult? Function(_PermissionFailure value)? permission,
    TResult? Function(_GenericFailure value)? generic,
    TResult? Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult? Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult? Function(_LocationFetchFailure value)? locationFetch,
    TResult? Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult? Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult? Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult? Function(BookingFetchFailure value)? bookingFetch,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidOtpFailure value)? invalidOtp,
    TResult Function(OtpExpiredFailure value)? otpExpired,
    TResult Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(AccountNotFoundFailure value)? accountNotFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(_ParsingFailure value)? parsing,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_NotFoundFailure value)? notFound,
    TResult Function(_PermissionFailure value)? permission,
    TResult Function(_GenericFailure value)? generic,
    TResult Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult Function(_LocationFetchFailure value)? locationFetch,
    TResult Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult Function(BookingFetchFailure value)? bookingFetch,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class _UnauthorizedFailure extends Failure {
  const factory _UnauthorizedFailure(
      {final String message, final String? code}) = _$UnauthorizedFailureImpl;
  const _UnauthorizedFailure._() : super._();

  @override
  String get message;
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$UnauthorizedFailureImplCopyWith<_$UnauthorizedFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$NotFoundFailureImplCopyWith(_$NotFoundFailureImpl value,
          $Res Function(_$NotFoundFailureImpl) then) =
      __$$NotFoundFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NotFoundFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NotFoundFailureImpl>
    implements _$$NotFoundFailureImplCopyWith<$Res> {
  __$$NotFoundFailureImplCopyWithImpl(
      _$NotFoundFailureImpl _value, $Res Function(_$NotFoundFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NotFoundFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NotFoundFailureImpl extends _NotFoundFailure {
  const _$NotFoundFailureImpl({this.message = 'Resource not found'})
      : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.notFound(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundFailureImplCopyWith<_$NotFoundFailureImpl> get copyWith =>
      __$$NotFoundFailureImplCopyWithImpl<_$NotFoundFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) unknown,
    required TResult Function(String message, int? attemptsRemaining)
        invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) phoneNumberAlreadyExists,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) sessionExpired,
    required TResult Function(String message) accountNotFound,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        validation,
    required TResult Function(String message) parsing,
    required TResult Function(String message, String? code) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message, String? code) generic,
    required TResult Function(
            LocationPermissionStatus status, String message, String? code)
        locationPermissionDenied,
    required TResult Function(String message, String? code)
        locationServiceDisabled,
    required TResult Function(String message, String? code) locationFetch,
    required TResult Function(String message) bookingNotFound,
    required TResult Function(String message) bookingAlreadyCancelled,
    required TResult Function(String message, String? reason)
        cancellationNotAllowed,
    required TResult Function(String message) bookingFetch,
  }) {
    return notFound(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? unknown,
    TResult? Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? phoneNumberAlreadyExists,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? sessionExpired,
    TResult? Function(String message)? accountNotFound,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult? Function(String message)? parsing,
    TResult? Function(String message, String? code)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message, String? code)? generic,
    TResult? Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult? Function(String message, String? code)? locationServiceDisabled,
    TResult? Function(String message, String? code)? locationFetch,
    TResult? Function(String message)? bookingNotFound,
    TResult? Function(String message)? bookingAlreadyCancelled,
    TResult? Function(String message, String? reason)? cancellationNotAllowed,
    TResult? Function(String message)? bookingFetch,
  }) {
    return notFound?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? unknown,
    TResult Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? phoneNumberAlreadyExists,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? sessionExpired,
    TResult Function(String message)? accountNotFound,
    TResult Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult Function(String message)? parsing,
    TResult Function(String message, String? code)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message, String? code)? generic,
    TResult Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult Function(String message, String? code)? locationServiceDisabled,
    TResult Function(String message, String? code)? locationFetch,
    TResult Function(String message)? bookingNotFound,
    TResult Function(String message)? bookingAlreadyCancelled,
    TResult Function(String message, String? reason)? cancellationNotAllowed,
    TResult Function(String message)? bookingFetch,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidOtpFailure value) invalidOtp,
    required TResult Function(OtpExpiredFailure value) otpExpired,
    required TResult Function(PhoneNumberAlreadyExistsFailure value)
        phoneNumberAlreadyExists,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(AccountNotFoundFailure value) accountNotFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(_ParsingFailure value) parsing,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_NotFoundFailure value) notFound,
    required TResult Function(_PermissionFailure value) permission,
    required TResult Function(_GenericFailure value) generic,
    required TResult Function(_LocationPermissionDeniedFailure value)
        locationPermissionDenied,
    required TResult Function(_LocationServiceDisabledFailure value)
        locationServiceDisabled,
    required TResult Function(_LocationFetchFailure value) locationFetch,
    required TResult Function(BookingNotFoundFailure value) bookingNotFound,
    required TResult Function(BookingAlreadyCancelledFailure value)
        bookingAlreadyCancelled,
    required TResult Function(CancellationNotAllowedFailure value)
        cancellationNotAllowed,
    required TResult Function(BookingFetchFailure value) bookingFetch,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidOtpFailure value)? invalidOtp,
    TResult? Function(OtpExpiredFailure value)? otpExpired,
    TResult? Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(AccountNotFoundFailure value)? accountNotFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(_ParsingFailure value)? parsing,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_NotFoundFailure value)? notFound,
    TResult? Function(_PermissionFailure value)? permission,
    TResult? Function(_GenericFailure value)? generic,
    TResult? Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult? Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult? Function(_LocationFetchFailure value)? locationFetch,
    TResult? Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult? Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult? Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult? Function(BookingFetchFailure value)? bookingFetch,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidOtpFailure value)? invalidOtp,
    TResult Function(OtpExpiredFailure value)? otpExpired,
    TResult Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(AccountNotFoundFailure value)? accountNotFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(_ParsingFailure value)? parsing,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_NotFoundFailure value)? notFound,
    TResult Function(_PermissionFailure value)? permission,
    TResult Function(_GenericFailure value)? generic,
    TResult Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult Function(_LocationFetchFailure value)? locationFetch,
    TResult Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult Function(BookingFetchFailure value)? bookingFetch,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class _NotFoundFailure extends Failure {
  const factory _NotFoundFailure({final String message}) =
      _$NotFoundFailureImpl;
  const _NotFoundFailure._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$NotFoundFailureImplCopyWith<_$NotFoundFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PermissionFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$PermissionFailureImplCopyWith(_$PermissionFailureImpl value,
          $Res Function(_$PermissionFailureImpl) then) =
      __$$PermissionFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$PermissionFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$PermissionFailureImpl>
    implements _$$PermissionFailureImplCopyWith<$Res> {
  __$$PermissionFailureImplCopyWithImpl(_$PermissionFailureImpl _value,
      $Res Function(_$PermissionFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$PermissionFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PermissionFailureImpl extends _PermissionFailure {
  const _$PermissionFailureImpl({this.message = 'Permission denied'})
      : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.permission(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionFailureImplCopyWith<_$PermissionFailureImpl> get copyWith =>
      __$$PermissionFailureImplCopyWithImpl<_$PermissionFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) unknown,
    required TResult Function(String message, int? attemptsRemaining)
        invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) phoneNumberAlreadyExists,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) sessionExpired,
    required TResult Function(String message) accountNotFound,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        validation,
    required TResult Function(String message) parsing,
    required TResult Function(String message, String? code) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message, String? code) generic,
    required TResult Function(
            LocationPermissionStatus status, String message, String? code)
        locationPermissionDenied,
    required TResult Function(String message, String? code)
        locationServiceDisabled,
    required TResult Function(String message, String? code) locationFetch,
    required TResult Function(String message) bookingNotFound,
    required TResult Function(String message) bookingAlreadyCancelled,
    required TResult Function(String message, String? reason)
        cancellationNotAllowed,
    required TResult Function(String message) bookingFetch,
  }) {
    return permission(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? unknown,
    TResult? Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? phoneNumberAlreadyExists,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? sessionExpired,
    TResult? Function(String message)? accountNotFound,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult? Function(String message)? parsing,
    TResult? Function(String message, String? code)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message, String? code)? generic,
    TResult? Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult? Function(String message, String? code)? locationServiceDisabled,
    TResult? Function(String message, String? code)? locationFetch,
    TResult? Function(String message)? bookingNotFound,
    TResult? Function(String message)? bookingAlreadyCancelled,
    TResult? Function(String message, String? reason)? cancellationNotAllowed,
    TResult? Function(String message)? bookingFetch,
  }) {
    return permission?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? unknown,
    TResult Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? phoneNumberAlreadyExists,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? sessionExpired,
    TResult Function(String message)? accountNotFound,
    TResult Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult Function(String message)? parsing,
    TResult Function(String message, String? code)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message, String? code)? generic,
    TResult Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult Function(String message, String? code)? locationServiceDisabled,
    TResult Function(String message, String? code)? locationFetch,
    TResult Function(String message)? bookingNotFound,
    TResult Function(String message)? bookingAlreadyCancelled,
    TResult Function(String message, String? reason)? cancellationNotAllowed,
    TResult Function(String message)? bookingFetch,
    required TResult orElse(),
  }) {
    if (permission != null) {
      return permission(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidOtpFailure value) invalidOtp,
    required TResult Function(OtpExpiredFailure value) otpExpired,
    required TResult Function(PhoneNumberAlreadyExistsFailure value)
        phoneNumberAlreadyExists,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(AccountNotFoundFailure value) accountNotFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(_ParsingFailure value) parsing,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_NotFoundFailure value) notFound,
    required TResult Function(_PermissionFailure value) permission,
    required TResult Function(_GenericFailure value) generic,
    required TResult Function(_LocationPermissionDeniedFailure value)
        locationPermissionDenied,
    required TResult Function(_LocationServiceDisabledFailure value)
        locationServiceDisabled,
    required TResult Function(_LocationFetchFailure value) locationFetch,
    required TResult Function(BookingNotFoundFailure value) bookingNotFound,
    required TResult Function(BookingAlreadyCancelledFailure value)
        bookingAlreadyCancelled,
    required TResult Function(CancellationNotAllowedFailure value)
        cancellationNotAllowed,
    required TResult Function(BookingFetchFailure value) bookingFetch,
  }) {
    return permission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidOtpFailure value)? invalidOtp,
    TResult? Function(OtpExpiredFailure value)? otpExpired,
    TResult? Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(AccountNotFoundFailure value)? accountNotFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(_ParsingFailure value)? parsing,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_NotFoundFailure value)? notFound,
    TResult? Function(_PermissionFailure value)? permission,
    TResult? Function(_GenericFailure value)? generic,
    TResult? Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult? Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult? Function(_LocationFetchFailure value)? locationFetch,
    TResult? Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult? Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult? Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult? Function(BookingFetchFailure value)? bookingFetch,
  }) {
    return permission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidOtpFailure value)? invalidOtp,
    TResult Function(OtpExpiredFailure value)? otpExpired,
    TResult Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(AccountNotFoundFailure value)? accountNotFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(_ParsingFailure value)? parsing,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_NotFoundFailure value)? notFound,
    TResult Function(_PermissionFailure value)? permission,
    TResult Function(_GenericFailure value)? generic,
    TResult Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult Function(_LocationFetchFailure value)? locationFetch,
    TResult Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult Function(BookingFetchFailure value)? bookingFetch,
    required TResult orElse(),
  }) {
    if (permission != null) {
      return permission(this);
    }
    return orElse();
  }
}

abstract class _PermissionFailure extends Failure {
  const factory _PermissionFailure({final String message}) =
      _$PermissionFailureImpl;
  const _PermissionFailure._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$PermissionFailureImplCopyWith<_$PermissionFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenericFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$GenericFailureImplCopyWith(_$GenericFailureImpl value,
          $Res Function(_$GenericFailureImpl) then) =
      __$$GenericFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class __$$GenericFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$GenericFailureImpl>
    implements _$$GenericFailureImplCopyWith<$Res> {
  __$$GenericFailureImplCopyWithImpl(
      _$GenericFailureImpl _value, $Res Function(_$GenericFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
  }) {
    return _then(_$GenericFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GenericFailureImpl extends _GenericFailure {
  const _$GenericFailureImpl(
      {this.message = 'An unexpected error occurred', this.code})
      : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? code;

  @override
  String toString() {
    return 'Failure.generic(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenericFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenericFailureImplCopyWith<_$GenericFailureImpl> get copyWith =>
      __$$GenericFailureImplCopyWithImpl<_$GenericFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) unknown,
    required TResult Function(String message, int? attemptsRemaining)
        invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) phoneNumberAlreadyExists,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) sessionExpired,
    required TResult Function(String message) accountNotFound,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        validation,
    required TResult Function(String message) parsing,
    required TResult Function(String message, String? code) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message, String? code) generic,
    required TResult Function(
            LocationPermissionStatus status, String message, String? code)
        locationPermissionDenied,
    required TResult Function(String message, String? code)
        locationServiceDisabled,
    required TResult Function(String message, String? code) locationFetch,
    required TResult Function(String message) bookingNotFound,
    required TResult Function(String message) bookingAlreadyCancelled,
    required TResult Function(String message, String? reason)
        cancellationNotAllowed,
    required TResult Function(String message) bookingFetch,
  }) {
    return generic(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? unknown,
    TResult? Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? phoneNumberAlreadyExists,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? sessionExpired,
    TResult? Function(String message)? accountNotFound,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult? Function(String message)? parsing,
    TResult? Function(String message, String? code)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message, String? code)? generic,
    TResult? Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult? Function(String message, String? code)? locationServiceDisabled,
    TResult? Function(String message, String? code)? locationFetch,
    TResult? Function(String message)? bookingNotFound,
    TResult? Function(String message)? bookingAlreadyCancelled,
    TResult? Function(String message, String? reason)? cancellationNotAllowed,
    TResult? Function(String message)? bookingFetch,
  }) {
    return generic?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? unknown,
    TResult Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? phoneNumberAlreadyExists,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? sessionExpired,
    TResult Function(String message)? accountNotFound,
    TResult Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult Function(String message)? parsing,
    TResult Function(String message, String? code)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message, String? code)? generic,
    TResult Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult Function(String message, String? code)? locationServiceDisabled,
    TResult Function(String message, String? code)? locationFetch,
    TResult Function(String message)? bookingNotFound,
    TResult Function(String message)? bookingAlreadyCancelled,
    TResult Function(String message, String? reason)? cancellationNotAllowed,
    TResult Function(String message)? bookingFetch,
    required TResult orElse(),
  }) {
    if (generic != null) {
      return generic(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidOtpFailure value) invalidOtp,
    required TResult Function(OtpExpiredFailure value) otpExpired,
    required TResult Function(PhoneNumberAlreadyExistsFailure value)
        phoneNumberAlreadyExists,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(AccountNotFoundFailure value) accountNotFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(_ParsingFailure value) parsing,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_NotFoundFailure value) notFound,
    required TResult Function(_PermissionFailure value) permission,
    required TResult Function(_GenericFailure value) generic,
    required TResult Function(_LocationPermissionDeniedFailure value)
        locationPermissionDenied,
    required TResult Function(_LocationServiceDisabledFailure value)
        locationServiceDisabled,
    required TResult Function(_LocationFetchFailure value) locationFetch,
    required TResult Function(BookingNotFoundFailure value) bookingNotFound,
    required TResult Function(BookingAlreadyCancelledFailure value)
        bookingAlreadyCancelled,
    required TResult Function(CancellationNotAllowedFailure value)
        cancellationNotAllowed,
    required TResult Function(BookingFetchFailure value) bookingFetch,
  }) {
    return generic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidOtpFailure value)? invalidOtp,
    TResult? Function(OtpExpiredFailure value)? otpExpired,
    TResult? Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(AccountNotFoundFailure value)? accountNotFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(_ParsingFailure value)? parsing,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_NotFoundFailure value)? notFound,
    TResult? Function(_PermissionFailure value)? permission,
    TResult? Function(_GenericFailure value)? generic,
    TResult? Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult? Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult? Function(_LocationFetchFailure value)? locationFetch,
    TResult? Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult? Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult? Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult? Function(BookingFetchFailure value)? bookingFetch,
  }) {
    return generic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidOtpFailure value)? invalidOtp,
    TResult Function(OtpExpiredFailure value)? otpExpired,
    TResult Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(AccountNotFoundFailure value)? accountNotFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(_ParsingFailure value)? parsing,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_NotFoundFailure value)? notFound,
    TResult Function(_PermissionFailure value)? permission,
    TResult Function(_GenericFailure value)? generic,
    TResult Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult Function(_LocationFetchFailure value)? locationFetch,
    TResult Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult Function(BookingFetchFailure value)? bookingFetch,
    required TResult orElse(),
  }) {
    if (generic != null) {
      return generic(this);
    }
    return orElse();
  }
}

abstract class _GenericFailure extends Failure {
  const factory _GenericFailure({final String message, final String? code}) =
      _$GenericFailureImpl;
  const _GenericFailure._() : super._();

  @override
  String get message;
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$GenericFailureImplCopyWith<_$GenericFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocationPermissionDeniedFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$LocationPermissionDeniedFailureImplCopyWith(
          _$LocationPermissionDeniedFailureImpl value,
          $Res Function(_$LocationPermissionDeniedFailureImpl) then) =
      __$$LocationPermissionDeniedFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LocationPermissionStatus status, String message, String? code});
}

/// @nodoc
class __$$LocationPermissionDeniedFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$LocationPermissionDeniedFailureImpl>
    implements _$$LocationPermissionDeniedFailureImplCopyWith<$Res> {
  __$$LocationPermissionDeniedFailureImplCopyWithImpl(
      _$LocationPermissionDeniedFailureImpl _value,
      $Res Function(_$LocationPermissionDeniedFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? code = freezed,
  }) {
    return _then(_$LocationPermissionDeniedFailureImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LocationPermissionStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LocationPermissionDeniedFailureImpl
    extends _LocationPermissionDeniedFailure {
  const _$LocationPermissionDeniedFailureImpl(
      {required this.status,
      this.message = 'Location permission denied',
      this.code})
      : super._();

  @override
  final LocationPermissionStatus status;
  @override
  @JsonKey()
  final String message;
  @override
  final String? code;

  @override
  String toString() {
    return 'Failure.locationPermissionDenied(status: $status, message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationPermissionDeniedFailureImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationPermissionDeniedFailureImplCopyWith<
          _$LocationPermissionDeniedFailureImpl>
      get copyWith => __$$LocationPermissionDeniedFailureImplCopyWithImpl<
          _$LocationPermissionDeniedFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) unknown,
    required TResult Function(String message, int? attemptsRemaining)
        invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) phoneNumberAlreadyExists,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) sessionExpired,
    required TResult Function(String message) accountNotFound,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        validation,
    required TResult Function(String message) parsing,
    required TResult Function(String message, String? code) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message, String? code) generic,
    required TResult Function(
            LocationPermissionStatus status, String message, String? code)
        locationPermissionDenied,
    required TResult Function(String message, String? code)
        locationServiceDisabled,
    required TResult Function(String message, String? code) locationFetch,
    required TResult Function(String message) bookingNotFound,
    required TResult Function(String message) bookingAlreadyCancelled,
    required TResult Function(String message, String? reason)
        cancellationNotAllowed,
    required TResult Function(String message) bookingFetch,
  }) {
    return locationPermissionDenied(status, message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? unknown,
    TResult? Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? phoneNumberAlreadyExists,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? sessionExpired,
    TResult? Function(String message)? accountNotFound,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult? Function(String message)? parsing,
    TResult? Function(String message, String? code)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message, String? code)? generic,
    TResult? Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult? Function(String message, String? code)? locationServiceDisabled,
    TResult? Function(String message, String? code)? locationFetch,
    TResult? Function(String message)? bookingNotFound,
    TResult? Function(String message)? bookingAlreadyCancelled,
    TResult? Function(String message, String? reason)? cancellationNotAllowed,
    TResult? Function(String message)? bookingFetch,
  }) {
    return locationPermissionDenied?.call(status, message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? unknown,
    TResult Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? phoneNumberAlreadyExists,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? sessionExpired,
    TResult Function(String message)? accountNotFound,
    TResult Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult Function(String message)? parsing,
    TResult Function(String message, String? code)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message, String? code)? generic,
    TResult Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult Function(String message, String? code)? locationServiceDisabled,
    TResult Function(String message, String? code)? locationFetch,
    TResult Function(String message)? bookingNotFound,
    TResult Function(String message)? bookingAlreadyCancelled,
    TResult Function(String message, String? reason)? cancellationNotAllowed,
    TResult Function(String message)? bookingFetch,
    required TResult orElse(),
  }) {
    if (locationPermissionDenied != null) {
      return locationPermissionDenied(status, message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidOtpFailure value) invalidOtp,
    required TResult Function(OtpExpiredFailure value) otpExpired,
    required TResult Function(PhoneNumberAlreadyExistsFailure value)
        phoneNumberAlreadyExists,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(AccountNotFoundFailure value) accountNotFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(_ParsingFailure value) parsing,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_NotFoundFailure value) notFound,
    required TResult Function(_PermissionFailure value) permission,
    required TResult Function(_GenericFailure value) generic,
    required TResult Function(_LocationPermissionDeniedFailure value)
        locationPermissionDenied,
    required TResult Function(_LocationServiceDisabledFailure value)
        locationServiceDisabled,
    required TResult Function(_LocationFetchFailure value) locationFetch,
    required TResult Function(BookingNotFoundFailure value) bookingNotFound,
    required TResult Function(BookingAlreadyCancelledFailure value)
        bookingAlreadyCancelled,
    required TResult Function(CancellationNotAllowedFailure value)
        cancellationNotAllowed,
    required TResult Function(BookingFetchFailure value) bookingFetch,
  }) {
    return locationPermissionDenied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidOtpFailure value)? invalidOtp,
    TResult? Function(OtpExpiredFailure value)? otpExpired,
    TResult? Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(AccountNotFoundFailure value)? accountNotFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(_ParsingFailure value)? parsing,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_NotFoundFailure value)? notFound,
    TResult? Function(_PermissionFailure value)? permission,
    TResult? Function(_GenericFailure value)? generic,
    TResult? Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult? Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult? Function(_LocationFetchFailure value)? locationFetch,
    TResult? Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult? Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult? Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult? Function(BookingFetchFailure value)? bookingFetch,
  }) {
    return locationPermissionDenied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidOtpFailure value)? invalidOtp,
    TResult Function(OtpExpiredFailure value)? otpExpired,
    TResult Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(AccountNotFoundFailure value)? accountNotFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(_ParsingFailure value)? parsing,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_NotFoundFailure value)? notFound,
    TResult Function(_PermissionFailure value)? permission,
    TResult Function(_GenericFailure value)? generic,
    TResult Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult Function(_LocationFetchFailure value)? locationFetch,
    TResult Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult Function(BookingFetchFailure value)? bookingFetch,
    required TResult orElse(),
  }) {
    if (locationPermissionDenied != null) {
      return locationPermissionDenied(this);
    }
    return orElse();
  }
}

abstract class _LocationPermissionDeniedFailure extends Failure {
  const factory _LocationPermissionDeniedFailure(
      {required final LocationPermissionStatus status,
      final String message,
      final String? code}) = _$LocationPermissionDeniedFailureImpl;
  const _LocationPermissionDeniedFailure._() : super._();

  LocationPermissionStatus get status;
  @override
  String get message;
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$LocationPermissionDeniedFailureImplCopyWith<
          _$LocationPermissionDeniedFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocationServiceDisabledFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$LocationServiceDisabledFailureImplCopyWith(
          _$LocationServiceDisabledFailureImpl value,
          $Res Function(_$LocationServiceDisabledFailureImpl) then) =
      __$$LocationServiceDisabledFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class __$$LocationServiceDisabledFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$LocationServiceDisabledFailureImpl>
    implements _$$LocationServiceDisabledFailureImplCopyWith<$Res> {
  __$$LocationServiceDisabledFailureImplCopyWithImpl(
      _$LocationServiceDisabledFailureImpl _value,
      $Res Function(_$LocationServiceDisabledFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
  }) {
    return _then(_$LocationServiceDisabledFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LocationServiceDisabledFailureImpl
    extends _LocationServiceDisabledFailure {
  const _$LocationServiceDisabledFailureImpl(
      {this.message = 'Location service disabled', this.code})
      : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? code;

  @override
  String toString() {
    return 'Failure.locationServiceDisabled(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationServiceDisabledFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationServiceDisabledFailureImplCopyWith<
          _$LocationServiceDisabledFailureImpl>
      get copyWith => __$$LocationServiceDisabledFailureImplCopyWithImpl<
          _$LocationServiceDisabledFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) unknown,
    required TResult Function(String message, int? attemptsRemaining)
        invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) phoneNumberAlreadyExists,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) sessionExpired,
    required TResult Function(String message) accountNotFound,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        validation,
    required TResult Function(String message) parsing,
    required TResult Function(String message, String? code) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message, String? code) generic,
    required TResult Function(
            LocationPermissionStatus status, String message, String? code)
        locationPermissionDenied,
    required TResult Function(String message, String? code)
        locationServiceDisabled,
    required TResult Function(String message, String? code) locationFetch,
    required TResult Function(String message) bookingNotFound,
    required TResult Function(String message) bookingAlreadyCancelled,
    required TResult Function(String message, String? reason)
        cancellationNotAllowed,
    required TResult Function(String message) bookingFetch,
  }) {
    return locationServiceDisabled(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? unknown,
    TResult? Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? phoneNumberAlreadyExists,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? sessionExpired,
    TResult? Function(String message)? accountNotFound,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult? Function(String message)? parsing,
    TResult? Function(String message, String? code)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message, String? code)? generic,
    TResult? Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult? Function(String message, String? code)? locationServiceDisabled,
    TResult? Function(String message, String? code)? locationFetch,
    TResult? Function(String message)? bookingNotFound,
    TResult? Function(String message)? bookingAlreadyCancelled,
    TResult? Function(String message, String? reason)? cancellationNotAllowed,
    TResult? Function(String message)? bookingFetch,
  }) {
    return locationServiceDisabled?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? unknown,
    TResult Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? phoneNumberAlreadyExists,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? sessionExpired,
    TResult Function(String message)? accountNotFound,
    TResult Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult Function(String message)? parsing,
    TResult Function(String message, String? code)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message, String? code)? generic,
    TResult Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult Function(String message, String? code)? locationServiceDisabled,
    TResult Function(String message, String? code)? locationFetch,
    TResult Function(String message)? bookingNotFound,
    TResult Function(String message)? bookingAlreadyCancelled,
    TResult Function(String message, String? reason)? cancellationNotAllowed,
    TResult Function(String message)? bookingFetch,
    required TResult orElse(),
  }) {
    if (locationServiceDisabled != null) {
      return locationServiceDisabled(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidOtpFailure value) invalidOtp,
    required TResult Function(OtpExpiredFailure value) otpExpired,
    required TResult Function(PhoneNumberAlreadyExistsFailure value)
        phoneNumberAlreadyExists,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(AccountNotFoundFailure value) accountNotFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(_ParsingFailure value) parsing,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_NotFoundFailure value) notFound,
    required TResult Function(_PermissionFailure value) permission,
    required TResult Function(_GenericFailure value) generic,
    required TResult Function(_LocationPermissionDeniedFailure value)
        locationPermissionDenied,
    required TResult Function(_LocationServiceDisabledFailure value)
        locationServiceDisabled,
    required TResult Function(_LocationFetchFailure value) locationFetch,
    required TResult Function(BookingNotFoundFailure value) bookingNotFound,
    required TResult Function(BookingAlreadyCancelledFailure value)
        bookingAlreadyCancelled,
    required TResult Function(CancellationNotAllowedFailure value)
        cancellationNotAllowed,
    required TResult Function(BookingFetchFailure value) bookingFetch,
  }) {
    return locationServiceDisabled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidOtpFailure value)? invalidOtp,
    TResult? Function(OtpExpiredFailure value)? otpExpired,
    TResult? Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(AccountNotFoundFailure value)? accountNotFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(_ParsingFailure value)? parsing,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_NotFoundFailure value)? notFound,
    TResult? Function(_PermissionFailure value)? permission,
    TResult? Function(_GenericFailure value)? generic,
    TResult? Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult? Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult? Function(_LocationFetchFailure value)? locationFetch,
    TResult? Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult? Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult? Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult? Function(BookingFetchFailure value)? bookingFetch,
  }) {
    return locationServiceDisabled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidOtpFailure value)? invalidOtp,
    TResult Function(OtpExpiredFailure value)? otpExpired,
    TResult Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(AccountNotFoundFailure value)? accountNotFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(_ParsingFailure value)? parsing,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_NotFoundFailure value)? notFound,
    TResult Function(_PermissionFailure value)? permission,
    TResult Function(_GenericFailure value)? generic,
    TResult Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult Function(_LocationFetchFailure value)? locationFetch,
    TResult Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult Function(BookingFetchFailure value)? bookingFetch,
    required TResult orElse(),
  }) {
    if (locationServiceDisabled != null) {
      return locationServiceDisabled(this);
    }
    return orElse();
  }
}

abstract class _LocationServiceDisabledFailure extends Failure {
  const factory _LocationServiceDisabledFailure(
      {final String message,
      final String? code}) = _$LocationServiceDisabledFailureImpl;
  const _LocationServiceDisabledFailure._() : super._();

  @override
  String get message;
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$LocationServiceDisabledFailureImplCopyWith<
          _$LocationServiceDisabledFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocationFetchFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$LocationFetchFailureImplCopyWith(_$LocationFetchFailureImpl value,
          $Res Function(_$LocationFetchFailureImpl) then) =
      __$$LocationFetchFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class __$$LocationFetchFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$LocationFetchFailureImpl>
    implements _$$LocationFetchFailureImplCopyWith<$Res> {
  __$$LocationFetchFailureImplCopyWithImpl(_$LocationFetchFailureImpl _value,
      $Res Function(_$LocationFetchFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
  }) {
    return _then(_$LocationFetchFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LocationFetchFailureImpl extends _LocationFetchFailure {
  const _$LocationFetchFailureImpl({required this.message, this.code})
      : super._();

  @override
  final String message;
  @override
  final String? code;

  @override
  String toString() {
    return 'Failure.locationFetch(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationFetchFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationFetchFailureImplCopyWith<_$LocationFetchFailureImpl>
      get copyWith =>
          __$$LocationFetchFailureImplCopyWithImpl<_$LocationFetchFailureImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) unknown,
    required TResult Function(String message, int? attemptsRemaining)
        invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) phoneNumberAlreadyExists,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) sessionExpired,
    required TResult Function(String message) accountNotFound,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        validation,
    required TResult Function(String message) parsing,
    required TResult Function(String message, String? code) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message, String? code) generic,
    required TResult Function(
            LocationPermissionStatus status, String message, String? code)
        locationPermissionDenied,
    required TResult Function(String message, String? code)
        locationServiceDisabled,
    required TResult Function(String message, String? code) locationFetch,
    required TResult Function(String message) bookingNotFound,
    required TResult Function(String message) bookingAlreadyCancelled,
    required TResult Function(String message, String? reason)
        cancellationNotAllowed,
    required TResult Function(String message) bookingFetch,
  }) {
    return locationFetch(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? unknown,
    TResult? Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? phoneNumberAlreadyExists,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? sessionExpired,
    TResult? Function(String message)? accountNotFound,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult? Function(String message)? parsing,
    TResult? Function(String message, String? code)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message, String? code)? generic,
    TResult? Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult? Function(String message, String? code)? locationServiceDisabled,
    TResult? Function(String message, String? code)? locationFetch,
    TResult? Function(String message)? bookingNotFound,
    TResult? Function(String message)? bookingAlreadyCancelled,
    TResult? Function(String message, String? reason)? cancellationNotAllowed,
    TResult? Function(String message)? bookingFetch,
  }) {
    return locationFetch?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? unknown,
    TResult Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? phoneNumberAlreadyExists,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? sessionExpired,
    TResult Function(String message)? accountNotFound,
    TResult Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult Function(String message)? parsing,
    TResult Function(String message, String? code)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message, String? code)? generic,
    TResult Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult Function(String message, String? code)? locationServiceDisabled,
    TResult Function(String message, String? code)? locationFetch,
    TResult Function(String message)? bookingNotFound,
    TResult Function(String message)? bookingAlreadyCancelled,
    TResult Function(String message, String? reason)? cancellationNotAllowed,
    TResult Function(String message)? bookingFetch,
    required TResult orElse(),
  }) {
    if (locationFetch != null) {
      return locationFetch(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidOtpFailure value) invalidOtp,
    required TResult Function(OtpExpiredFailure value) otpExpired,
    required TResult Function(PhoneNumberAlreadyExistsFailure value)
        phoneNumberAlreadyExists,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(AccountNotFoundFailure value) accountNotFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(_ParsingFailure value) parsing,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_NotFoundFailure value) notFound,
    required TResult Function(_PermissionFailure value) permission,
    required TResult Function(_GenericFailure value) generic,
    required TResult Function(_LocationPermissionDeniedFailure value)
        locationPermissionDenied,
    required TResult Function(_LocationServiceDisabledFailure value)
        locationServiceDisabled,
    required TResult Function(_LocationFetchFailure value) locationFetch,
    required TResult Function(BookingNotFoundFailure value) bookingNotFound,
    required TResult Function(BookingAlreadyCancelledFailure value)
        bookingAlreadyCancelled,
    required TResult Function(CancellationNotAllowedFailure value)
        cancellationNotAllowed,
    required TResult Function(BookingFetchFailure value) bookingFetch,
  }) {
    return locationFetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidOtpFailure value)? invalidOtp,
    TResult? Function(OtpExpiredFailure value)? otpExpired,
    TResult? Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(AccountNotFoundFailure value)? accountNotFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(_ParsingFailure value)? parsing,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_NotFoundFailure value)? notFound,
    TResult? Function(_PermissionFailure value)? permission,
    TResult? Function(_GenericFailure value)? generic,
    TResult? Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult? Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult? Function(_LocationFetchFailure value)? locationFetch,
    TResult? Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult? Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult? Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult? Function(BookingFetchFailure value)? bookingFetch,
  }) {
    return locationFetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidOtpFailure value)? invalidOtp,
    TResult Function(OtpExpiredFailure value)? otpExpired,
    TResult Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(AccountNotFoundFailure value)? accountNotFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(_ParsingFailure value)? parsing,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_NotFoundFailure value)? notFound,
    TResult Function(_PermissionFailure value)? permission,
    TResult Function(_GenericFailure value)? generic,
    TResult Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult Function(_LocationFetchFailure value)? locationFetch,
    TResult Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult Function(BookingFetchFailure value)? bookingFetch,
    required TResult orElse(),
  }) {
    if (locationFetch != null) {
      return locationFetch(this);
    }
    return orElse();
  }
}

abstract class _LocationFetchFailure extends Failure {
  const factory _LocationFetchFailure(
      {required final String message,
      final String? code}) = _$LocationFetchFailureImpl;
  const _LocationFetchFailure._() : super._();

  @override
  String get message;
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$LocationFetchFailureImplCopyWith<_$LocationFetchFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BookingNotFoundFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$BookingNotFoundFailureImplCopyWith(
          _$BookingNotFoundFailureImpl value,
          $Res Function(_$BookingNotFoundFailureImpl) then) =
      __$$BookingNotFoundFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$BookingNotFoundFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$BookingNotFoundFailureImpl>
    implements _$$BookingNotFoundFailureImplCopyWith<$Res> {
  __$$BookingNotFoundFailureImplCopyWithImpl(
      _$BookingNotFoundFailureImpl _value,
      $Res Function(_$BookingNotFoundFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$BookingNotFoundFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BookingNotFoundFailureImpl extends BookingNotFoundFailure {
  const _$BookingNotFoundFailureImpl({this.message = 'Booking not found'})
      : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.bookingNotFound(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingNotFoundFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingNotFoundFailureImplCopyWith<_$BookingNotFoundFailureImpl>
      get copyWith => __$$BookingNotFoundFailureImplCopyWithImpl<
          _$BookingNotFoundFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) unknown,
    required TResult Function(String message, int? attemptsRemaining)
        invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) phoneNumberAlreadyExists,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) sessionExpired,
    required TResult Function(String message) accountNotFound,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        validation,
    required TResult Function(String message) parsing,
    required TResult Function(String message, String? code) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message, String? code) generic,
    required TResult Function(
            LocationPermissionStatus status, String message, String? code)
        locationPermissionDenied,
    required TResult Function(String message, String? code)
        locationServiceDisabled,
    required TResult Function(String message, String? code) locationFetch,
    required TResult Function(String message) bookingNotFound,
    required TResult Function(String message) bookingAlreadyCancelled,
    required TResult Function(String message, String? reason)
        cancellationNotAllowed,
    required TResult Function(String message) bookingFetch,
  }) {
    return bookingNotFound(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? unknown,
    TResult? Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? phoneNumberAlreadyExists,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? sessionExpired,
    TResult? Function(String message)? accountNotFound,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult? Function(String message)? parsing,
    TResult? Function(String message, String? code)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message, String? code)? generic,
    TResult? Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult? Function(String message, String? code)? locationServiceDisabled,
    TResult? Function(String message, String? code)? locationFetch,
    TResult? Function(String message)? bookingNotFound,
    TResult? Function(String message)? bookingAlreadyCancelled,
    TResult? Function(String message, String? reason)? cancellationNotAllowed,
    TResult? Function(String message)? bookingFetch,
  }) {
    return bookingNotFound?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? unknown,
    TResult Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? phoneNumberAlreadyExists,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? sessionExpired,
    TResult Function(String message)? accountNotFound,
    TResult Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult Function(String message)? parsing,
    TResult Function(String message, String? code)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message, String? code)? generic,
    TResult Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult Function(String message, String? code)? locationServiceDisabled,
    TResult Function(String message, String? code)? locationFetch,
    TResult Function(String message)? bookingNotFound,
    TResult Function(String message)? bookingAlreadyCancelled,
    TResult Function(String message, String? reason)? cancellationNotAllowed,
    TResult Function(String message)? bookingFetch,
    required TResult orElse(),
  }) {
    if (bookingNotFound != null) {
      return bookingNotFound(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidOtpFailure value) invalidOtp,
    required TResult Function(OtpExpiredFailure value) otpExpired,
    required TResult Function(PhoneNumberAlreadyExistsFailure value)
        phoneNumberAlreadyExists,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(AccountNotFoundFailure value) accountNotFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(_ParsingFailure value) parsing,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_NotFoundFailure value) notFound,
    required TResult Function(_PermissionFailure value) permission,
    required TResult Function(_GenericFailure value) generic,
    required TResult Function(_LocationPermissionDeniedFailure value)
        locationPermissionDenied,
    required TResult Function(_LocationServiceDisabledFailure value)
        locationServiceDisabled,
    required TResult Function(_LocationFetchFailure value) locationFetch,
    required TResult Function(BookingNotFoundFailure value) bookingNotFound,
    required TResult Function(BookingAlreadyCancelledFailure value)
        bookingAlreadyCancelled,
    required TResult Function(CancellationNotAllowedFailure value)
        cancellationNotAllowed,
    required TResult Function(BookingFetchFailure value) bookingFetch,
  }) {
    return bookingNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidOtpFailure value)? invalidOtp,
    TResult? Function(OtpExpiredFailure value)? otpExpired,
    TResult? Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(AccountNotFoundFailure value)? accountNotFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(_ParsingFailure value)? parsing,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_NotFoundFailure value)? notFound,
    TResult? Function(_PermissionFailure value)? permission,
    TResult? Function(_GenericFailure value)? generic,
    TResult? Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult? Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult? Function(_LocationFetchFailure value)? locationFetch,
    TResult? Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult? Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult? Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult? Function(BookingFetchFailure value)? bookingFetch,
  }) {
    return bookingNotFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidOtpFailure value)? invalidOtp,
    TResult Function(OtpExpiredFailure value)? otpExpired,
    TResult Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(AccountNotFoundFailure value)? accountNotFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(_ParsingFailure value)? parsing,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_NotFoundFailure value)? notFound,
    TResult Function(_PermissionFailure value)? permission,
    TResult Function(_GenericFailure value)? generic,
    TResult Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult Function(_LocationFetchFailure value)? locationFetch,
    TResult Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult Function(BookingFetchFailure value)? bookingFetch,
    required TResult orElse(),
  }) {
    if (bookingNotFound != null) {
      return bookingNotFound(this);
    }
    return orElse();
  }
}

abstract class BookingNotFoundFailure extends Failure {
  const factory BookingNotFoundFailure({final String message}) =
      _$BookingNotFoundFailureImpl;
  const BookingNotFoundFailure._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$BookingNotFoundFailureImplCopyWith<_$BookingNotFoundFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BookingAlreadyCancelledFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$BookingAlreadyCancelledFailureImplCopyWith(
          _$BookingAlreadyCancelledFailureImpl value,
          $Res Function(_$BookingAlreadyCancelledFailureImpl) then) =
      __$$BookingAlreadyCancelledFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$BookingAlreadyCancelledFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$BookingAlreadyCancelledFailureImpl>
    implements _$$BookingAlreadyCancelledFailureImplCopyWith<$Res> {
  __$$BookingAlreadyCancelledFailureImplCopyWithImpl(
      _$BookingAlreadyCancelledFailureImpl _value,
      $Res Function(_$BookingAlreadyCancelledFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$BookingAlreadyCancelledFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BookingAlreadyCancelledFailureImpl
    extends BookingAlreadyCancelledFailure {
  const _$BookingAlreadyCancelledFailureImpl(
      {this.message = 'Booking is already cancelled'})
      : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.bookingAlreadyCancelled(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingAlreadyCancelledFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingAlreadyCancelledFailureImplCopyWith<
          _$BookingAlreadyCancelledFailureImpl>
      get copyWith => __$$BookingAlreadyCancelledFailureImplCopyWithImpl<
          _$BookingAlreadyCancelledFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) unknown,
    required TResult Function(String message, int? attemptsRemaining)
        invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) phoneNumberAlreadyExists,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) sessionExpired,
    required TResult Function(String message) accountNotFound,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        validation,
    required TResult Function(String message) parsing,
    required TResult Function(String message, String? code) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message, String? code) generic,
    required TResult Function(
            LocationPermissionStatus status, String message, String? code)
        locationPermissionDenied,
    required TResult Function(String message, String? code)
        locationServiceDisabled,
    required TResult Function(String message, String? code) locationFetch,
    required TResult Function(String message) bookingNotFound,
    required TResult Function(String message) bookingAlreadyCancelled,
    required TResult Function(String message, String? reason)
        cancellationNotAllowed,
    required TResult Function(String message) bookingFetch,
  }) {
    return bookingAlreadyCancelled(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? unknown,
    TResult? Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? phoneNumberAlreadyExists,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? sessionExpired,
    TResult? Function(String message)? accountNotFound,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult? Function(String message)? parsing,
    TResult? Function(String message, String? code)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message, String? code)? generic,
    TResult? Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult? Function(String message, String? code)? locationServiceDisabled,
    TResult? Function(String message, String? code)? locationFetch,
    TResult? Function(String message)? bookingNotFound,
    TResult? Function(String message)? bookingAlreadyCancelled,
    TResult? Function(String message, String? reason)? cancellationNotAllowed,
    TResult? Function(String message)? bookingFetch,
  }) {
    return bookingAlreadyCancelled?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? unknown,
    TResult Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? phoneNumberAlreadyExists,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? sessionExpired,
    TResult Function(String message)? accountNotFound,
    TResult Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult Function(String message)? parsing,
    TResult Function(String message, String? code)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message, String? code)? generic,
    TResult Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult Function(String message, String? code)? locationServiceDisabled,
    TResult Function(String message, String? code)? locationFetch,
    TResult Function(String message)? bookingNotFound,
    TResult Function(String message)? bookingAlreadyCancelled,
    TResult Function(String message, String? reason)? cancellationNotAllowed,
    TResult Function(String message)? bookingFetch,
    required TResult orElse(),
  }) {
    if (bookingAlreadyCancelled != null) {
      return bookingAlreadyCancelled(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidOtpFailure value) invalidOtp,
    required TResult Function(OtpExpiredFailure value) otpExpired,
    required TResult Function(PhoneNumberAlreadyExistsFailure value)
        phoneNumberAlreadyExists,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(AccountNotFoundFailure value) accountNotFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(_ParsingFailure value) parsing,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_NotFoundFailure value) notFound,
    required TResult Function(_PermissionFailure value) permission,
    required TResult Function(_GenericFailure value) generic,
    required TResult Function(_LocationPermissionDeniedFailure value)
        locationPermissionDenied,
    required TResult Function(_LocationServiceDisabledFailure value)
        locationServiceDisabled,
    required TResult Function(_LocationFetchFailure value) locationFetch,
    required TResult Function(BookingNotFoundFailure value) bookingNotFound,
    required TResult Function(BookingAlreadyCancelledFailure value)
        bookingAlreadyCancelled,
    required TResult Function(CancellationNotAllowedFailure value)
        cancellationNotAllowed,
    required TResult Function(BookingFetchFailure value) bookingFetch,
  }) {
    return bookingAlreadyCancelled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidOtpFailure value)? invalidOtp,
    TResult? Function(OtpExpiredFailure value)? otpExpired,
    TResult? Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(AccountNotFoundFailure value)? accountNotFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(_ParsingFailure value)? parsing,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_NotFoundFailure value)? notFound,
    TResult? Function(_PermissionFailure value)? permission,
    TResult? Function(_GenericFailure value)? generic,
    TResult? Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult? Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult? Function(_LocationFetchFailure value)? locationFetch,
    TResult? Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult? Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult? Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult? Function(BookingFetchFailure value)? bookingFetch,
  }) {
    return bookingAlreadyCancelled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidOtpFailure value)? invalidOtp,
    TResult Function(OtpExpiredFailure value)? otpExpired,
    TResult Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(AccountNotFoundFailure value)? accountNotFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(_ParsingFailure value)? parsing,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_NotFoundFailure value)? notFound,
    TResult Function(_PermissionFailure value)? permission,
    TResult Function(_GenericFailure value)? generic,
    TResult Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult Function(_LocationFetchFailure value)? locationFetch,
    TResult Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult Function(BookingFetchFailure value)? bookingFetch,
    required TResult orElse(),
  }) {
    if (bookingAlreadyCancelled != null) {
      return bookingAlreadyCancelled(this);
    }
    return orElse();
  }
}

abstract class BookingAlreadyCancelledFailure extends Failure {
  const factory BookingAlreadyCancelledFailure({final String message}) =
      _$BookingAlreadyCancelledFailureImpl;
  const BookingAlreadyCancelledFailure._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$BookingAlreadyCancelledFailureImplCopyWith<
          _$BookingAlreadyCancelledFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancellationNotAllowedFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$CancellationNotAllowedFailureImplCopyWith(
          _$CancellationNotAllowedFailureImpl value,
          $Res Function(_$CancellationNotAllowedFailureImpl) then) =
      __$$CancellationNotAllowedFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? reason});
}

/// @nodoc
class __$$CancellationNotAllowedFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$CancellationNotAllowedFailureImpl>
    implements _$$CancellationNotAllowedFailureImplCopyWith<$Res> {
  __$$CancellationNotAllowedFailureImplCopyWithImpl(
      _$CancellationNotAllowedFailureImpl _value,
      $Res Function(_$CancellationNotAllowedFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? reason = freezed,
  }) {
    return _then(_$CancellationNotAllowedFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CancellationNotAllowedFailureImpl
    extends CancellationNotAllowedFailure {
  const _$CancellationNotAllowedFailureImpl(
      {this.message = 'This booking cannot be cancelled at this time',
      this.reason})
      : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final String? reason;

  @override
  String toString() {
    return 'Failure.cancellationNotAllowed(message: $message, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancellationNotAllowedFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CancellationNotAllowedFailureImplCopyWith<
          _$CancellationNotAllowedFailureImpl>
      get copyWith => __$$CancellationNotAllowedFailureImplCopyWithImpl<
          _$CancellationNotAllowedFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) unknown,
    required TResult Function(String message, int? attemptsRemaining)
        invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) phoneNumberAlreadyExists,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) sessionExpired,
    required TResult Function(String message) accountNotFound,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        validation,
    required TResult Function(String message) parsing,
    required TResult Function(String message, String? code) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message, String? code) generic,
    required TResult Function(
            LocationPermissionStatus status, String message, String? code)
        locationPermissionDenied,
    required TResult Function(String message, String? code)
        locationServiceDisabled,
    required TResult Function(String message, String? code) locationFetch,
    required TResult Function(String message) bookingNotFound,
    required TResult Function(String message) bookingAlreadyCancelled,
    required TResult Function(String message, String? reason)
        cancellationNotAllowed,
    required TResult Function(String message) bookingFetch,
  }) {
    return cancellationNotAllowed(message, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? unknown,
    TResult? Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? phoneNumberAlreadyExists,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? sessionExpired,
    TResult? Function(String message)? accountNotFound,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult? Function(String message)? parsing,
    TResult? Function(String message, String? code)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message, String? code)? generic,
    TResult? Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult? Function(String message, String? code)? locationServiceDisabled,
    TResult? Function(String message, String? code)? locationFetch,
    TResult? Function(String message)? bookingNotFound,
    TResult? Function(String message)? bookingAlreadyCancelled,
    TResult? Function(String message, String? reason)? cancellationNotAllowed,
    TResult? Function(String message)? bookingFetch,
  }) {
    return cancellationNotAllowed?.call(message, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? unknown,
    TResult Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? phoneNumberAlreadyExists,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? sessionExpired,
    TResult Function(String message)? accountNotFound,
    TResult Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult Function(String message)? parsing,
    TResult Function(String message, String? code)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message, String? code)? generic,
    TResult Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult Function(String message, String? code)? locationServiceDisabled,
    TResult Function(String message, String? code)? locationFetch,
    TResult Function(String message)? bookingNotFound,
    TResult Function(String message)? bookingAlreadyCancelled,
    TResult Function(String message, String? reason)? cancellationNotAllowed,
    TResult Function(String message)? bookingFetch,
    required TResult orElse(),
  }) {
    if (cancellationNotAllowed != null) {
      return cancellationNotAllowed(message, reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidOtpFailure value) invalidOtp,
    required TResult Function(OtpExpiredFailure value) otpExpired,
    required TResult Function(PhoneNumberAlreadyExistsFailure value)
        phoneNumberAlreadyExists,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(AccountNotFoundFailure value) accountNotFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(_ParsingFailure value) parsing,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_NotFoundFailure value) notFound,
    required TResult Function(_PermissionFailure value) permission,
    required TResult Function(_GenericFailure value) generic,
    required TResult Function(_LocationPermissionDeniedFailure value)
        locationPermissionDenied,
    required TResult Function(_LocationServiceDisabledFailure value)
        locationServiceDisabled,
    required TResult Function(_LocationFetchFailure value) locationFetch,
    required TResult Function(BookingNotFoundFailure value) bookingNotFound,
    required TResult Function(BookingAlreadyCancelledFailure value)
        bookingAlreadyCancelled,
    required TResult Function(CancellationNotAllowedFailure value)
        cancellationNotAllowed,
    required TResult Function(BookingFetchFailure value) bookingFetch,
  }) {
    return cancellationNotAllowed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidOtpFailure value)? invalidOtp,
    TResult? Function(OtpExpiredFailure value)? otpExpired,
    TResult? Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(AccountNotFoundFailure value)? accountNotFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(_ParsingFailure value)? parsing,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_NotFoundFailure value)? notFound,
    TResult? Function(_PermissionFailure value)? permission,
    TResult? Function(_GenericFailure value)? generic,
    TResult? Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult? Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult? Function(_LocationFetchFailure value)? locationFetch,
    TResult? Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult? Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult? Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult? Function(BookingFetchFailure value)? bookingFetch,
  }) {
    return cancellationNotAllowed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidOtpFailure value)? invalidOtp,
    TResult Function(OtpExpiredFailure value)? otpExpired,
    TResult Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(AccountNotFoundFailure value)? accountNotFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(_ParsingFailure value)? parsing,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_NotFoundFailure value)? notFound,
    TResult Function(_PermissionFailure value)? permission,
    TResult Function(_GenericFailure value)? generic,
    TResult Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult Function(_LocationFetchFailure value)? locationFetch,
    TResult Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult Function(BookingFetchFailure value)? bookingFetch,
    required TResult orElse(),
  }) {
    if (cancellationNotAllowed != null) {
      return cancellationNotAllowed(this);
    }
    return orElse();
  }
}

abstract class CancellationNotAllowedFailure extends Failure {
  const factory CancellationNotAllowedFailure(
      {final String message,
      final String? reason}) = _$CancellationNotAllowedFailureImpl;
  const CancellationNotAllowedFailure._() : super._();

  @override
  String get message;
  String? get reason;
  @override
  @JsonKey(ignore: true)
  _$$CancellationNotAllowedFailureImplCopyWith<
          _$CancellationNotAllowedFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BookingFetchFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$BookingFetchFailureImplCopyWith(_$BookingFetchFailureImpl value,
          $Res Function(_$BookingFetchFailureImpl) then) =
      __$$BookingFetchFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$BookingFetchFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$BookingFetchFailureImpl>
    implements _$$BookingFetchFailureImplCopyWith<$Res> {
  __$$BookingFetchFailureImplCopyWithImpl(_$BookingFetchFailureImpl _value,
      $Res Function(_$BookingFetchFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$BookingFetchFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BookingFetchFailureImpl extends BookingFetchFailure {
  const _$BookingFetchFailureImpl({this.message = 'Failed to fetch bookings'})
      : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.bookingFetch(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingFetchFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingFetchFailureImplCopyWith<_$BookingFetchFailureImpl> get copyWith =>
      __$$BookingFetchFailureImplCopyWithImpl<_$BookingFetchFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) unknown,
    required TResult Function(String message, int? attemptsRemaining)
        invalidOtp,
    required TResult Function(String message) otpExpired,
    required TResult Function(String message) phoneNumberAlreadyExists,
    required TResult Function(String message) invalidCredentials,
    required TResult Function(String message) sessionExpired,
    required TResult Function(String message) accountNotFound,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        validation,
    required TResult Function(String message) parsing,
    required TResult Function(String message, String? code) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message, String? code) generic,
    required TResult Function(
            LocationPermissionStatus status, String message, String? code)
        locationPermissionDenied,
    required TResult Function(String message, String? code)
        locationServiceDisabled,
    required TResult Function(String message, String? code) locationFetch,
    required TResult Function(String message) bookingNotFound,
    required TResult Function(String message) bookingAlreadyCancelled,
    required TResult Function(String message, String? reason)
        cancellationNotAllowed,
    required TResult Function(String message) bookingFetch,
  }) {
    return bookingFetch(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? unknown,
    TResult? Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult? Function(String message)? otpExpired,
    TResult? Function(String message)? phoneNumberAlreadyExists,
    TResult? Function(String message)? invalidCredentials,
    TResult? Function(String message)? sessionExpired,
    TResult? Function(String message)? accountNotFound,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult? Function(String message)? parsing,
    TResult? Function(String message, String? code)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message, String? code)? generic,
    TResult? Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult? Function(String message, String? code)? locationServiceDisabled,
    TResult? Function(String message, String? code)? locationFetch,
    TResult? Function(String message)? bookingNotFound,
    TResult? Function(String message)? bookingAlreadyCancelled,
    TResult? Function(String message, String? reason)? cancellationNotAllowed,
    TResult? Function(String message)? bookingFetch,
  }) {
    return bookingFetch?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? unknown,
    TResult Function(String message, int? attemptsRemaining)? invalidOtp,
    TResult Function(String message)? otpExpired,
    TResult Function(String message)? phoneNumberAlreadyExists,
    TResult Function(String message)? invalidCredentials,
    TResult Function(String message)? sessionExpired,
    TResult Function(String message)? accountNotFound,
    TResult Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult Function(String message)? parsing,
    TResult Function(String message, String? code)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message, String? code)? generic,
    TResult Function(
            LocationPermissionStatus status, String message, String? code)?
        locationPermissionDenied,
    TResult Function(String message, String? code)? locationServiceDisabled,
    TResult Function(String message, String? code)? locationFetch,
    TResult Function(String message)? bookingNotFound,
    TResult Function(String message)? bookingAlreadyCancelled,
    TResult Function(String message, String? reason)? cancellationNotAllowed,
    TResult Function(String message)? bookingFetch,
    required TResult orElse(),
  }) {
    if (bookingFetch != null) {
      return bookingFetch(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidOtpFailure value) invalidOtp,
    required TResult Function(OtpExpiredFailure value) otpExpired,
    required TResult Function(PhoneNumberAlreadyExistsFailure value)
        phoneNumberAlreadyExists,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(AccountNotFoundFailure value) accountNotFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(_ParsingFailure value) parsing,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_NotFoundFailure value) notFound,
    required TResult Function(_PermissionFailure value) permission,
    required TResult Function(_GenericFailure value) generic,
    required TResult Function(_LocationPermissionDeniedFailure value)
        locationPermissionDenied,
    required TResult Function(_LocationServiceDisabledFailure value)
        locationServiceDisabled,
    required TResult Function(_LocationFetchFailure value) locationFetch,
    required TResult Function(BookingNotFoundFailure value) bookingNotFound,
    required TResult Function(BookingAlreadyCancelledFailure value)
        bookingAlreadyCancelled,
    required TResult Function(CancellationNotAllowedFailure value)
        cancellationNotAllowed,
    required TResult Function(BookingFetchFailure value) bookingFetch,
  }) {
    return bookingFetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidOtpFailure value)? invalidOtp,
    TResult? Function(OtpExpiredFailure value)? otpExpired,
    TResult? Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(AccountNotFoundFailure value)? accountNotFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(_ParsingFailure value)? parsing,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_NotFoundFailure value)? notFound,
    TResult? Function(_PermissionFailure value)? permission,
    TResult? Function(_GenericFailure value)? generic,
    TResult? Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult? Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult? Function(_LocationFetchFailure value)? locationFetch,
    TResult? Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult? Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult? Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult? Function(BookingFetchFailure value)? bookingFetch,
  }) {
    return bookingFetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidOtpFailure value)? invalidOtp,
    TResult Function(OtpExpiredFailure value)? otpExpired,
    TResult Function(PhoneNumberAlreadyExistsFailure value)?
        phoneNumberAlreadyExists,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(AccountNotFoundFailure value)? accountNotFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(_ParsingFailure value)? parsing,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_NotFoundFailure value)? notFound,
    TResult Function(_PermissionFailure value)? permission,
    TResult Function(_GenericFailure value)? generic,
    TResult Function(_LocationPermissionDeniedFailure value)?
        locationPermissionDenied,
    TResult Function(_LocationServiceDisabledFailure value)?
        locationServiceDisabled,
    TResult Function(_LocationFetchFailure value)? locationFetch,
    TResult Function(BookingNotFoundFailure value)? bookingNotFound,
    TResult Function(BookingAlreadyCancelledFailure value)?
        bookingAlreadyCancelled,
    TResult Function(CancellationNotAllowedFailure value)?
        cancellationNotAllowed,
    TResult Function(BookingFetchFailure value)? bookingFetch,
    required TResult orElse(),
  }) {
    if (bookingFetch != null) {
      return bookingFetch(this);
    }
    return orElse();
  }
}

abstract class BookingFetchFailure extends Failure {
  const factory BookingFetchFailure({final String message}) =
      _$BookingFetchFailureImpl;
  const BookingFetchFailure._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$BookingFetchFailureImplCopyWith<_$BookingFetchFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
