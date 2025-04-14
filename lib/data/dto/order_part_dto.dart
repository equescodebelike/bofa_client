import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_part_dto.freezed.dart';
part 'order_part_dto.g.dart';

@freezed
class OrderPartDTO with _$OrderPartDTO {
  const factory OrderPartDTO({
    @JsonKey(name: 'order_part_id') int? orderPartId,
    @JsonKey(name: 'product_id') required int productId,
    required int count,
    @JsonKey(name: 'order_id') required int orderId,
    required String status,
  }) = _OrderPartDTO;

  factory OrderPartDTO.fromJson(Map<String, dynamic> json) =>
      _$OrderPartDTOFromJson(json);
}
