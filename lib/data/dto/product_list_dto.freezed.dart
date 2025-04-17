// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_list_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductListDto _$ProductListDtoFromJson(Map<String, dynamic> json) {
  return _ProductListDto.fromJson(json);
}

/// @nodoc
mixin _$ProductListDto {
  Map<String, List<ProductDTO>?>? get products =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductListDtoCopyWith<ProductListDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductListDtoCopyWith<$Res> {
  factory $ProductListDtoCopyWith(
          ProductListDto value, $Res Function(ProductListDto) then) =
      _$ProductListDtoCopyWithImpl<$Res, ProductListDto>;
  @useResult
  $Res call({Map<String, List<ProductDTO>?>? products});
}

/// @nodoc
class _$ProductListDtoCopyWithImpl<$Res, $Val extends ProductListDto>
    implements $ProductListDtoCopyWith<$Res> {
  _$ProductListDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = freezed,
  }) {
    return _then(_value.copyWith(
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ProductDTO>?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductListDtoImplCopyWith<$Res>
    implements $ProductListDtoCopyWith<$Res> {
  factory _$$ProductListDtoImplCopyWith(_$ProductListDtoImpl value,
          $Res Function(_$ProductListDtoImpl) then) =
      __$$ProductListDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, List<ProductDTO>?>? products});
}

/// @nodoc
class __$$ProductListDtoImplCopyWithImpl<$Res>
    extends _$ProductListDtoCopyWithImpl<$Res, _$ProductListDtoImpl>
    implements _$$ProductListDtoImplCopyWith<$Res> {
  __$$ProductListDtoImplCopyWithImpl(
      _$ProductListDtoImpl _value, $Res Function(_$ProductListDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = freezed,
  }) {
    return _then(_$ProductListDtoImpl(
      products: freezed == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ProductDTO>?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductListDtoImpl implements _ProductListDto {
  const _$ProductListDtoImpl({final Map<String, List<ProductDTO>?>? products})
      : _products = products;

  factory _$ProductListDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductListDtoImplFromJson(json);

  final Map<String, List<ProductDTO>?>? _products;
  @override
  Map<String, List<ProductDTO>?>? get products {
    final value = _products;
    if (value == null) return null;
    if (_products is EqualUnmodifiableMapView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ProductListDto(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductListDtoImpl &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductListDtoImplCopyWith<_$ProductListDtoImpl> get copyWith =>
      __$$ProductListDtoImplCopyWithImpl<_$ProductListDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductListDtoImplToJson(
      this,
    );
  }
}

abstract class _ProductListDto implements ProductListDto {
  const factory _ProductListDto(
      {final Map<String, List<ProductDTO>?>? products}) = _$ProductListDtoImpl;

  factory _ProductListDto.fromJson(Map<String, dynamic> json) =
      _$ProductListDtoImpl.fromJson;

  @override
  Map<String, List<ProductDTO>?>? get products;
  @override
  @JsonKey(ignore: true)
  _$$ProductListDtoImplCopyWith<_$ProductListDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
