// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() requestingOtp,
    required TResult Function(OtpState otpState) otpSent,
    required TResult Function() verifyingOtp,
    required TResult Function(Session session) success,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? requestingOtp,
    TResult? Function(OtpState otpState)? otpSent,
    TResult? Function()? verifyingOtp,
    TResult? Function(Session session)? success,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? requestingOtp,
    TResult Function(OtpState otpState)? otpSent,
    TResult Function()? verifyingOtp,
    TResult Function(Session session)? success,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitial value) initial,
    required TResult Function(LoginRequestingOtp value) requestingOtp,
    required TResult Function(LoginOtpSent value) otpSent,
    required TResult Function(LoginVerifyingOtp value) verifyingOtp,
    required TResult Function(LoginSuccess value) success,
    required TResult Function(LoginError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitial value)? initial,
    TResult? Function(LoginRequestingOtp value)? requestingOtp,
    TResult? Function(LoginOtpSent value)? otpSent,
    TResult? Function(LoginVerifyingOtp value)? verifyingOtp,
    TResult? Function(LoginSuccess value)? success,
    TResult? Function(LoginError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitial value)? initial,
    TResult Function(LoginRequestingOtp value)? requestingOtp,
    TResult Function(LoginOtpSent value)? otpSent,
    TResult Function(LoginVerifyingOtp value)? verifyingOtp,
    TResult Function(LoginSuccess value)? success,
    TResult Function(LoginError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoginInitialImplCopyWith<$Res> {
  factory _$$LoginInitialImplCopyWith(
          _$LoginInitialImpl value, $Res Function(_$LoginInitialImpl) then) =
      __$$LoginInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginInitialImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginInitialImpl>
    implements _$$LoginInitialImplCopyWith<$Res> {
  __$$LoginInitialImplCopyWithImpl(
      _$LoginInitialImpl _value, $Res Function(_$LoginInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginInitialImpl extends LoginInitial {
  const _$LoginInitialImpl() : super._();

  @override
  String toString() {
    return 'LoginState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() requestingOtp,
    required TResult Function(OtpState otpState) otpSent,
    required TResult Function() verifyingOtp,
    required TResult Function(Session session) success,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? requestingOtp,
    TResult? Function(OtpState otpState)? otpSent,
    TResult? Function()? verifyingOtp,
    TResult? Function(Session session)? success,
    TResult? Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? requestingOtp,
    TResult Function(OtpState otpState)? otpSent,
    TResult Function()? verifyingOtp,
    TResult Function(Session session)? success,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitial value) initial,
    required TResult Function(LoginRequestingOtp value) requestingOtp,
    required TResult Function(LoginOtpSent value) otpSent,
    required TResult Function(LoginVerifyingOtp value) verifyingOtp,
    required TResult Function(LoginSuccess value) success,
    required TResult Function(LoginError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitial value)? initial,
    TResult? Function(LoginRequestingOtp value)? requestingOtp,
    TResult? Function(LoginOtpSent value)? otpSent,
    TResult? Function(LoginVerifyingOtp value)? verifyingOtp,
    TResult? Function(LoginSuccess value)? success,
    TResult? Function(LoginError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitial value)? initial,
    TResult Function(LoginRequestingOtp value)? requestingOtp,
    TResult Function(LoginOtpSent value)? otpSent,
    TResult Function(LoginVerifyingOtp value)? verifyingOtp,
    TResult Function(LoginSuccess value)? success,
    TResult Function(LoginError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class LoginInitial extends LoginState {
  const factory LoginInitial() = _$LoginInitialImpl;
  const LoginInitial._() : super._();
}

/// @nodoc
abstract class _$$LoginRequestingOtpImplCopyWith<$Res> {
  factory _$$LoginRequestingOtpImplCopyWith(_$LoginRequestingOtpImpl value,
          $Res Function(_$LoginRequestingOtpImpl) then) =
      __$$LoginRequestingOtpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginRequestingOtpImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginRequestingOtpImpl>
    implements _$$LoginRequestingOtpImplCopyWith<$Res> {
  __$$LoginRequestingOtpImplCopyWithImpl(_$LoginRequestingOtpImpl _value,
      $Res Function(_$LoginRequestingOtpImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginRequestingOtpImpl extends LoginRequestingOtp {
  const _$LoginRequestingOtpImpl() : super._();

  @override
  String toString() {
    return 'LoginState.requestingOtp()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginRequestingOtpImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() requestingOtp,
    required TResult Function(OtpState otpState) otpSent,
    required TResult Function() verifyingOtp,
    required TResult Function(Session session) success,
    required TResult Function(Failure failure) error,
  }) {
    return requestingOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? requestingOtp,
    TResult? Function(OtpState otpState)? otpSent,
    TResult? Function()? verifyingOtp,
    TResult? Function(Session session)? success,
    TResult? Function(Failure failure)? error,
  }) {
    return requestingOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? requestingOtp,
    TResult Function(OtpState otpState)? otpSent,
    TResult Function()? verifyingOtp,
    TResult Function(Session session)? success,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (requestingOtp != null) {
      return requestingOtp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitial value) initial,
    required TResult Function(LoginRequestingOtp value) requestingOtp,
    required TResult Function(LoginOtpSent value) otpSent,
    required TResult Function(LoginVerifyingOtp value) verifyingOtp,
    required TResult Function(LoginSuccess value) success,
    required TResult Function(LoginError value) error,
  }) {
    return requestingOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitial value)? initial,
    TResult? Function(LoginRequestingOtp value)? requestingOtp,
    TResult? Function(LoginOtpSent value)? otpSent,
    TResult? Function(LoginVerifyingOtp value)? verifyingOtp,
    TResult? Function(LoginSuccess value)? success,
    TResult? Function(LoginError value)? error,
  }) {
    return requestingOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitial value)? initial,
    TResult Function(LoginRequestingOtp value)? requestingOtp,
    TResult Function(LoginOtpSent value)? otpSent,
    TResult Function(LoginVerifyingOtp value)? verifyingOtp,
    TResult Function(LoginSuccess value)? success,
    TResult Function(LoginError value)? error,
    required TResult orElse(),
  }) {
    if (requestingOtp != null) {
      return requestingOtp(this);
    }
    return orElse();
  }
}

abstract class LoginRequestingOtp extends LoginState {
  const factory LoginRequestingOtp() = _$LoginRequestingOtpImpl;
  const LoginRequestingOtp._() : super._();
}

/// @nodoc
abstract class _$$LoginOtpSentImplCopyWith<$Res> {
  factory _$$LoginOtpSentImplCopyWith(
          _$LoginOtpSentImpl value, $Res Function(_$LoginOtpSentImpl) then) =
      __$$LoginOtpSentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OtpState otpState});

  $OtpStateCopyWith<$Res> get otpState;
}

/// @nodoc
class __$$LoginOtpSentImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginOtpSentImpl>
    implements _$$LoginOtpSentImplCopyWith<$Res> {
  __$$LoginOtpSentImplCopyWithImpl(
      _$LoginOtpSentImpl _value, $Res Function(_$LoginOtpSentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otpState = null,
  }) {
    return _then(_$LoginOtpSentImpl(
      otpState: null == otpState
          ? _value.otpState
          : otpState // ignore: cast_nullable_to_non_nullable
              as OtpState,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $OtpStateCopyWith<$Res> get otpState {
    return $OtpStateCopyWith<$Res>(_value.otpState, (value) {
      return _then(_value.copyWith(otpState: value));
    });
  }
}

/// @nodoc

class _$LoginOtpSentImpl extends LoginOtpSent {
  const _$LoginOtpSentImpl({required this.otpState}) : super._();

  @override
  final OtpState otpState;

  @override
  String toString() {
    return 'LoginState.otpSent(otpState: $otpState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginOtpSentImpl &&
            (identical(other.otpState, otpState) ||
                other.otpState == otpState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, otpState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginOtpSentImplCopyWith<_$LoginOtpSentImpl> get copyWith =>
      __$$LoginOtpSentImplCopyWithImpl<_$LoginOtpSentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() requestingOtp,
    required TResult Function(OtpState otpState) otpSent,
    required TResult Function() verifyingOtp,
    required TResult Function(Session session) success,
    required TResult Function(Failure failure) error,
  }) {
    return otpSent(otpState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? requestingOtp,
    TResult? Function(OtpState otpState)? otpSent,
    TResult? Function()? verifyingOtp,
    TResult? Function(Session session)? success,
    TResult? Function(Failure failure)? error,
  }) {
    return otpSent?.call(otpState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? requestingOtp,
    TResult Function(OtpState otpState)? otpSent,
    TResult Function()? verifyingOtp,
    TResult Function(Session session)? success,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (otpSent != null) {
      return otpSent(otpState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitial value) initial,
    required TResult Function(LoginRequestingOtp value) requestingOtp,
    required TResult Function(LoginOtpSent value) otpSent,
    required TResult Function(LoginVerifyingOtp value) verifyingOtp,
    required TResult Function(LoginSuccess value) success,
    required TResult Function(LoginError value) error,
  }) {
    return otpSent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitial value)? initial,
    TResult? Function(LoginRequestingOtp value)? requestingOtp,
    TResult? Function(LoginOtpSent value)? otpSent,
    TResult? Function(LoginVerifyingOtp value)? verifyingOtp,
    TResult? Function(LoginSuccess value)? success,
    TResult? Function(LoginError value)? error,
  }) {
    return otpSent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitial value)? initial,
    TResult Function(LoginRequestingOtp value)? requestingOtp,
    TResult Function(LoginOtpSent value)? otpSent,
    TResult Function(LoginVerifyingOtp value)? verifyingOtp,
    TResult Function(LoginSuccess value)? success,
    TResult Function(LoginError value)? error,
    required TResult orElse(),
  }) {
    if (otpSent != null) {
      return otpSent(this);
    }
    return orElse();
  }
}

abstract class LoginOtpSent extends LoginState {
  const factory LoginOtpSent({required final OtpState otpState}) =
      _$LoginOtpSentImpl;
  const LoginOtpSent._() : super._();

  OtpState get otpState;
  @JsonKey(ignore: true)
  _$$LoginOtpSentImplCopyWith<_$LoginOtpSentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginVerifyingOtpImplCopyWith<$Res> {
  factory _$$LoginVerifyingOtpImplCopyWith(_$LoginVerifyingOtpImpl value,
          $Res Function(_$LoginVerifyingOtpImpl) then) =
      __$$LoginVerifyingOtpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginVerifyingOtpImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginVerifyingOtpImpl>
    implements _$$LoginVerifyingOtpImplCopyWith<$Res> {
  __$$LoginVerifyingOtpImplCopyWithImpl(_$LoginVerifyingOtpImpl _value,
      $Res Function(_$LoginVerifyingOtpImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginVerifyingOtpImpl extends LoginVerifyingOtp {
  const _$LoginVerifyingOtpImpl() : super._();

  @override
  String toString() {
    return 'LoginState.verifyingOtp()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginVerifyingOtpImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() requestingOtp,
    required TResult Function(OtpState otpState) otpSent,
    required TResult Function() verifyingOtp,
    required TResult Function(Session session) success,
    required TResult Function(Failure failure) error,
  }) {
    return verifyingOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? requestingOtp,
    TResult? Function(OtpState otpState)? otpSent,
    TResult? Function()? verifyingOtp,
    TResult? Function(Session session)? success,
    TResult? Function(Failure failure)? error,
  }) {
    return verifyingOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? requestingOtp,
    TResult Function(OtpState otpState)? otpSent,
    TResult Function()? verifyingOtp,
    TResult Function(Session session)? success,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (verifyingOtp != null) {
      return verifyingOtp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitial value) initial,
    required TResult Function(LoginRequestingOtp value) requestingOtp,
    required TResult Function(LoginOtpSent value) otpSent,
    required TResult Function(LoginVerifyingOtp value) verifyingOtp,
    required TResult Function(LoginSuccess value) success,
    required TResult Function(LoginError value) error,
  }) {
    return verifyingOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitial value)? initial,
    TResult? Function(LoginRequestingOtp value)? requestingOtp,
    TResult? Function(LoginOtpSent value)? otpSent,
    TResult? Function(LoginVerifyingOtp value)? verifyingOtp,
    TResult? Function(LoginSuccess value)? success,
    TResult? Function(LoginError value)? error,
  }) {
    return verifyingOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitial value)? initial,
    TResult Function(LoginRequestingOtp value)? requestingOtp,
    TResult Function(LoginOtpSent value)? otpSent,
    TResult Function(LoginVerifyingOtp value)? verifyingOtp,
    TResult Function(LoginSuccess value)? success,
    TResult Function(LoginError value)? error,
    required TResult orElse(),
  }) {
    if (verifyingOtp != null) {
      return verifyingOtp(this);
    }
    return orElse();
  }
}

