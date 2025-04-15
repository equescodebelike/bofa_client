// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductListDtoImpl _$$ProductListDtoImplFromJson(Map<String, dynamic> json) =>
    _$ProductListDtoImpl(
      (json['products'] as List<dynamic>)
          .map((e) => ProductDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductListDtoImplToJson(
        _$ProductListDtoImpl instance) =>
    <String, dynamic>{
      'products': instance.products.map((e) => e.toJson()).toList(),
    };
