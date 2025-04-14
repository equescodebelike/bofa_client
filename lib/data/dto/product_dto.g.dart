// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductDTOImpl _$$ProductDTOImplFromJson(Map<String, dynamic> json) =>
    _$ProductDTOImpl(
      productId: (json['product_id'] as num?)?.toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      units: (json['units'] as num).toInt(),
      mnStep: (json['mn_step'] as num).toInt(),
      cost: (json['cost'] as num).toDouble(),
      userId: (json['user_id'] as num).toInt(),
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$$ProductDTOImplToJson(_$ProductDTOImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('product_id', instance.productId);
  val['name'] = instance.name;
  val['email'] = instance.email;
  val['units'] = instance.units;
  val['mn_step'] = instance.mnStep;
  val['cost'] = instance.cost;
  val['user_id'] = instance.userId;
  writeNotNull('image_url', instance.imageUrl);
  return val;
}
