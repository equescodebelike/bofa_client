// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_part_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderPartDTO _$OrderPartDTOFromJson(Map<String, dynamic> json) {
  return _OrderPartDTO.fromJson(json);
}

/// @nodoc
mixin _$OrderPartDTO {
  @JsonKey(name: 'order_part_id')
  int? get orderPartId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  int get productId => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  int get orderId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderPartDTOCopyWith<OrderPartDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderPartDTOCopyWith<$Res> {
  factory $OrderPartDTOCopyWith(
          OrderPartDTO value, $Res Function(OrderPartDTO) then) =
      _$OrderPartDTOCopyWithImpl<$Res, OrderPartDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'order_part_id') int? orderPartId,
      @JsonKey(name: 'product_id') int productId,
      int count,
      @JsonKey(name: 'order_id') int orderId,
      String status});
}

/// @nodoc
class _$OrderPartDTOCopyWithImpl<$Res, $Val extends OrderPartDTO>
    implements $OrderPartDTOCopyWith<$Res> {
  _$OrderPartDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderPartId = freezed,
    Object? productId = null,
    Object? count = null,
    Object? orderId = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      orderPartId: freezed == orderPartId
          ? _value.orderPartId
          : orderPartId // ignore: cast_nullable_to_non_nullable
              as int?,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderPartDTOImplCopyWith<$Res>
    implements $OrderPartDTOCopyWith<$Res> {
  factory _$$OrderPartDTOImplCopyWith(
          _$OrderPartDTOImpl value, $Res Function(_$OrderPartDTOImpl) then) =
      __$$OrderPartDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'order_part_id') int? orderPartId,
      @JsonKey(name: 'product_id') int productId,
      int count,
      @JsonKey(name: 'order_id') int orderId,
      String status});
}

/// @nodoc
class __$$OrderPartDTOImplCopyWithImpl<$Res>
    extends _$OrderPartDTOCopyWithImpl<$Res, _$OrderPartDTOImpl>
    implements _$$OrderPartDTOImplCopyWith<$Res> {
  __$$OrderPartDTOImplCopyWithImpl(
      _$OrderPartDTOImpl _value, $Res Function(_$OrderPartDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderPartId = freezed,
    Object? productId = null,
    Object? count = null,
    Object? orderId = null,
    Object? status = null,
  }) {
    return _then(_$OrderPartDTOImpl(
      orderPartId: freezed == orderPartId
          ? _value.orderPartId
          : orderPartId // ignore: cast_nullable_to_non_nullable
              as int?,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderPartDTOImpl implements _OrderPartDTO {
  const _$OrderPartDTOImpl(
      {@JsonKey(name: 'order_part_id') this.orderPartId,
      @JsonKey(name: 'product_id') required this.productId,
      required this.count,
      @JsonKey(name: 'order_id') required this.orderId,
      required this.status});

  factory _$OrderPartDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderPartDTOImplFromJson(json);

  @override
  @JsonKey(name: 'order_part_id')
  final int? orderPartId;
  @override
  @JsonKey(name: 'product_id')
  final int productId;
  @override
  final int count;
  @override
  @JsonKey(name: 'order_id')
  final int orderId;
  @override
  final String status;

  @override
  String toString() {
    return 'OrderPartDTO(orderPartId: $orderPartId, productId: $productId, count: $count, orderId: $orderId, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderPartDTOImpl &&
            (identical(other.orderPartId, orderPartId) ||
                other.orderPartId == orderPartId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, orderPartId, productId, count, orderId, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderPartDTOImplCopyWith<_$OrderPartDTOImpl> get copyWith =>
      __$$OrderPartDTOImplCopyWithImpl<_$OrderPartDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderPartDTOImplToJson(
      this,
    );
  }
}

abstract class _OrderPartDTO implements OrderPartDTO {
  const factory _OrderPartDTO(
      {@JsonKey(name: 'order_part_id') final int? orderPartId,
      @JsonKey(name: 'product_id') required final int productId,
      required final int count,
      @JsonKey(name: 'order_id') required final int orderId,
      required final String status}) = _$OrderPartDTOImpl;

  factory _OrderPartDTO.fromJson(Map<String, dynamic> json) =
      _$OrderPartDTOImpl.fromJson;

  @override
  @JsonKey(name: 'order_part_id')
  int? get orderPartId;
  @override
  @JsonKey(name: 'product_id')
  int get productId;
  @override
  int get count;
  @override
  @JsonKey(name: 'order_id')
  int get orderId;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$OrderPartDTOImplCopyWith<_$OrderPartDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
