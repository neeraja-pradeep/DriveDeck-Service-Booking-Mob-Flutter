// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promo_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PromoCard {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String? get actionUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PromoCardCopyWith<PromoCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromoCardCopyWith<$Res> {
  factory $PromoCardCopyWith(PromoCard value, $Res Function(PromoCard) then) =
      _$PromoCardCopyWithImpl<$Res, PromoCard>;
  @useResult
  $Res call(
      {String id,
      String title,
      String? subtitle,
      String imageUrl,
      String? actionUrl});
}

/// @nodoc
class _$PromoCardCopyWithImpl<$Res, $Val extends PromoCard>
    implements $PromoCardCopyWith<$Res> {
  _$PromoCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subtitle = freezed,
    Object? imageUrl = null,
    Object? actionUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      actionUrl: freezed == actionUrl
          ? _value.actionUrl
          : actionUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PromoCardImplCopyWith<$Res>
    implements $PromoCardCopyWith<$Res> {
  factory _$$PromoCardImplCopyWith(
          _$PromoCardImpl value, $Res Function(_$PromoCardImpl) then) =
      __$$PromoCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String? subtitle,
      String imageUrl,
      String? actionUrl});
}

/// @nodoc
class __$$PromoCardImplCopyWithImpl<$Res>
    extends _$PromoCardCopyWithImpl<$Res, _$PromoCardImpl>
    implements _$$PromoCardImplCopyWith<$Res> {
  __$$PromoCardImplCopyWithImpl(
      _$PromoCardImpl _value, $Res Function(_$PromoCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subtitle = freezed,
    Object? imageUrl = null,
    Object? actionUrl = freezed,
  }) {
    return _then(_$PromoCardImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      actionUrl: freezed == actionUrl
          ? _value.actionUrl
          : actionUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PromoCardImpl extends _PromoCard {
  const _$PromoCardImpl(
      {required this.id,
      required this.title,
      this.subtitle,
      required this.imageUrl,
      this.actionUrl})
      : super._();

  @override
  final String id;
  @override
  final String title;
  @override
  final String? subtitle;
  @override
  final String imageUrl;
  @override
  final String? actionUrl;

  @override
  String toString() {
    return 'PromoCard(id: $id, title: $title, subtitle: $subtitle, imageUrl: $imageUrl, actionUrl: $actionUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromoCardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.actionUrl, actionUrl) ||
                other.actionUrl == actionUrl));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, subtitle, imageUrl, actionUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PromoCardImplCopyWith<_$PromoCardImpl> get copyWith =>
      __$$PromoCardImplCopyWithImpl<_$PromoCardImpl>(this, _$identity);
}

abstract class _PromoCard extends PromoCard {
  const factory _PromoCard(
      {required final String id,
      required final String title,
      final String? subtitle,
      required final String imageUrl,
      final String? actionUrl}) = _$PromoCardImpl;
  const _PromoCard._() : super._();

  @override
  String get id;
  @override
  String get title;
  @override
  String? get subtitle;
  @override
  String get imageUrl;
  @override
  String? get actionUrl;
  @override
  @JsonKey(ignore: true)
  _$$PromoCardImplCopyWith<_$PromoCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
