import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_item_dto.freezed.dart';
part 'cart_item_dto.g.dart';

@freezed
class CartItemDto with _$CartItemDto {
  const factory CartItemDto({
    @JsonKey(name: 'productId') required int productId,
    @JsonKey(name: 'size') required int size,
    @JsonKey(name: 'orderPartId') required int orderPartId,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'updatedAt') required String updatedAt,
    @JsonKey(name: 'orderedAt') required String orderedAt,
  }) = _CartItemDto;

  factory CartItemDto.fromJson(Map<String, dynamic> json) =>
      _$CartItemDtoFromJson(json);
}
