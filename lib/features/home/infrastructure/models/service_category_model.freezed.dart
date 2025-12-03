// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServiceCategoryModel _$ServiceCategoryModelFromJson(Map<String, dynamic> json) {
  return _ServiceCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$ServiceCategoryModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get icon => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get image => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceCategoryModelCopyWith<ServiceCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceCategoryModelCopyWith<$Res> {
  factory $ServiceCategoryModelCopyWith(ServiceCategoryModel value,
          $Res Function(ServiceCategoryModel) then) =
      _$ServiceCategoryModelCopyWithImpl<$Res, ServiceCategoryModel>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(2) String? icon,
      @HiveField(3) String? image,
      @HiveField(4) String? description,
      @HiveField(5) @JsonKey(name: 'is_active') bool isActive});
}

/// @nodoc
class _$ServiceCategoryModelCopyWithImpl<$Res,
        $Val extends ServiceCategoryModel>
    implements $ServiceCategoryModelCopyWith<$Res> {
  _$ServiceCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceCategoryModelImplCopyWith<$Res>
    implements $ServiceCategoryModelCopyWith<$Res> {
  factory _$$ServiceCategoryModelImplCopyWith(_$ServiceCategoryModelImpl value,
          $Res Function(_$ServiceCategoryModelImpl) then) =
      __$$ServiceCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(2) String? icon,
      @HiveField(3) String? image,
      @HiveField(4) String? description,
      @HiveField(5) @JsonKey(name: 'is_active') bool isActive});
}

/// @nodoc
class __$$ServiceCategoryModelImplCopyWithImpl<$Res>
    extends _$ServiceCategoryModelCopyWithImpl<$Res, _$ServiceCategoryModelImpl>
    implements _$$ServiceCategoryModelImplCopyWith<$Res> {
  __$$ServiceCategoryModelImplCopyWithImpl(_$ServiceCategoryModelImpl _value,
      $Res Function(_$ServiceCategoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? isActive = null,
  }) {
    return _then(_$ServiceCategoryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceCategoryModelImpl extends _ServiceCategoryModel {
  const _$ServiceCategoryModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) this.icon,
      @HiveField(3) this.image,
      @HiveField(4) this.description,
      @HiveField(5) @JsonKey(name: 'is_active') this.isActive = true})
      : super._();

  factory _$ServiceCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceCategoryModelImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String? icon;
  @override
  @HiveField(3)
  final String? image;
  @override
  @HiveField(4)
  final String? description;
  @override
  @HiveField(5)
  @JsonKey(name: 'is_active')
  final bool isActive;

  @override
  String toString() {
    return 'ServiceCategoryModel(id: $id, name: $name, icon: $icon, image: $image, description: $description, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceCategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, icon, image, description, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceCategoryModelImplCopyWith<_$ServiceCategoryModelImpl>
      get copyWith =>
          __$$ServiceCategoryModelImplCopyWithImpl<_$ServiceCategoryModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceCategoryModelImplToJson(
      this,
    );
  }
}

abstract class _ServiceCategoryModel extends ServiceCategoryModel {
  const factory _ServiceCategoryModel(
          {@HiveField(0) required final int id,
          @HiveField(1) required final String name,
          @HiveField(2) final String? icon,
          @HiveField(3) final String? image,
          @HiveField(4) final String? description,
          @HiveField(5) @JsonKey(name: 'is_active') final bool isActive}) =
      _$ServiceCategoryModelImpl;
  const _ServiceCategoryModel._() : super._();

  factory _ServiceCategoryModel.fromJson(Map<String, dynamic> json) =
      _$ServiceCategoryModelImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String? get icon;
  @override
  @HiveField(3)
  String? get image;
  @override
  @HiveField(4)
  String? get description;
  @override
  @HiveField(5)
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$ServiceCategoryModelImplCopyWith<_$ServiceCategoryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ServiceCategoriesResponse _$ServiceCategoriesResponseFromJson(
    Map<String, dynamic> json) {
  return _ServiceCategoriesResponse.fromJson(json);
}

/// @nodoc
mixin _$ServiceCategoriesResponse {
  List<ServiceCategoryModel> get results => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceCategoriesResponseCopyWith<ServiceCategoriesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceCategoriesResponseCopyWith<$Res> {
  factory $ServiceCategoriesResponseCopyWith(ServiceCategoriesResponse value,
          $Res Function(ServiceCategoriesResponse) then) =
      _$ServiceCategoriesResponseCopyWithImpl<$Res, ServiceCategoriesResponse>;
  @useResult
  $Res call(
      {List<ServiceCategoryModel> results,
      int? count,
      String? next,
      String? previous});
}

/// @nodoc
class _$ServiceCategoriesResponseCopyWithImpl<$Res,
        $Val extends ServiceCategoriesResponse>
    implements $ServiceCategoriesResponseCopyWith<$Res> {
  _$ServiceCategoriesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ServiceCategoryModel>,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceCategoriesResponseImplCopyWith<$Res>
    implements $ServiceCategoriesResponseCopyWith<$Res> {
  factory _$$ServiceCategoriesResponseImplCopyWith(
          _$ServiceCategoriesResponseImpl value,
          $Res Function(_$ServiceCategoriesResponseImpl) then) =
      __$$ServiceCategoriesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ServiceCategoryModel> results,
      int? count,
      String? next,
      String? previous});
}

/// @nodoc
class __$$ServiceCategoriesResponseImplCopyWithImpl<$Res>
    extends _$ServiceCategoriesResponseCopyWithImpl<$Res,
        _$ServiceCategoriesResponseImpl>
    implements _$$ServiceCategoriesResponseImplCopyWith<$Res> {
  __$$ServiceCategoriesResponseImplCopyWithImpl(
      _$ServiceCategoriesResponseImpl _value,
      $Res Function(_$ServiceCategoriesResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
  }) {
    return _then(_$ServiceCategoriesResponseImpl(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ServiceCategoryModel>,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceCategoriesResponseImpl implements _ServiceCategoriesResponse {
  const _$ServiceCategoriesResponseImpl(
      {required final List<ServiceCategoryModel> results,
      this.count,
      this.next,
      this.previous})
      : _results = results;

  factory _$ServiceCategoriesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceCategoriesResponseImplFromJson(json);

  final List<ServiceCategoryModel> _results;
  @override
  List<ServiceCategoryModel> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  final int? count;
  @override
  final String? next;
  @override
  final String? previous;

  @override
  String toString() {
    return 'ServiceCategoriesResponse(results: $results, count: $count, next: $next, previous: $previous)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceCategoriesResponseImpl &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_results), count, next, previous);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceCategoriesResponseImplCopyWith<_$ServiceCategoriesResponseImpl>
      get copyWith => __$$ServiceCategoriesResponseImplCopyWithImpl<
          _$ServiceCategoriesResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceCategoriesResponseImplToJson(
      this,
    );
  }
}

abstract class _ServiceCategoriesResponse implements ServiceCategoriesResponse {
  const factory _ServiceCategoriesResponse(
      {required final List<ServiceCategoryModel> results,
      final int? count,
      final String? next,
      final String? previous}) = _$ServiceCategoriesResponseImpl;

  factory _ServiceCategoriesResponse.fromJson(Map<String, dynamic> json) =
      _$ServiceCategoriesResponseImpl.fromJson;

  @override
  List<ServiceCategoryModel> get results;
  @override
  int? get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  @JsonKey(ignore: true)
  _$$ServiceCategoriesResponseImplCopyWith<_$ServiceCategoriesResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
