import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_dto.freezed.dart';
part 'order_dto.g.dart';

@freezed
class OrderDTO with _$OrderDTO {
  const factory OrderDTO({
    @JsonKey(name: 'order_id') int? orderId,
    @JsonKey(name: 'order_date') required String orderDate,
    @JsonKey(name: 'customer_id') required int customerId,
    required String address,
  }) = _OrderDTO;

  factory OrderDTO.fromJson(Map<String, dynamic> json) =>
      _$OrderDTOFromJson(json);
}
