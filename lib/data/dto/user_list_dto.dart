import 'package:bofa_client/data/dto/user_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_list_dto.freezed.dart';
part 'user_list_dto.g.dart';

@freezed
abstract class UserListDto with _$UserListDto {
   factory UserListDto(
    final List<UserDTO> users,
    
   ) = _UserListDto;
   factory UserListDto.fromJson(Map<String, dynamic> json) => _$UserListDtoFromJson(json);
}