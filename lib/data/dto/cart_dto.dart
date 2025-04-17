import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'cart_item_dto.dart';

part 'cart_dto.freezed.dart';
part 'cart_dto.g.dart';

@freezed
class CartDto with _$CartDto {
  const factory CartDto({
    @JsonKey(name: 'items') required List<CartItemDto> items,
    @JsonKey(name: 'sum') required double sum,
  }) = _CartDto;

  factory CartDto.fromJson(Map<String, dynamic> json) =>
      _$CartDtoFromJson(json);
}
