// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_part_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderPartDTOImpl _$$OrderPartDTOImplFromJson(Map<String, dynamic> json) =>
    _$OrderPartDTOImpl(
      orderPartId: (json['order_part_id'] as num?)?.toInt(),
      productId: (json['product_id'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      orderId: (json['order_id'] as num).toInt(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$OrderPartDTOImplToJson(_$OrderPartDTOImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('order_part_id', instance.orderPartId);
  val['product_id'] = instance.productId;
  val['count'] = instance.count;
  val['order_id'] = instance.orderId;
  val['status'] = instance.status;
  return val;
}
