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

class _$NetworkFailureImpl implements NetworkFailure {
  const _$NetworkFailureImpl({this.message = 'Network error occurred'});

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
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class NetworkFailure implements Failure {
  const factory NetworkFailure({final String message}) = _$NetworkFailureImpl;

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

class _$ServerFailureImpl implements ServerFailure {
  const _$ServerFailureImpl({required this.message, this.statusCode});

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
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class ServerFailure implements Failure {
  const factory ServerFailure(
      {required final String message,
      final int? statusCode}) = _$ServerFailureImpl;

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

class _$CacheFailureImpl implements CacheFailure {
  const _$CacheFailureImpl({this.message = 'Cache error occurred'});

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
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache(this);
    }
    return orElse();
  }
}

abstract class CacheFailure implements Failure {
  const factory CacheFailure({final String message}) = _$CacheFailureImpl;

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

class _$UnknownFailureImpl implements UnknownFailure {
  const _$UnknownFailureImpl({this.message = 'An unexpected error occurred'});

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
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UnknownFailure implements Failure {
  const factory UnknownFailure({final String message}) = _$UnknownFailureImpl;

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

class _$InvalidOtpFailureImpl implements InvalidOtpFailure {
  const _$InvalidOtpFailureImpl(
      {this.message = 'Invalid OTP code', this.attemptsRemaining});

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
    required TResult orElse(),
  }) {
    if (invalidOtp != null) {
      return invalidOtp(this);
    }
    return orElse();
  }
}

abstract class InvalidOtpFailure implements Failure {
  const factory InvalidOtpFailure(
      {final String message,
      final int? attemptsRemaining}) = _$InvalidOtpFailureImpl;

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

class _$OtpExpiredFailureImpl implements OtpExpiredFailure {
  const _$OtpExpiredFailureImpl(
      {this.message = 'OTP has expired. Please request a new one.'});

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
    required TResult orElse(),
  }) {
    if (otpExpired != null) {
      return otpExpired(this);
    }
    return orElse();
  }
}

abstract class OtpExpiredFailure implements Failure {
  const factory OtpExpiredFailure({final String message}) =
      _$OtpExpiredFailureImpl;

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
    implements PhoneNumberAlreadyExistsFailure {
  const _$PhoneNumberAlreadyExistsFailureImpl(
      {this.message = 'This phone number is already registered'});

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
    required TResult orElse(),
  }) {
    if (phoneNumberAlreadyExists != null) {
      return phoneNumberAlreadyExists(this);
    }
    return orElse();
  }
}

abstract class PhoneNumberAlreadyExistsFailure implements Failure {
  const factory PhoneNumberAlreadyExistsFailure({final String message}) =
      _$PhoneNumberAlreadyExistsFailureImpl;

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

class _$InvalidCredentialsFailureImpl implements InvalidCredentialsFailure {
  const _$InvalidCredentialsFailureImpl({this.message = 'Invalid credentials'});

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
    required TResult orElse(),
  }) {
    if (invalidCredentials != null) {
      return invalidCredentials(this);
    }
    return orElse();
  }
}

abstract class InvalidCredentialsFailure implements Failure {
  const factory InvalidCredentialsFailure({final String message}) =
      _$InvalidCredentialsFailureImpl;

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

class _$SessionExpiredFailureImpl implements SessionExpiredFailure {
  const _$SessionExpiredFailureImpl(
      {this.message = 'Your session has expired. Please login again.'});

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
    required TResult orElse(),
  }) {
    if (sessionExpired != null) {
      return sessionExpired(this);
    }
    return orElse();
  }
}

abstract class SessionExpiredFailure implements Failure {
  const factory SessionExpiredFailure({final String message}) =
      _$SessionExpiredFailureImpl;

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

class _$AccountNotFoundFailureImpl implements AccountNotFoundFailure {
  const _$AccountNotFoundFailureImpl({this.message = 'Account not found'});

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
    required TResult orElse(),
  }) {
    if (accountNotFound != null) {
      return accountNotFound(this);
    }
    return orElse();
  }
}

abstract class AccountNotFoundFailure implements Failure {
  const factory AccountNotFoundFailure({final String message}) =
      _$AccountNotFoundFailureImpl;

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

class _$ValidationFailureImpl implements ValidationFailure {
  const _$ValidationFailureImpl(
      {required this.message, final Map<String, String>? fieldErrors})
      : _fieldErrors = fieldErrors;

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
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(this);
    }
    return orElse();
  }
}

abstract class ValidationFailure implements Failure {
  const factory ValidationFailure(
      {required final String message,
      final Map<String, String>? fieldErrors}) = _$ValidationFailureImpl;

  @override
  String get message;
  Map<String, String>? get fieldErrors;
  @override
  @JsonKey(ignore: true)
  _$$ValidationFailureImplCopyWith<_$ValidationFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
