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
      status: json['status'] as String? ?? 'pending',
      updatedAt: json['updatedAt'] as String,
      orderedAt: json['orderedAt'] as String,
    );

Map<String, dynamic> _$$CartItemDtoImplToJson(_$CartItemDtoImpl instance) {
  final val = <String, dynamic>{
    'productId': instance.productId,
    'size': instance.size,
    'orderPartId': instance.orderPartId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  val['updatedAt'] = instance.updatedAt;
  val['orderedAt'] = instance.orderedAt;
  return val;
}
