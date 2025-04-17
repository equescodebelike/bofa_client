// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CartDto _$CartDtoFromJson(Map<String, dynamic> json) {
  return _CartDto.fromJson(json);
}

/// @nodoc
mixin _$CartDto {
  @JsonKey(name: 'items')
  List<CartItemDto> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'sum')
  double get sum => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartDtoCopyWith<CartDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartDtoCopyWith<$Res> {
  factory $CartDtoCopyWith(CartDto value, $Res Function(CartDto) then) =
      _$CartDtoCopyWithImpl<$Res, CartDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'items') List<CartItemDto> items,
      @JsonKey(name: 'sum') double sum});
}

/// @nodoc
class _$CartDtoCopyWithImpl<$Res, $Val extends CartDto>
    implements $CartDtoCopyWith<$Res> {
  _$CartDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? sum = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItemDto>,
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartDtoImplCopyWith<$Res> implements $CartDtoCopyWith<$Res> {
  factory _$$CartDtoImplCopyWith(
          _$CartDtoImpl value, $Res Function(_$CartDtoImpl) then) =
      __$$CartDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'items') List<CartItemDto> items,
      @JsonKey(name: 'sum') double sum});
}

/// @nodoc
class __$$CartDtoImplCopyWithImpl<$Res>
    extends _$CartDtoCopyWithImpl<$Res, _$CartDtoImpl>
    implements _$$CartDtoImplCopyWith<$Res> {
  __$$CartDtoImplCopyWithImpl(
      _$CartDtoImpl _value, $Res Function(_$CartDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? sum = null,
  }) {
    return _then(_$CartDtoImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItemDto>,
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartDtoImpl implements _CartDto {
  const _$CartDtoImpl(
      {@JsonKey(name: 'items') required final List<CartItemDto> items,
      @JsonKey(name: 'sum') required this.sum})
      : _items = items;

  factory _$CartDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartDtoImplFromJson(json);

  final List<CartItemDto> _items;
  @override
  @JsonKey(name: 'items')
  List<CartItemDto> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(name: 'sum')
  final double sum;

  @override
  String toString() {
    return 'CartDto(items: $items, sum: $sum)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartDtoImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.sum, sum) || other.sum == sum));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), sum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartDtoImplCopyWith<_$CartDtoImpl> get copyWith =>
      __$$CartDtoImplCopyWithImpl<_$CartDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartDtoImplToJson(
      this,
    );
  }
}

abstract class _CartDto implements CartDto {
  const factory _CartDto(
      {@JsonKey(name: 'items') required final List<CartItemDto> items,
      @JsonKey(name: 'sum') required final double sum}) = _$CartDtoImpl;

  factory _CartDto.fromJson(Map<String, dynamic> json) = _$CartDtoImpl.fromJson;

  @override
  @JsonKey(name: 'items')
  List<CartItemDto> get items;
  @override
  @JsonKey(name: 'sum')
  double get sum;
  @override
  @JsonKey(ignore: true)
  _$$CartDtoImplCopyWith<_$CartDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
