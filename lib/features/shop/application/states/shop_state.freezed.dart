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
    required TResult Function(List<Shop> shops, bool hasMore, int currentPage) loaded,
    required TResult Function(Failure failure) error,
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
}

/// @nodoc
class _$ShopListInitialImpl implements ShopListInitial {
  const _$ShopListInitialImpl();

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Shop> shops, bool hasMore, int currentPage) loaded,
    required TResult Function(Failure failure) error,
  }) =>
      initial();

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Shop> shops, bool hasMore, int currentPage)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      initial != null ? initial() : orElse();
}

abstract class ShopListInitial implements ShopListState {
  const factory ShopListInitial() = _$ShopListInitialImpl;
}

/// @nodoc
class _$ShopListLoadingImpl implements ShopListLoading {
  const _$ShopListLoadingImpl();

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Shop> shops, bool hasMore, int currentPage) loaded,
    required TResult Function(Failure failure) error,
  }) =>
      loading();

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Shop> shops, bool hasMore, int currentPage)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      loading != null ? loading() : orElse();
}

abstract class ShopListLoading implements ShopListState {
  const factory ShopListLoading() = _$ShopListLoadingImpl;
}

/// @nodoc
class _$ShopListLoadedImpl implements ShopListLoaded {
  const _$ShopListLoadedImpl({
    required this.shops,
    this.hasMore = false,
    this.currentPage = 1,
  });

  @override
  final List<Shop> shops;
  @override
  @JsonKey()
  final bool hasMore;
  @override
  @JsonKey()
  final int currentPage;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Shop> shops, bool hasMore, int currentPage) loaded,
    required TResult Function(Failure failure) error,
  }) =>
      loaded(shops, hasMore, currentPage);

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Shop> shops, bool hasMore, int currentPage)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      loaded != null ? loaded(shops, hasMore, currentPage) : orElse();
}

abstract class ShopListLoaded implements ShopListState {
  const factory ShopListLoaded({
    required final List<Shop> shops,
    final bool hasMore,
    final int currentPage,
  }) = _$ShopListLoadedImpl;

  List<Shop> get shops;
  bool get hasMore;
  int get currentPage;
}

/// @nodoc
class _$ShopListErrorImpl implements ShopListError {
  const _$ShopListErrorImpl({required this.failure});

  @override
  final Failure failure;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Shop> shops, bool hasMore, int currentPage) loaded,
    required TResult Function(Failure failure) error,
  }) =>
      error(failure);

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Shop> shops, bool hasMore, int currentPage)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      error != null ? error(failure) : orElse();
}

abstract class ShopListError implements ShopListState {
  const factory ShopListError({required final Failure failure}) =
      _$ShopListErrorImpl;

  Failure get failure;
}

// ShopDetailsState
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Shop shop)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ShopDetailsInitialImpl implements ShopDetailsInitial {
  const _$ShopDetailsInitialImpl();

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Shop shop) loaded,
    required TResult Function(Failure failure) error,
  }) =>
      initial();

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Shop shop)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      initial != null ? initial() : orElse();
}

abstract class ShopDetailsInitial implements ShopDetailsState {
  const factory ShopDetailsInitial() = _$ShopDetailsInitialImpl;
}

/// @nodoc
class _$ShopDetailsLoadingImpl implements ShopDetailsLoading {
  const _$ShopDetailsLoadingImpl();

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Shop shop) loaded,
    required TResult Function(Failure failure) error,
  }) =>
      loading();

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Shop shop)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      loading != null ? loading() : orElse();
}

abstract class ShopDetailsLoading implements ShopDetailsState {
  const factory ShopDetailsLoading() = _$ShopDetailsLoadingImpl;
}

/// @nodoc
class _$ShopDetailsLoadedImpl implements ShopDetailsLoaded {
  const _$ShopDetailsLoadedImpl({required this.shop});

  @override
  final Shop shop;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Shop shop) loaded,
    required TResult Function(Failure failure) error,
  }) =>
      loaded(shop);

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Shop shop)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      loaded != null ? loaded(shop) : orElse();
}

abstract class ShopDetailsLoaded implements ShopDetailsState {
  const factory ShopDetailsLoaded({required final Shop shop}) =
      _$ShopDetailsLoadedImpl;

  Shop get shop;
}

/// @nodoc
class _$ShopDetailsErrorImpl implements ShopDetailsError {
  const _$ShopDetailsErrorImpl({required this.failure});

  @override
  final Failure failure;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Shop shop) loaded,
    required TResult Function(Failure failure) error,
  }) =>
      error(failure);

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Shop shop)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      error != null ? error(failure) : orElse();
}

