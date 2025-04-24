import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDTO with _$UserDTO {
  const factory UserDTO({
    @JsonKey(name: 'user_id') int? userId,
    required String name,
    required String email,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'image_url') String? imageUrl,
    required List<String>? categories,
  }) = _UserDTO;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);
}
