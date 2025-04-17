// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartDtoImpl _$$CartDtoImplFromJson(Map<String, dynamic> json) =>
    _$CartDtoImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => CartItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      sum: (json['sum'] as num).toDouble(),
    );

Map<String, dynamic> _$$CartDtoImplToJson(_$CartDtoImpl instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'sum': instance.sum,
    };
