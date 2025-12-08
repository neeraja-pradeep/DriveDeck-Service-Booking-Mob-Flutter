// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShopListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Shop> shops, bool hasMore, int currentPage)
        loaded,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Shop> shops, bool hasMore, int currentPage)? loaded,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Shop> shops, bool hasMore, int currentPage)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShopListInitial value) initial,
    required TResult Function(ShopListLoading value) loading,
    required TResult Function(ShopListLoaded value) loaded,
    required TResult Function(ShopListError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShopListInitial value)? initial,
    TResult? Function(ShopListLoading value)? loading,
    TResult? Function(ShopListLoaded value)? loaded,
    TResult? Function(ShopListError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShopListInitial value)? initial,
    TResult Function(ShopListLoading value)? loading,
    TResult Function(ShopListLoaded value)? loaded,
    TResult Function(ShopListError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopListStateCopyWith<$Res> {
  factory $ShopListStateCopyWith(
          ShopListState value, $Res Function(ShopListState) then) =
      _$ShopListStateCopyWithImpl<$Res, ShopListState>;
}

/// @nodoc
class _$ShopListStateCopyWithImpl<$Res, $Val extends ShopListState>
    implements $ShopListStateCopyWith<$Res> {
  _$ShopListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ShopListInitialImplCopyWith<$Res> {
  factory _$$ShopListInitialImplCopyWith(_$ShopListInitialImpl value,
          $Res Function(_$ShopListInitialImpl) then) =
      __$$ShopListInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShopListInitialImplCopyWithImpl<$Res>
    extends _$ShopListStateCopyWithImpl<$Res, _$ShopListInitialImpl>
    implements _$$ShopListInitialImplCopyWith<$Res> {
  __$$ShopListInitialImplCopyWithImpl(
      _$ShopListInitialImpl _value, $Res Function(_$ShopListInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ShopListInitialImpl implements ShopListInitial {
  const _$ShopListInitialImpl();

  @override
  String toString() {
    return 'ShopListState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ShopListInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Shop> shops, bool hasMore, int currentPage)
        loaded,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Shop> shops, bool hasMore, int currentPage)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Shop> shops, bool hasMore, int currentPage)? loaded,
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
    required TResult Function(ShopListInitial value) initial,
    required TResult Function(ShopListLoading value) loading,
    required TResult Function(ShopListLoaded value) loaded,
    required TResult Function(ShopListError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShopListInitial value)? initial,
    TResult? Function(ShopListLoading value)? loading,
    TResult? Function(ShopListLoaded value)? loaded,
    TResult? Function(ShopListError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShopListInitial value)? initial,
    TResult Function(ShopListLoading value)? loading,
    TResult Function(ShopListLoaded value)? loaded,
    TResult Function(ShopListError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ShopListInitial implements ShopListState {
  const factory ShopListInitial() = _$ShopListInitialImpl;
}

/// @nodoc
abstract class _$$ShopListLoadingImplCopyWith<$Res> {
  factory _$$ShopListLoadingImplCopyWith(_$ShopListLoadingImpl value,
          $Res Function(_$ShopListLoadingImpl) then) =
      __$$ShopListLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShopListLoadingImplCopyWithImpl<$Res>
    extends _$ShopListStateCopyWithImpl<$Res, _$ShopListLoadingImpl>
    implements _$$ShopListLoadingImplCopyWith<$Res> {
  __$$ShopListLoadingImplCopyWithImpl(
      _$ShopListLoadingImpl _value, $Res Function(_$ShopListLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ShopListLoadingImpl implements ShopListLoading {
  const _$ShopListLoadingImpl();

  @override
  String toString() {
    return 'ShopListState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ShopListLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Shop> shops, bool hasMore, int currentPage)
        loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Shop> shops, bool hasMore, int currentPage)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Shop> shops, bool hasMore, int currentPage)? loaded,
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
    required TResult Function(ShopListInitial value) initial,
    required TResult Function(ShopListLoading value) loading,
    required TResult Function(ShopListLoaded value) loaded,
    required TResult Function(ShopListError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShopListInitial value)? initial,
    TResult? Function(ShopListLoading value)? loading,
    TResult? Function(ShopListLoaded value)? loaded,
    TResult? Function(ShopListError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShopListInitial value)? initial,
    TResult Function(ShopListLoading value)? loading,
    TResult Function(ShopListLoaded value)? loaded,
    TResult Function(ShopListError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ShopListLoading implements ShopListState {
  const factory ShopListLoading() = _$ShopListLoadingImpl;
}

/// @nodoc
abstract class _$$ShopListLoadedImplCopyWith<$Res> {
  factory _$$ShopListLoadedImplCopyWith(_$ShopListLoadedImpl value,
          $Res Function(_$ShopListLoadedImpl) then) =
      __$$ShopListLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Shop> shops, bool hasMore, int currentPage});
}

/// @nodoc
class __$$ShopListLoadedImplCopyWithImpl<$Res>
    extends _$ShopListStateCopyWithImpl<$Res, _$ShopListLoadedImpl>
    implements _$$ShopListLoadedImplCopyWith<$Res> {
  __$$ShopListLoadedImplCopyWithImpl(
      _$ShopListLoadedImpl _value, $Res Function(_$ShopListLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shops = null,
    Object? hasMore = null,
    Object? currentPage = null,
  }) {
    return _then(_$ShopListLoadedImpl(
      shops: null == shops
          ? _value._shops
          : shops // ignore: cast_nullable_to_non_nullable
              as List<Shop>,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ShopListLoadedImpl implements ShopListLoaded {
  const _$ShopListLoadedImpl(
      {required final List<Shop> shops,
      this.hasMore = false,
      this.currentPage = 1})
      : _shops = shops;

  final List<Shop> _shops;
  @override
  List<Shop> get shops {
    if (_shops is EqualUnmodifiableListView) return _shops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shops);
  }

  @override
  @JsonKey()
  final bool hasMore;
  @override
  @JsonKey()
  final int currentPage;

  @override
  String toString() {
    return 'ShopListState.loaded(shops: $shops, hasMore: $hasMore, currentPage: $currentPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopListLoadedImpl &&
            const DeepCollectionEquality().equals(other._shops, _shops) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_shops), hasMore, currentPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopListLoadedImplCopyWith<_$ShopListLoadedImpl> get copyWith =>
      __$$ShopListLoadedImplCopyWithImpl<_$ShopListLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Shop> shops, bool hasMore, int currentPage)
        loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loaded(shops, hasMore, currentPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Shop> shops, bool hasMore, int currentPage)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loaded?.call(shops, hasMore, currentPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Shop> shops, bool hasMore, int currentPage)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(shops, hasMore, currentPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShopListInitial value) initial,
    required TResult Function(ShopListLoading value) loading,
    required TResult Function(ShopListLoaded value) loaded,
    required TResult Function(ShopListError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShopListInitial value)? initial,
    TResult? Function(ShopListLoading value)? loading,
    TResult? Function(ShopListLoaded value)? loaded,
    TResult? Function(ShopListError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShopListInitial value)? initial,
    TResult Function(ShopListLoading value)? loading,
    TResult Function(ShopListLoaded value)? loaded,
    TResult Function(ShopListError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ShopListLoaded implements ShopListState {
  const factory ShopListLoaded(
      {required final List<Shop> shops,
      final bool hasMore,
      final int currentPage}) = _$ShopListLoadedImpl;

  List<Shop> get shops;
  bool get hasMore;
  int get currentPage;
  @JsonKey(ignore: true)
  _$$ShopListLoadedImplCopyWith<_$ShopListLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShopListErrorImplCopyWith<$Res> {
  factory _$$ShopListErrorImplCopyWith(
          _$ShopListErrorImpl value, $Res Function(_$ShopListErrorImpl) then) =
      __$$ShopListErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$ShopListErrorImplCopyWithImpl<$Res>
    extends _$ShopListStateCopyWithImpl<$Res, _$ShopListErrorImpl>
    implements _$$ShopListErrorImplCopyWith<$Res> {
  __$$ShopListErrorImplCopyWithImpl(
      _$ShopListErrorImpl _value, $Res Function(_$ShopListErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$ShopListErrorImpl(
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

class _$ShopListErrorImpl implements ShopListError {
  const _$ShopListErrorImpl({required this.failure});

  @override
  final Failure failure;

  @override
  String toString() {
    return 'ShopListState.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopListErrorImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopListErrorImplCopyWith<_$ShopListErrorImpl> get copyWith =>
      __$$ShopListErrorImplCopyWithImpl<_$ShopListErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Shop> shops, bool hasMore, int currentPage)
        loaded,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Shop> shops, bool hasMore, int currentPage)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Shop> shops, bool hasMore, int currentPage)? loaded,
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
    required TResult Function(ShopListInitial value) initial,
    required TResult Function(ShopListLoading value) loading,
    required TResult Function(ShopListLoaded value) loaded,
    required TResult Function(ShopListError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShopListInitial value)? initial,
    TResult? Function(ShopListLoading value)? loading,
    TResult? Function(ShopListLoaded value)? loaded,
    TResult? Function(ShopListError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShopListInitial value)? initial,
    TResult Function(ShopListLoading value)? loading,
    TResult Function(ShopListLoaded value)? loaded,
    TResult Function(ShopListError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ShopListError implements ShopListState {
  const factory ShopListError({required final Failure failure}) =
      _$ShopListErrorImpl;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$ShopListErrorImplCopyWith<_$ShopListErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ShopDetailsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Shop shop) loaded,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Shop shop)? loaded,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Shop shop)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShopDetailsInitial value) initial,
    required TResult Function(ShopDetailsLoading value) loading,
    required TResult Function(ShopDetailsLoaded value) loaded,
    required TResult Function(ShopDetailsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShopDetailsInitial value)? initial,
    TResult? Function(ShopDetailsLoading value)? loading,
    TResult? Function(ShopDetailsLoaded value)? loaded,
    TResult? Function(ShopDetailsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShopDetailsInitial value)? initial,
    TResult Function(ShopDetailsLoading value)? loading,
    TResult Function(ShopDetailsLoaded value)? loaded,
    TResult Function(ShopDetailsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopDetailsStateCopyWith<$Res> {
  factory $ShopDetailsStateCopyWith(
          ShopDetailsState value, $Res Function(ShopDetailsState) then) =
      _$ShopDetailsStateCopyWithImpl<$Res, ShopDetailsState>;
}

/// @nodoc
class _$ShopDetailsStateCopyWithImpl<$Res, $Val extends ShopDetailsState>
    implements $ShopDetailsStateCopyWith<$Res> {
  _$ShopDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ShopDetailsInitialImplCopyWith<$Res> {
  factory _$$ShopDetailsInitialImplCopyWith(_$ShopDetailsInitialImpl value,
          $Res Function(_$ShopDetailsInitialImpl) then) =
      __$$ShopDetailsInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShopDetailsInitialImplCopyWithImpl<$Res>
    extends _$ShopDetailsStateCopyWithImpl<$Res, _$ShopDetailsInitialImpl>
    implements _$$ShopDetailsInitialImplCopyWith<$Res> {
  __$$ShopDetailsInitialImplCopyWithImpl(_$ShopDetailsInitialImpl _value,
      $Res Function(_$ShopDetailsInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ShopDetailsInitialImpl implements ShopDetailsInitial {
  const _$ShopDetailsInitialImpl();

  @override
  String toString() {
    return 'ShopDetailsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ShopDetailsInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Shop shop) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Shop shop)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Shop shop)? loaded,
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
    required TResult Function(ShopDetailsInitial value) initial,
    required TResult Function(ShopDetailsLoading value) loading,
    required TResult Function(ShopDetailsLoaded value) loaded,
    required TResult Function(ShopDetailsError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShopDetailsInitial value)? initial,
    TResult? Function(ShopDetailsLoading value)? loading,
    TResult? Function(ShopDetailsLoaded value)? loaded,
    TResult? Function(ShopDetailsError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShopDetailsInitial value)? initial,
    TResult Function(ShopDetailsLoading value)? loading,
    TResult Function(ShopDetailsLoaded value)? loaded,
    TResult Function(ShopDetailsError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ShopDetailsInitial implements ShopDetailsState {
  const factory ShopDetailsInitial() = _$ShopDetailsInitialImpl;
}

/// @nodoc
abstract class _$$ShopDetailsLoadingImplCopyWith<$Res> {
  factory _$$ShopDetailsLoadingImplCopyWith(_$ShopDetailsLoadingImpl value,
          $Res Function(_$ShopDetailsLoadingImpl) then) =
      __$$ShopDetailsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShopDetailsLoadingImplCopyWithImpl<$Res>
    extends _$ShopDetailsStateCopyWithImpl<$Res, _$ShopDetailsLoadingImpl>
    implements _$$ShopDetailsLoadingImplCopyWith<$Res> {
  __$$ShopDetailsLoadingImplCopyWithImpl(_$ShopDetailsLoadingImpl _value,
      $Res Function(_$ShopDetailsLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ShopDetailsLoadingImpl implements ShopDetailsLoading {
  const _$ShopDetailsLoadingImpl();

  @override
  String toString() {
    return 'ShopDetailsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ShopDetailsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Shop shop) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Shop shop)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Shop shop)? loaded,
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
    required TResult Function(ShopDetailsInitial value) initial,
    required TResult Function(ShopDetailsLoading value) loading,
    required TResult Function(ShopDetailsLoaded value) loaded,
    required TResult Function(ShopDetailsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShopDetailsInitial value)? initial,
    TResult? Function(ShopDetailsLoading value)? loading,
    TResult? Function(ShopDetailsLoaded value)? loaded,
    TResult? Function(ShopDetailsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShopDetailsInitial value)? initial,
    TResult Function(ShopDetailsLoading value)? loading,
    TResult Function(ShopDetailsLoaded value)? loaded,
    TResult Function(ShopDetailsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ShopDetailsLoading implements ShopDetailsState {
  const factory ShopDetailsLoading() = _$ShopDetailsLoadingImpl;
}

/// @nodoc
abstract class _$$ShopDetailsLoadedImplCopyWith<$Res> {
  factory _$$ShopDetailsLoadedImplCopyWith(_$ShopDetailsLoadedImpl value,
          $Res Function(_$ShopDetailsLoadedImpl) then) =
      __$$ShopDetailsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Shop shop});

  $ShopCopyWith<$Res> get shop;
}

/// @nodoc
class __$$ShopDetailsLoadedImplCopyWithImpl<$Res>
    extends _$ShopDetailsStateCopyWithImpl<$Res, _$ShopDetailsLoadedImpl>
    implements _$$ShopDetailsLoadedImplCopyWith<$Res> {
  __$$ShopDetailsLoadedImplCopyWithImpl(_$ShopDetailsLoadedImpl _value,
      $Res Function(_$ShopDetailsLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shop = null,
  }) {
    return _then(_$ShopDetailsLoadedImpl(
      shop: null == shop
          ? _value.shop
          : shop // ignore: cast_nullable_to_non_nullable
              as Shop,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ShopCopyWith<$Res> get shop {
    return $ShopCopyWith<$Res>(_value.shop, (value) {
      return _then(_value.copyWith(shop: value));
    });
  }
}

/// @nodoc

class _$ShopDetailsLoadedImpl implements ShopDetailsLoaded {
  const _$ShopDetailsLoadedImpl({required this.shop});

  @override
  final Shop shop;

  @override
  String toString() {
    return 'ShopDetailsState.loaded(shop: $shop)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopDetailsLoadedImpl &&
            (identical(other.shop, shop) || other.shop == shop));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shop);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopDetailsLoadedImplCopyWith<_$ShopDetailsLoadedImpl> get copyWith =>
      __$$ShopDetailsLoadedImplCopyWithImpl<_$ShopDetailsLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Shop shop) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loaded(shop);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Shop shop)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loaded?.call(shop);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Shop shop)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(shop);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShopDetailsInitial value) initial,
    required TResult Function(ShopDetailsLoading value) loading,
    required TResult Function(ShopDetailsLoaded value) loaded,
    required TResult Function(ShopDetailsError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShopDetailsInitial value)? initial,
    TResult? Function(ShopDetailsLoading value)? loading,
    TResult? Function(ShopDetailsLoaded value)? loaded,
    TResult? Function(ShopDetailsError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShopDetailsInitial value)? initial,
    TResult Function(ShopDetailsLoading value)? loading,
    TResult Function(ShopDetailsLoaded value)? loaded,
    TResult Function(ShopDetailsError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ShopDetailsLoaded implements ShopDetailsState {
  const factory ShopDetailsLoaded({required final Shop shop}) =
      _$ShopDetailsLoadedImpl;

  Shop get shop;
  @JsonKey(ignore: true)
  _$$ShopDetailsLoadedImplCopyWith<_$ShopDetailsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShopDetailsErrorImplCopyWith<$Res> {
  factory _$$ShopDetailsErrorImplCopyWith(_$ShopDetailsErrorImpl value,
          $Res Function(_$ShopDetailsErrorImpl) then) =
      __$$ShopDetailsErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$ShopDetailsErrorImplCopyWithImpl<$Res>
    extends _$ShopDetailsStateCopyWithImpl<$Res, _$ShopDetailsErrorImpl>
    implements _$$ShopDetailsErrorImplCopyWith<$Res> {
  __$$ShopDetailsErrorImplCopyWithImpl(_$ShopDetailsErrorImpl _value,
      $Res Function(_$ShopDetailsErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$ShopDetailsErrorImpl(
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

class _$ShopDetailsErrorImpl implements ShopDetailsError {
  const _$ShopDetailsErrorImpl({required this.failure});

  @override
  final Failure failure;

  @override
  String toString() {
    return 'ShopDetailsState.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopDetailsErrorImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopDetailsErrorImplCopyWith<_$ShopDetailsErrorImpl> get copyWith =>
      __$$ShopDetailsErrorImplCopyWithImpl<_$ShopDetailsErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Shop shop) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Shop shop)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Shop shop)? loaded,
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
    required TResult Function(ShopDetailsInitial value) initial,
    required TResult Function(ShopDetailsLoading value) loading,
    required TResult Function(ShopDetailsLoaded value) loaded,
    required TResult Function(ShopDetailsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShopDetailsInitial value)? initial,
    TResult? Function(ShopDetailsLoading value)? loading,
    TResult? Function(ShopDetailsLoaded value)? loaded,
    TResult? Function(ShopDetailsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShopDetailsInitial value)? initial,
    TResult Function(ShopDetailsLoading value)? loading,
    TResult Function(ShopDetailsLoaded value)? loaded,
    TResult Function(ShopDetailsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ShopDetailsError implements ShopDetailsState {
  const factory ShopDetailsError({required final Failure failure}) =
      _$ShopDetailsErrorImpl;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$ShopDetailsErrorImplCopyWith<_$ShopDetailsErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ShopAvailabilityState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ShopDateAvailability> availability) loaded,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ShopDateAvailability> availability)? loaded,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ShopDateAvailability> availability)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShopAvailabilityInitial value) initial,
    required TResult Function(ShopAvailabilityLoading value) loading,
    required TResult Function(ShopAvailabilityLoaded value) loaded,
    required TResult Function(ShopAvailabilityError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShopAvailabilityInitial value)? initial,
    TResult? Function(ShopAvailabilityLoading value)? loading,
    TResult? Function(ShopAvailabilityLoaded value)? loaded,
    TResult? Function(ShopAvailabilityError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShopAvailabilityInitial value)? initial,
    TResult Function(ShopAvailabilityLoading value)? loading,
    TResult Function(ShopAvailabilityLoaded value)? loaded,
    TResult Function(ShopAvailabilityError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopAvailabilityStateCopyWith<$Res> {
  factory $ShopAvailabilityStateCopyWith(ShopAvailabilityState value,
          $Res Function(ShopAvailabilityState) then) =
      _$ShopAvailabilityStateCopyWithImpl<$Res, ShopAvailabilityState>;
}

/// @nodoc
class _$ShopAvailabilityStateCopyWithImpl<$Res,
        $Val extends ShopAvailabilityState>
    implements $ShopAvailabilityStateCopyWith<$Res> {
  _$ShopAvailabilityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ShopAvailabilityInitialImplCopyWith<$Res> {
  factory _$$ShopAvailabilityInitialImplCopyWith(
          _$ShopAvailabilityInitialImpl value,
          $Res Function(_$ShopAvailabilityInitialImpl) then) =
      __$$ShopAvailabilityInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShopAvailabilityInitialImplCopyWithImpl<$Res>
    extends _$ShopAvailabilityStateCopyWithImpl<$Res,
        _$ShopAvailabilityInitialImpl>
    implements _$$ShopAvailabilityInitialImplCopyWith<$Res> {
  __$$ShopAvailabilityInitialImplCopyWithImpl(
      _$ShopAvailabilityInitialImpl _value,
      $Res Function(_$ShopAvailabilityInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ShopAvailabilityInitialImpl implements ShopAvailabilityInitial {
  const _$ShopAvailabilityInitialImpl();

  @override
  String toString() {
    return 'ShopAvailabilityState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopAvailabilityInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ShopDateAvailability> availability) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ShopDateAvailability> availability)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ShopDateAvailability> availability)? loaded,
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
    required TResult Function(ShopAvailabilityInitial value) initial,
    required TResult Function(ShopAvailabilityLoading value) loading,
    required TResult Function(ShopAvailabilityLoaded value) loaded,
    required TResult Function(ShopAvailabilityError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShopAvailabilityInitial value)? initial,
    TResult? Function(ShopAvailabilityLoading value)? loading,
    TResult? Function(ShopAvailabilityLoaded value)? loaded,
    TResult? Function(ShopAvailabilityError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShopAvailabilityInitial value)? initial,
    TResult Function(ShopAvailabilityLoading value)? loading,
    TResult Function(ShopAvailabilityLoaded value)? loaded,
    TResult Function(ShopAvailabilityError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ShopAvailabilityInitial implements ShopAvailabilityState {
  const factory ShopAvailabilityInitial() = _$ShopAvailabilityInitialImpl;
}

/// @nodoc
abstract class _$$ShopAvailabilityLoadingImplCopyWith<$Res> {
  factory _$$ShopAvailabilityLoadingImplCopyWith(
          _$ShopAvailabilityLoadingImpl value,
          $Res Function(_$ShopAvailabilityLoadingImpl) then) =
      __$$ShopAvailabilityLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShopAvailabilityLoadingImplCopyWithImpl<$Res>
    extends _$ShopAvailabilityStateCopyWithImpl<$Res,
        _$ShopAvailabilityLoadingImpl>
    implements _$$ShopAvailabilityLoadingImplCopyWith<$Res> {
  __$$ShopAvailabilityLoadingImplCopyWithImpl(
      _$ShopAvailabilityLoadingImpl _value,
      $Res Function(_$ShopAvailabilityLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ShopAvailabilityLoadingImpl implements ShopAvailabilityLoading {
  const _$ShopAvailabilityLoadingImpl();

  @override
  String toString() {
    return 'ShopAvailabilityState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopAvailabilityLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ShopDateAvailability> availability) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ShopDateAvailability> availability)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ShopDateAvailability> availability)? loaded,
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
    required TResult Function(ShopAvailabilityInitial value) initial,
    required TResult Function(ShopAvailabilityLoading value) loading,
    required TResult Function(ShopAvailabilityLoaded value) loaded,
    required TResult Function(ShopAvailabilityError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShopAvailabilityInitial value)? initial,
    TResult? Function(ShopAvailabilityLoading value)? loading,
    TResult? Function(ShopAvailabilityLoaded value)? loaded,
    TResult? Function(ShopAvailabilityError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShopAvailabilityInitial value)? initial,
    TResult Function(ShopAvailabilityLoading value)? loading,
    TResult Function(ShopAvailabilityLoaded value)? loaded,
    TResult Function(ShopAvailabilityError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ShopAvailabilityLoading implements ShopAvailabilityState {
  const factory ShopAvailabilityLoading() = _$ShopAvailabilityLoadingImpl;
}

/// @nodoc
abstract class _$$ShopAvailabilityLoadedImplCopyWith<$Res> {
  factory _$$ShopAvailabilityLoadedImplCopyWith(
          _$ShopAvailabilityLoadedImpl value,
          $Res Function(_$ShopAvailabilityLoadedImpl) then) =
      __$$ShopAvailabilityLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ShopDateAvailability> availability});
}

/// @nodoc
class __$$ShopAvailabilityLoadedImplCopyWithImpl<$Res>
    extends _$ShopAvailabilityStateCopyWithImpl<$Res,
        _$ShopAvailabilityLoadedImpl>
    implements _$$ShopAvailabilityLoadedImplCopyWith<$Res> {
  __$$ShopAvailabilityLoadedImplCopyWithImpl(
      _$ShopAvailabilityLoadedImpl _value,
      $Res Function(_$ShopAvailabilityLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availability = null,
  }) {
    return _then(_$ShopAvailabilityLoadedImpl(
      availability: null == availability
          ? _value._availability
          : availability // ignore: cast_nullable_to_non_nullable
              as List<ShopDateAvailability>,
    ));
  }
}

/// @nodoc

class _$ShopAvailabilityLoadedImpl implements ShopAvailabilityLoaded {
  const _$ShopAvailabilityLoadedImpl(
      {required final List<ShopDateAvailability> availability})
      : _availability = availability;

  final List<ShopDateAvailability> _availability;
  @override
  List<ShopDateAvailability> get availability {
    if (_availability is EqualUnmodifiableListView) return _availability;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availability);
  }

  @override
  String toString() {
    return 'ShopAvailabilityState.loaded(availability: $availability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopAvailabilityLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._availability, _availability));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_availability));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopAvailabilityLoadedImplCopyWith<_$ShopAvailabilityLoadedImpl>
      get copyWith => __$$ShopAvailabilityLoadedImplCopyWithImpl<
          _$ShopAvailabilityLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ShopDateAvailability> availability) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loaded(availability);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ShopDateAvailability> availability)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loaded?.call(availability);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ShopDateAvailability> availability)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(availability);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShopAvailabilityInitial value) initial,
    required TResult Function(ShopAvailabilityLoading value) loading,
    required TResult Function(ShopAvailabilityLoaded value) loaded,
    required TResult Function(ShopAvailabilityError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShopAvailabilityInitial value)? initial,
    TResult? Function(ShopAvailabilityLoading value)? loading,
    TResult? Function(ShopAvailabilityLoaded value)? loaded,
    TResult? Function(ShopAvailabilityError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShopAvailabilityInitial value)? initial,
    TResult Function(ShopAvailabilityLoading value)? loading,
    TResult Function(ShopAvailabilityLoaded value)? loaded,
    TResult Function(ShopAvailabilityError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ShopAvailabilityLoaded implements ShopAvailabilityState {
  const factory ShopAvailabilityLoaded(
          {required final List<ShopDateAvailability> availability}) =
      _$ShopAvailabilityLoadedImpl;

  List<ShopDateAvailability> get availability;
  @JsonKey(ignore: true)
  _$$ShopAvailabilityLoadedImplCopyWith<_$ShopAvailabilityLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShopAvailabilityErrorImplCopyWith<$Res> {
  factory _$$ShopAvailabilityErrorImplCopyWith(
          _$ShopAvailabilityErrorImpl value,
          $Res Function(_$ShopAvailabilityErrorImpl) then) =
      __$$ShopAvailabilityErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$ShopAvailabilityErrorImplCopyWithImpl<$Res>
    extends _$ShopAvailabilityStateCopyWithImpl<$Res,
        _$ShopAvailabilityErrorImpl>
    implements _$$ShopAvailabilityErrorImplCopyWith<$Res> {
  __$$ShopAvailabilityErrorImplCopyWithImpl(_$ShopAvailabilityErrorImpl _value,
      $Res Function(_$ShopAvailabilityErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$ShopAvailabilityErrorImpl(
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

class _$ShopAvailabilityErrorImpl implements ShopAvailabilityError {
  const _$ShopAvailabilityErrorImpl({required this.failure});

  @override
  final Failure failure;

  @override
  String toString() {
    return 'ShopAvailabilityState.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopAvailabilityErrorImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopAvailabilityErrorImplCopyWith<_$ShopAvailabilityErrorImpl>
      get copyWith => __$$ShopAvailabilityErrorImplCopyWithImpl<
          _$ShopAvailabilityErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ShopDateAvailability> availability) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ShopDateAvailability> availability)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ShopDateAvailability> availability)? loaded,
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
    required TResult Function(ShopAvailabilityInitial value) initial,
    required TResult Function(ShopAvailabilityLoading value) loading,
    required TResult Function(ShopAvailabilityLoaded value) loaded,
    required TResult Function(ShopAvailabilityError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShopAvailabilityInitial value)? initial,
    TResult? Function(ShopAvailabilityLoading value)? loading,
    TResult? Function(ShopAvailabilityLoaded value)? loaded,
    TResult? Function(ShopAvailabilityError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShopAvailabilityInitial value)? initial,
    TResult Function(ShopAvailabilityLoading value)? loading,
    TResult Function(ShopAvailabilityLoaded value)? loaded,
    TResult Function(ShopAvailabilityError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ShopAvailabilityError implements ShopAvailabilityState {
  const factory ShopAvailabilityError({required final Failure failure}) =
      _$ShopAvailabilityErrorImpl;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$ShopAvailabilityErrorImplCopyWith<_$ShopAvailabilityErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FavoriteShopsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Shop> shops) loaded,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Shop> shops)? loaded,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Shop> shops)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteShopsInitial value) initial,
    required TResult Function(FavoriteShopsLoading value) loading,
    required TResult Function(FavoriteShopsLoaded value) loaded,
    required TResult Function(FavoriteShopsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteShopsInitial value)? initial,
    TResult? Function(FavoriteShopsLoading value)? loading,
    TResult? Function(FavoriteShopsLoaded value)? loaded,
    TResult? Function(FavoriteShopsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteShopsInitial value)? initial,
    TResult Function(FavoriteShopsLoading value)? loading,
    TResult Function(FavoriteShopsLoaded value)? loaded,
    TResult Function(FavoriteShopsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteShopsStateCopyWith<$Res> {
  factory $FavoriteShopsStateCopyWith(
          FavoriteShopsState value, $Res Function(FavoriteShopsState) then) =
      _$FavoriteShopsStateCopyWithImpl<$Res, FavoriteShopsState>;
}

/// @nodoc
class _$FavoriteShopsStateCopyWithImpl<$Res, $Val extends FavoriteShopsState>
    implements $FavoriteShopsStateCopyWith<$Res> {
  _$FavoriteShopsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FavoriteShopsInitialImplCopyWith<$Res> {
  factory _$$FavoriteShopsInitialImplCopyWith(_$FavoriteShopsInitialImpl value,
          $Res Function(_$FavoriteShopsInitialImpl) then) =
      __$$FavoriteShopsInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FavoriteShopsInitialImplCopyWithImpl<$Res>
    extends _$FavoriteShopsStateCopyWithImpl<$Res, _$FavoriteShopsInitialImpl>
    implements _$$FavoriteShopsInitialImplCopyWith<$Res> {
  __$$FavoriteShopsInitialImplCopyWithImpl(_$FavoriteShopsInitialImpl _value,
      $Res Function(_$FavoriteShopsInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FavoriteShopsInitialImpl implements FavoriteShopsInitial {
  const _$FavoriteShopsInitialImpl();

  @override
  String toString() {
    return 'FavoriteShopsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteShopsInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Shop> shops) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Shop> shops)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Shop> shops)? loaded,
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
    required TResult Function(FavoriteShopsInitial value) initial,
    required TResult Function(FavoriteShopsLoading value) loading,
    required TResult Function(FavoriteShopsLoaded value) loaded,
    required TResult Function(FavoriteShopsError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteShopsInitial value)? initial,
    TResult? Function(FavoriteShopsLoading value)? loading,
    TResult? Function(FavoriteShopsLoaded value)? loaded,
    TResult? Function(FavoriteShopsError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteShopsInitial value)? initial,
    TResult Function(FavoriteShopsLoading value)? loading,
    TResult Function(FavoriteShopsLoaded value)? loaded,
    TResult Function(FavoriteShopsError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class FavoriteShopsInitial implements FavoriteShopsState {
  const factory FavoriteShopsInitial() = _$FavoriteShopsInitialImpl;
}

/// @nodoc
abstract class _$$FavoriteShopsLoadingImplCopyWith<$Res> {
  factory _$$FavoriteShopsLoadingImplCopyWith(_$FavoriteShopsLoadingImpl value,
          $Res Function(_$FavoriteShopsLoadingImpl) then) =
      __$$FavoriteShopsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FavoriteShopsLoadingImplCopyWithImpl<$Res>
    extends _$FavoriteShopsStateCopyWithImpl<$Res, _$FavoriteShopsLoadingImpl>
    implements _$$FavoriteShopsLoadingImplCopyWith<$Res> {
  __$$FavoriteShopsLoadingImplCopyWithImpl(_$FavoriteShopsLoadingImpl _value,
      $Res Function(_$FavoriteShopsLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FavoriteShopsLoadingImpl implements FavoriteShopsLoading {
  const _$FavoriteShopsLoadingImpl();

  @override
  String toString() {
    return 'FavoriteShopsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteShopsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Shop> shops) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Shop> shops)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Shop> shops)? loaded,
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
    required TResult Function(FavoriteShopsInitial value) initial,
    required TResult Function(FavoriteShopsLoading value) loading,
    required TResult Function(FavoriteShopsLoaded value) loaded,
    required TResult Function(FavoriteShopsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteShopsInitial value)? initial,
    TResult? Function(FavoriteShopsLoading value)? loading,
    TResult? Function(FavoriteShopsLoaded value)? loaded,
    TResult? Function(FavoriteShopsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteShopsInitial value)? initial,
    TResult Function(FavoriteShopsLoading value)? loading,
    TResult Function(FavoriteShopsLoaded value)? loaded,
    TResult Function(FavoriteShopsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FavoriteShopsLoading implements FavoriteShopsState {
  const factory FavoriteShopsLoading() = _$FavoriteShopsLoadingImpl;
}

/// @nodoc
abstract class _$$FavoriteShopsLoadedImplCopyWith<$Res> {
  factory _$$FavoriteShopsLoadedImplCopyWith(_$FavoriteShopsLoadedImpl value,
          $Res Function(_$FavoriteShopsLoadedImpl) then) =
      __$$FavoriteShopsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Shop> shops});
}

/// @nodoc
class __$$FavoriteShopsLoadedImplCopyWithImpl<$Res>
    extends _$FavoriteShopsStateCopyWithImpl<$Res, _$FavoriteShopsLoadedImpl>
    implements _$$FavoriteShopsLoadedImplCopyWith<$Res> {
  __$$FavoriteShopsLoadedImplCopyWithImpl(_$FavoriteShopsLoadedImpl _value,
      $Res Function(_$FavoriteShopsLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shops = null,
  }) {
    return _then(_$FavoriteShopsLoadedImpl(
      shops: null == shops
          ? _value._shops
          : shops // ignore: cast_nullable_to_non_nullable
              as List<Shop>,
    ));
  }
}

/// @nodoc

class _$FavoriteShopsLoadedImpl implements FavoriteShopsLoaded {
  const _$FavoriteShopsLoadedImpl({required final List<Shop> shops})
      : _shops = shops;

  final List<Shop> _shops;
  @override
  List<Shop> get shops {
    if (_shops is EqualUnmodifiableListView) return _shops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shops);
  }

  @override
  String toString() {
    return 'FavoriteShopsState.loaded(shops: $shops)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteShopsLoadedImpl &&
            const DeepCollectionEquality().equals(other._shops, _shops));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_shops));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteShopsLoadedImplCopyWith<_$FavoriteShopsLoadedImpl> get copyWith =>
      __$$FavoriteShopsLoadedImplCopyWithImpl<_$FavoriteShopsLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Shop> shops) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loaded(shops);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Shop> shops)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loaded?.call(shops);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Shop> shops)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(shops);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteShopsInitial value) initial,
    required TResult Function(FavoriteShopsLoading value) loading,
    required TResult Function(FavoriteShopsLoaded value) loaded,
    required TResult Function(FavoriteShopsError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteShopsInitial value)? initial,
    TResult? Function(FavoriteShopsLoading value)? loading,
    TResult? Function(FavoriteShopsLoaded value)? loaded,
    TResult? Function(FavoriteShopsError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteShopsInitial value)? initial,
    TResult Function(FavoriteShopsLoading value)? loading,
    TResult Function(FavoriteShopsLoaded value)? loaded,
    TResult Function(FavoriteShopsError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class FavoriteShopsLoaded implements FavoriteShopsState {
  const factory FavoriteShopsLoaded({required final List<Shop> shops}) =
      _$FavoriteShopsLoadedImpl;

  List<Shop> get shops;
  @JsonKey(ignore: true)
  _$$FavoriteShopsLoadedImplCopyWith<_$FavoriteShopsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FavoriteShopsErrorImplCopyWith<$Res> {
  factory _$$FavoriteShopsErrorImplCopyWith(_$FavoriteShopsErrorImpl value,
          $Res Function(_$FavoriteShopsErrorImpl) then) =
      __$$FavoriteShopsErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$FavoriteShopsErrorImplCopyWithImpl<$Res>
    extends _$FavoriteShopsStateCopyWithImpl<$Res, _$FavoriteShopsErrorImpl>
    implements _$$FavoriteShopsErrorImplCopyWith<$Res> {
  __$$FavoriteShopsErrorImplCopyWithImpl(_$FavoriteShopsErrorImpl _value,
      $Res Function(_$FavoriteShopsErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$FavoriteShopsErrorImpl(
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

class _$FavoriteShopsErrorImpl implements FavoriteShopsError {
  const _$FavoriteShopsErrorImpl({required this.failure});

  @override
  final Failure failure;

  @override
  String toString() {
    return 'FavoriteShopsState.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteShopsErrorImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteShopsErrorImplCopyWith<_$FavoriteShopsErrorImpl> get copyWith =>
      __$$FavoriteShopsErrorImplCopyWithImpl<_$FavoriteShopsErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Shop> shops) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Shop> shops)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Shop> shops)? loaded,
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
    required TResult Function(FavoriteShopsInitial value) initial,
    required TResult Function(FavoriteShopsLoading value) loading,
    required TResult Function(FavoriteShopsLoaded value) loaded,
    required TResult Function(FavoriteShopsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteShopsInitial value)? initial,
    TResult? Function(FavoriteShopsLoading value)? loading,
    TResult? Function(FavoriteShopsLoaded value)? loaded,
    TResult? Function(FavoriteShopsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteShopsInitial value)? initial,
    TResult Function(FavoriteShopsLoading value)? loading,
    TResult Function(FavoriteShopsLoaded value)? loaded,
    TResult Function(FavoriteShopsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class FavoriteShopsError implements FavoriteShopsState {
  const factory FavoriteShopsError({required final Failure failure}) =
      _$FavoriteShopsErrorImpl;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$FavoriteShopsErrorImplCopyWith<_$FavoriteShopsErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SelectedItemsState {
  Map<String, ShopService> get services => throw _privateConstructorUsedError;
  Map<String, ShopPackage> get packages => throw _privateConstructorUsedError;
  Map<String, ShopAccessory> get accessories =>
      throw _privateConstructorUsedError;
  ShopVehicleType? get vehicleType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectedItemsStateCopyWith<SelectedItemsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedItemsStateCopyWith<$Res> {
  factory $SelectedItemsStateCopyWith(
          SelectedItemsState value, $Res Function(SelectedItemsState) then) =
      _$SelectedItemsStateCopyWithImpl<$Res, SelectedItemsState>;
  @useResult
  $Res call(
      {Map<String, ShopService> services,
      Map<String, ShopPackage> packages,
      Map<String, ShopAccessory> accessories,
      ShopVehicleType? vehicleType});

  $ShopVehicleTypeCopyWith<$Res>? get vehicleType;
}

/// @nodoc
class _$SelectedItemsStateCopyWithImpl<$Res, $Val extends SelectedItemsState>
    implements $SelectedItemsStateCopyWith<$Res> {
  _$SelectedItemsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? services = null,
    Object? packages = null,
    Object? accessories = null,
    Object? vehicleType = freezed,
  }) {
    return _then(_value.copyWith(
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as Map<String, ShopService>,
      packages: null == packages
          ? _value.packages
          : packages // ignore: cast_nullable_to_non_nullable
              as Map<String, ShopPackage>,
      accessories: null == accessories
          ? _value.accessories
          : accessories // ignore: cast_nullable_to_non_nullable
              as Map<String, ShopAccessory>,
      vehicleType: freezed == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as ShopVehicleType?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ShopVehicleTypeCopyWith<$Res>? get vehicleType {
    if (_value.vehicleType == null) {
      return null;
    }

    return $ShopVehicleTypeCopyWith<$Res>(_value.vehicleType!, (value) {
      return _then(_value.copyWith(vehicleType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SelectedItemsStateImplCopyWith<$Res>
    implements $SelectedItemsStateCopyWith<$Res> {
  factory _$$SelectedItemsStateImplCopyWith(_$SelectedItemsStateImpl value,
          $Res Function(_$SelectedItemsStateImpl) then) =
      __$$SelectedItemsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, ShopService> services,
      Map<String, ShopPackage> packages,
      Map<String, ShopAccessory> accessories,
      ShopVehicleType? vehicleType});

  @override
  $ShopVehicleTypeCopyWith<$Res>? get vehicleType;
}

/// @nodoc
class __$$SelectedItemsStateImplCopyWithImpl<$Res>
    extends _$SelectedItemsStateCopyWithImpl<$Res, _$SelectedItemsStateImpl>
    implements _$$SelectedItemsStateImplCopyWith<$Res> {
  __$$SelectedItemsStateImplCopyWithImpl(_$SelectedItemsStateImpl _value,
      $Res Function(_$SelectedItemsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? services = null,
    Object? packages = null,
    Object? accessories = null,
    Object? vehicleType = freezed,
  }) {
    return _then(_$SelectedItemsStateImpl(
      services: null == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as Map<String, ShopService>,
      packages: null == packages
          ? _value._packages
          : packages // ignore: cast_nullable_to_non_nullable
              as Map<String, ShopPackage>,
      accessories: null == accessories
          ? _value._accessories
          : accessories // ignore: cast_nullable_to_non_nullable
              as Map<String, ShopAccessory>,
      vehicleType: freezed == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as ShopVehicleType?,
    ));
  }
}

/// @nodoc

class _$SelectedItemsStateImpl implements _SelectedItemsState {
  const _$SelectedItemsStateImpl(
      {final Map<String, ShopService> services = const {},
      final Map<String, ShopPackage> packages = const {},
      final Map<String, ShopAccessory> accessories = const {},
      this.vehicleType})
      : _services = services,
        _packages = packages,
        _accessories = accessories;

  final Map<String, ShopService> _services;
  @override
  @JsonKey()
  Map<String, ShopService> get services {
    if (_services is EqualUnmodifiableMapView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_services);
  }

  final Map<String, ShopPackage> _packages;
  @override
  @JsonKey()
  Map<String, ShopPackage> get packages {
    if (_packages is EqualUnmodifiableMapView) return _packages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_packages);
  }

  final Map<String, ShopAccessory> _accessories;
  @override
  @JsonKey()
  Map<String, ShopAccessory> get accessories {
    if (_accessories is EqualUnmodifiableMapView) return _accessories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_accessories);
  }

  @override
  final ShopVehicleType? vehicleType;

  @override
  String toString() {
    return 'SelectedItemsState(services: $services, packages: $packages, accessories: $accessories, vehicleType: $vehicleType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedItemsStateImpl &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            const DeepCollectionEquality().equals(other._packages, _packages) &&
            const DeepCollectionEquality()
                .equals(other._accessories, _accessories) &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_services),
      const DeepCollectionEquality().hash(_packages),
      const DeepCollectionEquality().hash(_accessories),
      vehicleType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedItemsStateImplCopyWith<_$SelectedItemsStateImpl> get copyWith =>
      __$$SelectedItemsStateImplCopyWithImpl<_$SelectedItemsStateImpl>(
          this, _$identity);
}

abstract class _SelectedItemsState implements SelectedItemsState {
  const factory _SelectedItemsState(
      {final Map<String, ShopService> services,
      final Map<String, ShopPackage> packages,
      final Map<String, ShopAccessory> accessories,
      final ShopVehicleType? vehicleType}) = _$SelectedItemsStateImpl;

  @override
  Map<String, ShopService> get services;
  @override
  Map<String, ShopPackage> get packages;
  @override
  Map<String, ShopAccessory> get accessories;
  @override
  ShopVehicleType? get vehicleType;
  @override
  @JsonKey(ignore: true)
  _$$SelectedItemsStateImplCopyWith<_$SelectedItemsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
