import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

@freezed
class ProductDTO with _$ProductDTO {
  const factory ProductDTO({
    @JsonKey(name: 'product_id') int? productId,
    required String name,
    required String email,
    required String units,
    @JsonKey(name: 'mn_step') required int mnStep,
    required double cost,
    @JsonKey(name: 'user_id') required int? userId,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'category') String? category,
  }) = _ProductDTO;

  factory ProductDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductDTOFromJson(json);
}
