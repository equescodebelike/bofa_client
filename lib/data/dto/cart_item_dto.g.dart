// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemDtoImpl _$$CartItemDtoImplFromJson(Map<String, dynamic> json) =>
    _$CartItemDtoImpl(
      productId: (json['productId'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      orderPartId: (json['orderPartId'] as num).toInt(),
      status: json['status'] as String,
      updatedAt: json['updatedAt'] as String,
      orderedAt: json['orderedAt'] as String,
    );

Map<String, dynamic> _$$CartItemDtoImplToJson(_$CartItemDtoImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'size': instance.size,
      'orderPartId': instance.orderPartId,
      'status': instance.status,
      'updatedAt': instance.updatedAt,
      'orderedAt': instance.orderedAt,
    };
