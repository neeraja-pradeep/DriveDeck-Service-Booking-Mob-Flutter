// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
// User profile
  AsyncValue<UserProfile?> get profileState =>
      throw _privateConstructorUsedError; // User location
  AsyncValue<UserLocation?> get locationState =>
      throw _privateConstructorUsedError;
  bool get isLocationPermissionRequested =>
      throw _privateConstructorUsedError; // Service categories
  AsyncValue<List<ServiceCategory>> get categoriesState =>
      throw _privateConstructorUsedError; // Car wash shops near you
  AsyncValue<List<CarWashShop>> get shopsNearYouState =>
      throw _privateConstructorUsedError; // Search
  String get searchQuery => throw _privateConstructorUsedError;
  AsyncValue<List<CarWashShop>> get searchResultsState =>
      throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError; // General
  bool get isRefreshing => throw _privateConstructorUsedError;
  Failure? get lastError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {AsyncValue<UserProfile?> profileState,
      AsyncValue<UserLocation?> locationState,
      bool isLocationPermissionRequested,
      AsyncValue<List<ServiceCategory>> categoriesState,
      AsyncValue<List<CarWashShop>> shopsNearYouState,
      String searchQuery,
      AsyncValue<List<CarWashShop>> searchResultsState,
      bool isSearching,
      bool isRefreshing,
      Failure? lastError});

  $FailureCopyWith<$Res>? get lastError;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileState = null,
    Object? locationState = null,
    Object? isLocationPermissionRequested = null,
    Object? categoriesState = null,
    Object? shopsNearYouState = null,
    Object? searchQuery = null,
    Object? searchResultsState = null,
    Object? isSearching = null,
    Object? isRefreshing = null,
    Object? lastError = freezed,
  }) {
    return _then(_value.copyWith(
      profileState: null == profileState
          ? _value.profileState
          : profileState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<UserProfile?>,
      locationState: null == locationState
          ? _value.locationState
          : locationState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<UserLocation?>,
      isLocationPermissionRequested: null == isLocationPermissionRequested
          ? _value.isLocationPermissionRequested
          : isLocationPermissionRequested // ignore: cast_nullable_to_non_nullable
              as bool,
      categoriesState: null == categoriesState
          ? _value.categoriesState
          : categoriesState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ServiceCategory>>,
      shopsNearYouState: null == shopsNearYouState
          ? _value.shopsNearYouState
          : shopsNearYouState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<CarWashShop>>,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      searchResultsState: null == searchResultsState
          ? _value.searchResultsState
          : searchResultsState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<CarWashShop>>,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isRefreshing: null == isRefreshing
          ? _value.isRefreshing
          : isRefreshing // ignore: cast_nullable_to_non_nullable
              as bool,
      lastError: freezed == lastError
          ? _value.lastError
          : lastError // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res>? get lastError {
    if (_value.lastError == null) {
      return null;
    }

    return $FailureCopyWith<$Res>(_value.lastError!, (value) {
      return _then(_value.copyWith(lastError: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<UserProfile?> profileState,
      AsyncValue<UserLocation?> locationState,
      bool isLocationPermissionRequested,
      AsyncValue<List<ServiceCategory>> categoriesState,
      AsyncValue<List<CarWashShop>> shopsNearYouState,
      String searchQuery,
      AsyncValue<List<CarWashShop>> searchResultsState,
      bool isSearching,
      bool isRefreshing,
      Failure? lastError});

  @override
  $FailureCopyWith<$Res>? get lastError;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileState = null,
    Object? locationState = null,
    Object? isLocationPermissionRequested = null,
    Object? categoriesState = null,
    Object? shopsNearYouState = null,
    Object? searchQuery = null,
    Object? searchResultsState = null,
    Object? isSearching = null,
    Object? isRefreshing = null,
    Object? lastError = freezed,
  }) {
    return _then(_$HomeStateImpl(
      profileState: null == profileState
          ? _value.profileState
          : profileState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<UserProfile?>,
      locationState: null == locationState
          ? _value.locationState
          : locationState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<UserLocation?>,
      isLocationPermissionRequested: null == isLocationPermissionRequested
          ? _value.isLocationPermissionRequested
          : isLocationPermissionRequested // ignore: cast_nullable_to_non_nullable
              as bool,
      categoriesState: null == categoriesState
          ? _value.categoriesState
          : categoriesState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ServiceCategory>>,
      shopsNearYouState: null == shopsNearYouState
          ? _value.shopsNearYouState
          : shopsNearYouState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<CarWashShop>>,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      searchResultsState: null == searchResultsState
          ? _value.searchResultsState
          : searchResultsState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<CarWashShop>>,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isRefreshing: null == isRefreshing
          ? _value.isRefreshing
          : isRefreshing // ignore: cast_nullable_to_non_nullable
              as bool,
      lastError: freezed == lastError
          ? _value.lastError
          : lastError // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl extends _HomeState {
  _$HomeStateImpl(
      {required this.profileState,
      required this.locationState,
      this.isLocationPermissionRequested = false,
      required this.categoriesState,
      required this.shopsNearYouState,
      this.searchQuery = '',
      required this.searchResultsState,
      this.isSearching = false,
      this.isRefreshing = false,
      this.lastError})
      : super._();

// User profile
  @override
  final AsyncValue<UserProfile?> profileState;
// User location
  @override
  final AsyncValue<UserLocation?> locationState;
  @override
  @JsonKey()
  final bool isLocationPermissionRequested;
// Service categories
  @override
  final AsyncValue<List<ServiceCategory>> categoriesState;
// Car wash shops near you
  @override
  final AsyncValue<List<CarWashShop>> shopsNearYouState;
// Search
  @override
  @JsonKey()
  final String searchQuery;
  @override
  final AsyncValue<List<CarWashShop>> searchResultsState;
  @override
  @JsonKey()
  final bool isSearching;
// General
  @override
  @JsonKey()
  final bool isRefreshing;
  @override
  final Failure? lastError;

  @override
  String toString() {
    return 'HomeState(profileState: $profileState, locationState: $locationState, isLocationPermissionRequested: $isLocationPermissionRequested, categoriesState: $categoriesState, shopsNearYouState: $shopsNearYouState, searchQuery: $searchQuery, searchResultsState: $searchResultsState, isSearching: $isSearching, isRefreshing: $isRefreshing, lastError: $lastError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.profileState, profileState) ||
                other.profileState == profileState) &&
            (identical(other.locationState, locationState) ||
                other.locationState == locationState) &&
            (identical(other.isLocationPermissionRequested,
                    isLocationPermissionRequested) ||
                other.isLocationPermissionRequested ==
                    isLocationPermissionRequested) &&
            (identical(other.categoriesState, categoriesState) ||
                other.categoriesState == categoriesState) &&
            (identical(other.shopsNearYouState, shopsNearYouState) ||
                other.shopsNearYouState == shopsNearYouState) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.searchResultsState, searchResultsState) ||
                other.searchResultsState == searchResultsState) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.isRefreshing, isRefreshing) ||
                other.isRefreshing == isRefreshing) &&
            (identical(other.lastError, lastError) ||
                other.lastError == lastError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      profileState,
      locationState,
      isLocationPermissionRequested,
      categoriesState,
      shopsNearYouState,
      searchQuery,
      searchResultsState,
      isSearching,
      isRefreshing,
      lastError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState extends HomeState {
  factory _HomeState(
      {required final AsyncValue<UserProfile?> profileState,
      required final AsyncValue<UserLocation?> locationState,
      final bool isLocationPermissionRequested,
      required final AsyncValue<List<ServiceCategory>> categoriesState,
      required final AsyncValue<List<CarWashShop>> shopsNearYouState,
      final String searchQuery,
      required final AsyncValue<List<CarWashShop>> searchResultsState,
      final bool isSearching,
      final bool isRefreshing,
      final Failure? lastError}) = _$HomeStateImpl;
  _HomeState._() : super._();

  @override // User profile
  AsyncValue<UserProfile?> get profileState;
  @override // User location
  AsyncValue<UserLocation?> get locationState;
  @override
  bool get isLocationPermissionRequested;
  @override // Service categories
  AsyncValue<List<ServiceCategory>> get categoriesState;
  @override // Car wash shops near you
  AsyncValue<List<CarWashShop>> get shopsNearYouState;
  @override // Search
  String get searchQuery;
  @override
  AsyncValue<List<CarWashShop>> get searchResultsState;
  @override
  bool get isSearching;
  @override // General
  bool get isRefreshing;
  @override
  Failure? get lastError;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
