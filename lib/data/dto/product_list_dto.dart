import 'package:bofa_client/data/dto/product_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_list_dto.freezed.dart';
part 'product_list_dto.g.dart';

@freezed
class ProductListDto with _$ProductListDto {
  const factory ProductListDto({
    Map<String, List<ProductDTO>?>? products,
  }) = _ProductListDto;

  factory ProductListDto.fromJson(Map<String, dynamic> json) => _$ProductListDtoFromJson(json);
}