abstract class LoginVerifyingOtp extends LoginState {
  const factory LoginVerifyingOtp() = _$LoginVerifyingOtpImpl;
  const LoginVerifyingOtp._() : super._();
}

/// @nodoc
abstract class _$$LoginSuccessImplCopyWith<$Res> {
  factory _$$LoginSuccessImplCopyWith(
          _$LoginSuccessImpl value, $Res Function(_$LoginSuccessImpl) then) =
      __$$LoginSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Session session});

  $SessionCopyWith<$Res> get session;
}

/// @nodoc
class __$$LoginSuccessImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginSuccessImpl>
    implements _$$LoginSuccessImplCopyWith<$Res> {
  __$$LoginSuccessImplCopyWithImpl(
      _$LoginSuccessImpl _value, $Res Function(_$LoginSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = null,
  }) {
    return _then(_$LoginSuccessImpl(
      session: null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as Session,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SessionCopyWith<$Res> get session {
    return $SessionCopyWith<$Res>(_value.session, (value) {
      return _then(_value.copyWith(session: value));
    });
  }
}

/// @nodoc

class _$LoginSuccessImpl extends LoginSuccess {
  const _$LoginSuccessImpl({required this.session}) : super._();

  @override
  final Session session;

  @override
  String toString() {
    return 'LoginState.success(session: $session)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginSuccessImpl &&
            (identical(other.session, session) || other.session == session));
  }

  @override
  int get hashCode => Object.hash(runtimeType, session);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginSuccessImplCopyWith<_$LoginSuccessImpl> get copyWith =>
      __$$LoginSuccessImplCopyWithImpl<_$LoginSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() requestingOtp,
    required TResult Function(OtpState otpState) otpSent,
    required TResult Function() verifyingOtp,
    required TResult Function(Session session) success,
    required TResult Function(Failure failure) error,
  }) {
    return success(session);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? requestingOtp,
    TResult? Function(OtpState otpState)? otpSent,
    TResult? Function()? verifyingOtp,
    TResult? Function(Session session)? success,
    TResult? Function(Failure failure)? error,
  }) {
    return success?.call(session);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? requestingOtp,
    TResult Function(OtpState otpState)? otpSent,
    TResult Function()? verifyingOtp,
    TResult Function(Session session)? success,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(session);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitial value) initial,
    required TResult Function(LoginRequestingOtp value) requestingOtp,
    required TResult Function(LoginOtpSent value) otpSent,
    required TResult Function(LoginVerifyingOtp value) verifyingOtp,
    required TResult Function(LoginSuccess value) success,
    required TResult Function(LoginError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitial value)? initial,
    TResult? Function(LoginRequestingOtp value)? requestingOtp,
    TResult? Function(LoginOtpSent value)? otpSent,
    TResult? Function(LoginVerifyingOtp value)? verifyingOtp,
    TResult? Function(LoginSuccess value)? success,
    TResult? Function(LoginError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitial value)? initial,
    TResult Function(LoginRequestingOtp value)? requestingOtp,
    TResult Function(LoginOtpSent value)? otpSent,
    TResult Function(LoginVerifyingOtp value)? verifyingOtp,
    TResult Function(LoginSuccess value)? success,
    TResult Function(LoginError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class LoginSuccess extends LoginState {
  const factory LoginSuccess({required final Session session}) =
      _$LoginSuccessImpl;
  const LoginSuccess._() : super._();

  Session get session;
  @JsonKey(ignore: true)
  _$$LoginSuccessImplCopyWith<_$LoginSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginErrorImplCopyWith<$Res> {
  factory _$$LoginErrorImplCopyWith(
          _$LoginErrorImpl value, $Res Function(_$LoginErrorImpl) then) =
      __$$LoginErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$LoginErrorImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginErrorImpl>
    implements _$$LoginErrorImplCopyWith<$Res> {
  __$$LoginErrorImplCopyWithImpl(
      _$LoginErrorImpl _value, $Res Function(_$LoginErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$LoginErrorImpl(
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res> get failure {
    return $FailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$LoginErrorImpl extends LoginError {
  const _$LoginErrorImpl({required this.failure}) : super._();

  @override
  final Failure failure;

  @override
  String toString() {
    return 'LoginState.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginErrorImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginErrorImplCopyWith<_$LoginErrorImpl> get copyWith =>
      __$$LoginErrorImplCopyWithImpl<_$LoginErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() requestingOtp,
    required TResult Function(OtpState otpState) otpSent,
    required TResult Function() verifyingOtp,
    required TResult Function(Session session) success,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? requestingOtp,
    TResult? Function(OtpState otpState)? otpSent,
    TResult? Function()? verifyingOtp,
    TResult? Function(Session session)? success,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? requestingOtp,
    TResult Function(OtpState otpState)? otpSent,
    TResult Function()? verifyingOtp,
    TResult Function(Session session)? success,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitial value) initial,
    required TResult Function(LoginRequestingOtp value) requestingOtp,
    required TResult Function(LoginOtpSent value) otpSent,
    required TResult Function(LoginVerifyingOtp value) verifyingOtp,
    required TResult Function(LoginSuccess value) success,
    required TResult Function(LoginError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitial value)? initial,
    TResult? Function(LoginRequestingOtp value)? requestingOtp,
    TResult? Function(LoginOtpSent value)? otpSent,
    TResult? Function(LoginVerifyingOtp value)? verifyingOtp,
    TResult? Function(LoginSuccess value)? success,
    TResult? Function(LoginError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitial value)? initial,
    TResult Function(LoginRequestingOtp value)? requestingOtp,
    TResult Function(LoginOtpSent value)? otpSent,
    TResult Function(LoginVerifyingOtp value)? verifyingOtp,
    TResult Function(LoginSuccess value)? success,
    TResult Function(LoginError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class LoginError extends LoginState {
  const factory LoginError({required final Failure failure}) = _$LoginErrorImpl;
  const LoginError._() : super._();

  Failure get failure;
  @JsonKey(ignore: true)
  _$$LoginErrorImplCopyWith<_$LoginErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
