// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderDTO _$OrderDTOFromJson(Map<String, dynamic> json) {
  return _OrderDTO.fromJson(json);
}

/// @nodoc
mixin _$OrderDTO {
  @JsonKey(name: 'order_id')
  int? get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_date')
  String get orderDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  int get customerId => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderDTOCopyWith<OrderDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDTOCopyWith<$Res> {
  factory $OrderDTOCopyWith(OrderDTO value, $Res Function(OrderDTO) then) =
      _$OrderDTOCopyWithImpl<$Res, OrderDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'order_id') int? orderId,
      @JsonKey(name: 'order_date') String orderDate,
      @JsonKey(name: 'customer_id') int customerId,
      String address});
}

/// @nodoc
class _$OrderDTOCopyWithImpl<$Res, $Val extends OrderDTO>
    implements $OrderDTOCopyWith<$Res> {
  _$OrderDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = freezed,
    Object? orderDate = null,
    Object? customerId = null,
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderDTOImplCopyWith<$Res>
    implements $OrderDTOCopyWith<$Res> {
  factory _$$OrderDTOImplCopyWith(
          _$OrderDTOImpl value, $Res Function(_$OrderDTOImpl) then) =
      __$$OrderDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'order_id') int? orderId,
      @JsonKey(name: 'order_date') String orderDate,
      @JsonKey(name: 'customer_id') int customerId,
      String address});
}

/// @nodoc
class __$$OrderDTOImplCopyWithImpl<$Res>
    extends _$OrderDTOCopyWithImpl<$Res, _$OrderDTOImpl>
    implements _$$OrderDTOImplCopyWith<$Res> {
  __$$OrderDTOImplCopyWithImpl(
      _$OrderDTOImpl _value, $Res Function(_$OrderDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = freezed,
    Object? orderDate = null,
    Object? customerId = null,
    Object? address = null,
  }) {
    return _then(_$OrderDTOImpl(
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderDTOImpl implements _OrderDTO {
  const _$OrderDTOImpl(
      {@JsonKey(name: 'order_id') this.orderId,
      @JsonKey(name: 'order_date') required this.orderDate,
      @JsonKey(name: 'customer_id') required this.customerId,
      required this.address});

  factory _$OrderDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderDTOImplFromJson(json);

  @override
  @JsonKey(name: 'order_id')
  final int? orderId;
  @override
  @JsonKey(name: 'order_date')
  final String orderDate;
  @override
  @JsonKey(name: 'customer_id')
  final int customerId;
  @override
  final String address;

  @override
  String toString() {
    return 'OrderDTO(orderId: $orderId, orderDate: $orderDate, customerId: $customerId, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDTOImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, orderId, orderDate, customerId, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDTOImplCopyWith<_$OrderDTOImpl> get copyWith =>
      __$$OrderDTOImplCopyWithImpl<_$OrderDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderDTOImplToJson(
      this,
    );
  }
}

abstract class _OrderDTO implements OrderDTO {
  const factory _OrderDTO(
      {@JsonKey(name: 'order_id') final int? orderId,
      @JsonKey(name: 'order_date') required final String orderDate,
      @JsonKey(name: 'customer_id') required final int customerId,
      required final String address}) = _$OrderDTOImpl;

  factory _OrderDTO.fromJson(Map<String, dynamic> json) =
      _$OrderDTOImpl.fromJson;

  @override
  @JsonKey(name: 'order_id')
  int? get orderId;
  @override
  @JsonKey(name: 'order_date')
  String get orderDate;
  @override
  @JsonKey(name: 'customer_id')
  int get customerId;
  @override
  String get address;
  @override
  @JsonKey(ignore: true)
  _$$OrderDTOImplCopyWith<_$OrderDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
