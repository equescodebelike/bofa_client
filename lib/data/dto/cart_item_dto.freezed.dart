// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CartItemDto _$CartItemDtoFromJson(Map<String, dynamic> json) {
  return _CartItemDto.fromJson(json);
}

/// @nodoc
mixin _$CartItemDto {
  @JsonKey(name: 'productId')
  int get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'size')
  int get size => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderPartId')
  int get orderPartId => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderedAt')
  String get orderedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartItemDtoCopyWith<CartItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemDtoCopyWith<$Res> {
  factory $CartItemDtoCopyWith(
          CartItemDto value, $Res Function(CartItemDto) then) =
      _$CartItemDtoCopyWithImpl<$Res, CartItemDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'productId') int productId,
      @JsonKey(name: 'size') int size,
      @JsonKey(name: 'orderPartId') int orderPartId,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'updatedAt') String updatedAt,
      @JsonKey(name: 'orderedAt') String orderedAt});
}

/// @nodoc
class _$CartItemDtoCopyWithImpl<$Res, $Val extends CartItemDto>
    implements $CartItemDtoCopyWith<$Res> {
  _$CartItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? size = null,
    Object? orderPartId = null,
    Object? status = null,
    Object? updatedAt = null,
    Object? orderedAt = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      orderPartId: null == orderPartId
          ? _value.orderPartId
          : orderPartId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      orderedAt: null == orderedAt
          ? _value.orderedAt
          : orderedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartItemDtoImplCopyWith<$Res>
    implements $CartItemDtoCopyWith<$Res> {
  factory _$$CartItemDtoImplCopyWith(
          _$CartItemDtoImpl value, $Res Function(_$CartItemDtoImpl) then) =
      __$$CartItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'productId') int productId,
      @JsonKey(name: 'size') int size,
      @JsonKey(name: 'orderPartId') int orderPartId,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'updatedAt') String updatedAt,
      @JsonKey(name: 'orderedAt') String orderedAt});
}

/// @nodoc
class __$$CartItemDtoImplCopyWithImpl<$Res>
    extends _$CartItemDtoCopyWithImpl<$Res, _$CartItemDtoImpl>
    implements _$$CartItemDtoImplCopyWith<$Res> {
  __$$CartItemDtoImplCopyWithImpl(
      _$CartItemDtoImpl _value, $Res Function(_$CartItemDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? size = null,
    Object? orderPartId = null,
    Object? status = null,
    Object? updatedAt = null,
    Object? orderedAt = null,
  }) {
    return _then(_$CartItemDtoImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      orderPartId: null == orderPartId
          ? _value.orderPartId
          : orderPartId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      orderedAt: null == orderedAt
          ? _value.orderedAt
          : orderedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartItemDtoImpl implements _CartItemDto {
  const _$CartItemDtoImpl(
      {@JsonKey(name: 'productId') required this.productId,
      @JsonKey(name: 'size') required this.size,
      @JsonKey(name: 'orderPartId') required this.orderPartId,
      @JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'updatedAt') required this.updatedAt,
      @JsonKey(name: 'orderedAt') required this.orderedAt});

  factory _$CartItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemDtoImplFromJson(json);

  @override
  @JsonKey(name: 'productId')
  final int productId;
  @override
  @JsonKey(name: 'size')
  final int size;
  @override
  @JsonKey(name: 'orderPartId')
  final int orderPartId;
  @override
  @JsonKey(name: 'status')
  final String status;
  @override
  @JsonKey(name: 'updatedAt')
  final String updatedAt;
  @override
  @JsonKey(name: 'orderedAt')
  final String orderedAt;

  @override
  String toString() {
    return 'CartItemDto(productId: $productId, size: $size, orderPartId: $orderPartId, status: $status, updatedAt: $updatedAt, orderedAt: $orderedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemDtoImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.orderPartId, orderPartId) ||
                other.orderPartId == orderPartId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.orderedAt, orderedAt) ||
                other.orderedAt == orderedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, productId, size, orderPartId, status, updatedAt, orderedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemDtoImplCopyWith<_$CartItemDtoImpl> get copyWith =>
      __$$CartItemDtoImplCopyWithImpl<_$CartItemDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemDtoImplToJson(
      this,
    );
  }
}

abstract class _CartItemDto implements CartItemDto {
  const factory _CartItemDto(
          {@JsonKey(name: 'productId') required final int productId,
          @JsonKey(name: 'size') required final int size,
          @JsonKey(name: 'orderPartId') required final int orderPartId,
          @JsonKey(name: 'status') required final String status,
          @JsonKey(name: 'updatedAt') required final String updatedAt,
          @JsonKey(name: 'orderedAt') required final String orderedAt}) =
      _$CartItemDtoImpl;

  factory _CartItemDto.fromJson(Map<String, dynamic> json) =
      _$CartItemDtoImpl.fromJson;

  @override
  @JsonKey(name: 'productId')
  int get productId;
  @override
  @JsonKey(name: 'size')
  int get size;
  @override
  @JsonKey(name: 'orderPartId')
  int get orderPartId;
  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(name: 'updatedAt')
  String get updatedAt;
  @override
  @JsonKey(name: 'orderedAt')
  String get orderedAt;
  @override
  @JsonKey(ignore: true)
  _$$CartItemDtoImplCopyWith<_$CartItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
