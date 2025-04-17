// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductListDtoImpl _$$ProductListDtoImplFromJson(Map<String, dynamic> json) =>
    _$ProductListDtoImpl(
      products: (json['products'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>?)
                ?.map((e) => ProductDTO.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$$ProductListDtoImplToJson(
    _$ProductListDtoImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'products',
      instance.products
          ?.map((k, e) => MapEntry(k, e?.map((e) => e.toJson()).toList())));
  return val;
}
