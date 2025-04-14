// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderDTOImpl _$$OrderDTOImplFromJson(Map<String, dynamic> json) =>
    _$OrderDTOImpl(
      orderId: (json['order_id'] as num?)?.toInt(),
      orderDate: json['order_date'] as String,
      customerId: (json['customer_id'] as num).toInt(),
      address: json['address'] as String,
    );

Map<String, dynamic> _$$OrderDTOImplToJson(_$OrderDTOImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('order_id', instance.orderId);
  val['order_date'] = instance.orderDate;
  val['customer_id'] = instance.customerId;
  val['address'] = instance.address;
  return val;
}