abstract class ShopDetailsError implements ShopDetailsState {
  const factory ShopDetailsError({required final Failure failure}) =
      _$ShopDetailsErrorImpl;

  Failure get failure;
}

// Similar implementations for other states - ShopAvailabilityState, FavoriteShopsState, SelectedItemsState
// These would be fully generated by freezed in production

/// @nodoc
mixin _$ShopAvailabilityState {}

class _$ShopAvailabilityInitialImpl implements ShopAvailabilityInitial {
  const _$ShopAvailabilityInitialImpl();
}

abstract class ShopAvailabilityInitial implements ShopAvailabilityState {
  const factory ShopAvailabilityInitial() = _$ShopAvailabilityInitialImpl;
}

class _$ShopAvailabilityLoadingImpl implements ShopAvailabilityLoading {
  const _$ShopAvailabilityLoadingImpl();
}

abstract class ShopAvailabilityLoading implements ShopAvailabilityState {
  const factory ShopAvailabilityLoading() = _$ShopAvailabilityLoadingImpl;
}

class _$ShopAvailabilityLoadedImpl implements ShopAvailabilityLoaded {
  const _$ShopAvailabilityLoadedImpl({required this.availability});
  @override
  final List<ShopDateAvailability> availability;
}

abstract class ShopAvailabilityLoaded implements ShopAvailabilityState {
  const factory ShopAvailabilityLoaded({
    required final List<ShopDateAvailability> availability,
  }) = _$ShopAvailabilityLoadedImpl;
  List<ShopDateAvailability> get availability;
}

class _$ShopAvailabilityErrorImpl implements ShopAvailabilityError {
  const _$ShopAvailabilityErrorImpl({required this.failure});
  @override
  final Failure failure;
}

abstract class ShopAvailabilityError implements ShopAvailabilityState {
  const factory ShopAvailabilityError({required final Failure failure}) =
      _$ShopAvailabilityErrorImpl;
  Failure get failure;
}

/// @nodoc
mixin _$FavoriteShopsState {}

class _$FavoriteShopsInitialImpl implements FavoriteShopsInitial {
  const _$FavoriteShopsInitialImpl();
}

abstract class FavoriteShopsInitial implements FavoriteShopsState {
  const factory FavoriteShopsInitial() = _$FavoriteShopsInitialImpl;
}

class _$FavoriteShopsLoadingImpl implements FavoriteShopsLoading {
  const _$FavoriteShopsLoadingImpl();
}

abstract class FavoriteShopsLoading implements FavoriteShopsState {
  const factory FavoriteShopsLoading() = _$FavoriteShopsLoadingImpl;
}

class _$FavoriteShopsLoadedImpl implements FavoriteShopsLoaded {
  const _$FavoriteShopsLoadedImpl({required this.shops});
  @override
  final List<Shop> shops;
}

abstract class FavoriteShopsLoaded implements FavoriteShopsState {
  const factory FavoriteShopsLoaded({required final List<Shop> shops}) =
      _$FavoriteShopsLoadedImpl;
  List<Shop> get shops;
}

class _$FavoriteShopsErrorImpl implements FavoriteShopsError {
  const _$FavoriteShopsErrorImpl({required this.failure});
  @override
  final Failure failure;
}

abstract class FavoriteShopsError implements FavoriteShopsState {
  const factory FavoriteShopsError({required final Failure failure}) =
      _$FavoriteShopsErrorImpl;
  Failure get failure;
}

/// @nodoc
mixin _$SelectedItemsState {
  Map<String, ShopService> get services => throw _privateConstructorUsedError;
  Map<String, ShopPackage> get packages => throw _privateConstructorUsedError;
  Map<String, ShopAccessory> get accessories => throw _privateConstructorUsedError;
  ShopVehicleType? get vehicleType => throw _privateConstructorUsedError;
}

class _$SelectedItemsStateImpl implements _SelectedItemsState {
  const _$SelectedItemsStateImpl({
    this.services = const {},
    this.packages = const {},
    this.accessories = const {},
    this.vehicleType,
  });

  @override
  final Map<String, ShopService> services;
  @override
  final Map<String, ShopPackage> packages;
  @override
  final Map<String, ShopAccessory> accessories;
  @override
  final ShopVehicleType? vehicleType;
}

abstract class _SelectedItemsState implements SelectedItemsState {
  const factory _SelectedItemsState({
    final Map<String, ShopService> services,
    final Map<String, ShopPackage> packages,
    final Map<String, ShopAccessory> accessories,
    final ShopVehicleType? vehicleType,
  }) = _$SelectedItemsStateImpl;
}
