// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserListDtoImpl _$$UserListDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserListDtoImpl(
      (json['users'] as List<dynamic>)
          .map((e) => UserDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserListDtoImplToJson(_$UserListDtoImpl instance) =>
    <String, dynamic>{
      'users': instance.users.map((e) => e.toJson()).toList(),
    };
