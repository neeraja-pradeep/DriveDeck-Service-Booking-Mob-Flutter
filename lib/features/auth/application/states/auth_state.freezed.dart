// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Session session) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() sessionExpired,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Session session)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? sessionExpired,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Session session)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? sessionExpired,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthSessionExpired value) sessionExpired,
    required TResult Function(AuthError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthSessionExpired value)? sessionExpired,
    TResult? Function(AuthError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthSessionExpired value)? sessionExpired,
    TResult Function(AuthError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthInitialImplCopyWith<$Res> {
  factory _$$AuthInitialImplCopyWith(
          _$AuthInitialImpl value, $Res Function(_$AuthInitialImpl) then) =
      __$$AuthInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthInitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthInitialImpl>
    implements _$$AuthInitialImplCopyWith<$Res> {
  __$$AuthInitialImplCopyWithImpl(
      _$AuthInitialImpl _value, $Res Function(_$AuthInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthInitialImpl extends AuthInitial {
  const _$AuthInitialImpl() : super._();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Session session) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() sessionExpired,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Session session)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? sessionExpired,
    TResult? Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Session session)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? sessionExpired,
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
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthSessionExpired value) sessionExpired,
    required TResult Function(AuthError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthSessionExpired value)? sessionExpired,
    TResult? Function(AuthError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthSessionExpired value)? sessionExpired,
    TResult Function(AuthError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthInitial extends AuthState {
  const factory AuthInitial() = _$AuthInitialImpl;
  const AuthInitial._() : super._();
}

/// @nodoc
abstract class _$$AuthLoadingImplCopyWith<$Res> {
  factory _$$AuthLoadingImplCopyWith(
          _$AuthLoadingImpl value, $Res Function(_$AuthLoadingImpl) then) =
      __$$AuthLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthLoadingImpl>
    implements _$$AuthLoadingImplCopyWith<$Res> {
  __$$AuthLoadingImplCopyWithImpl(
      _$AuthLoadingImpl _value, $Res Function(_$AuthLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthLoadingImpl extends AuthLoading {
  const _$AuthLoadingImpl() : super._();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Session session) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() sessionExpired,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Session session)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? sessionExpired,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Session session)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? sessionExpired,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthSessionExpired value) sessionExpired,
    required TResult Function(AuthError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthSessionExpired value)? sessionExpired,
    TResult? Function(AuthError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthSessionExpired value)? sessionExpired,
    TResult Function(AuthError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthLoading extends AuthState {
  const factory AuthLoading() = _$AuthLoadingImpl;
  const AuthLoading._() : super._();
}

/// @nodoc
abstract class _$$AuthAuthenticatedImplCopyWith<$Res> {
  factory _$$AuthAuthenticatedImplCopyWith(_$AuthAuthenticatedImpl value,
          $Res Function(_$AuthAuthenticatedImpl) then) =
      __$$AuthAuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Session session});

  $SessionCopyWith<$Res> get session;
}

/// @nodoc
class __$$AuthAuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthAuthenticatedImpl>
    implements _$$AuthAuthenticatedImplCopyWith<$Res> {
  __$$AuthAuthenticatedImplCopyWithImpl(_$AuthAuthenticatedImpl _value,
      $Res Function(_$AuthAuthenticatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = null,
  }) {
    return _then(_$AuthAuthenticatedImpl(
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

class _$AuthAuthenticatedImpl extends AuthAuthenticated {
  const _$AuthAuthenticatedImpl({required this.session}) : super._();

  @override
  final Session session;

  @override
  String toString() {
    return 'AuthState.authenticated(session: $session)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthAuthenticatedImpl &&
            (identical(other.session, session) || other.session == session));
  }

  @override
  int get hashCode => Object.hash(runtimeType, session);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthAuthenticatedImplCopyWith<_$AuthAuthenticatedImpl> get copyWith =>
      __$$AuthAuthenticatedImplCopyWithImpl<_$AuthAuthenticatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Session session) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() sessionExpired,
    required TResult Function(Failure failure) error,
  }) {
    return authenticated(session);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Session session)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? sessionExpired,
    TResult? Function(Failure failure)? error,
  }) {
    return authenticated?.call(session);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Session session)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? sessionExpired,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(session);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthSessionExpired value) sessionExpired,
    required TResult Function(AuthError value) error,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthSessionExpired value)? sessionExpired,
    TResult? Function(AuthError value)? error,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthSessionExpired value)? sessionExpired,
    TResult Function(AuthError value)? error,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class AuthAuthenticated extends AuthState {
  const factory AuthAuthenticated({required final Session session}) =
      _$AuthAuthenticatedImpl;
  const AuthAuthenticated._() : super._();

  Session get session;
  @JsonKey(ignore: true)
  _$$AuthAuthenticatedImplCopyWith<_$AuthAuthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthUnauthenticatedImplCopyWith<$Res> {
  factory _$$AuthUnauthenticatedImplCopyWith(_$AuthUnauthenticatedImpl value,
          $Res Function(_$AuthUnauthenticatedImpl) then) =
      __$$AuthUnauthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthUnauthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthUnauthenticatedImpl>
    implements _$$AuthUnauthenticatedImplCopyWith<$Res> {
  __$$AuthUnauthenticatedImplCopyWithImpl(_$AuthUnauthenticatedImpl _value,
      $Res Function(_$AuthUnauthenticatedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthUnauthenticatedImpl extends AuthUnauthenticated {
  const _$AuthUnauthenticatedImpl() : super._();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthUnauthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Session session) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() sessionExpired,
    required TResult Function(Failure failure) error,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Session session)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? sessionExpired,
    TResult? Function(Failure failure)? error,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Session session)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? sessionExpired,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthSessionExpired value) sessionExpired,
    required TResult Function(AuthError value) error,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthSessionExpired value)? sessionExpired,
    TResult? Function(AuthError value)? error,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthSessionExpired value)? sessionExpired,
    TResult Function(AuthError value)? error,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class AuthUnauthenticated extends AuthState {
  const factory AuthUnauthenticated() = _$AuthUnauthenticatedImpl;
  const AuthUnauthenticated._() : super._();
}

/// @nodoc
abstract class _$$AuthSessionExpiredImplCopyWith<$Res> {
  factory _$$AuthSessionExpiredImplCopyWith(_$AuthSessionExpiredImpl value,
          $Res Function(_$AuthSessionExpiredImpl) then) =
      __$$AuthSessionExpiredImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthSessionExpiredImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthSessionExpiredImpl>
    implements _$$AuthSessionExpiredImplCopyWith<$Res> {
  __$$AuthSessionExpiredImplCopyWithImpl(_$AuthSessionExpiredImpl _value,
      $Res Function(_$AuthSessionExpiredImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthSessionExpiredImpl extends AuthSessionExpired {
  const _$AuthSessionExpiredImpl() : super._();

  @override
  String toString() {
    return 'AuthState.sessionExpired()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthSessionExpiredImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Session session) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() sessionExpired,
    required TResult Function(Failure failure) error,
  }) {
    return sessionExpired();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Session session)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? sessionExpired,
    TResult? Function(Failure failure)? error,
  }) {
    return sessionExpired?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Session session)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? sessionExpired,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (sessionExpired != null) {
      return sessionExpired();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthSessionExpired value) sessionExpired,
    required TResult Function(AuthError value) error,
  }) {
    return sessionExpired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthSessionExpired value)? sessionExpired,
    TResult? Function(AuthError value)? error,
  }) {
    return sessionExpired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthSessionExpired value)? sessionExpired,
    TResult Function(AuthError value)? error,
    required TResult orElse(),
  }) {
    if (sessionExpired != null) {
      return sessionExpired(this);
    }
    return orElse();
  }
}

abstract class AuthSessionExpired extends AuthState {
  const factory AuthSessionExpired() = _$AuthSessionExpiredImpl;
  const AuthSessionExpired._() : super._();
}

/// @nodoc
abstract class _$$AuthErrorImplCopyWith<$Res> {
  factory _$$AuthErrorImplCopyWith(
          _$AuthErrorImpl value, $Res Function(_$AuthErrorImpl) then) =
      __$$AuthErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$AuthErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthErrorImpl>
    implements _$$AuthErrorImplCopyWith<$Res> {
  __$$AuthErrorImplCopyWithImpl(
      _$AuthErrorImpl _value, $Res Function(_$AuthErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$AuthErrorImpl(
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

class _$AuthErrorImpl extends AuthError {
  const _$AuthErrorImpl({required this.failure}) : super._();

  @override
  final Failure failure;

  @override
  String toString() {
    return 'AuthState.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthErrorImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthErrorImplCopyWith<_$AuthErrorImpl> get copyWith =>
      __$$AuthErrorImplCopyWithImpl<_$AuthErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Session session) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() sessionExpired,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Session session)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? sessionExpired,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Session session)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? sessionExpired,
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
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthSessionExpired value) sessionExpired,
    required TResult Function(AuthError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthSessionExpired value)? sessionExpired,
    TResult? Function(AuthError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthSessionExpired value)? sessionExpired,
    TResult Function(AuthError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthError extends AuthState {
  const factory AuthError({required final Failure failure}) = _$AuthErrorImpl;
  const AuthError._() : super._();

  Failure get failure;
  @JsonKey(ignore: true)
  _$$AuthErrorImplCopyWith<_$AuthErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
