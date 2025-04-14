// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDTOImpl _$$UserDTOImplFromJson(Map<String, dynamic> json) =>
    _$UserDTOImpl(
      userId: (json['user_id'] as num?)?.toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      isActive: json['is_active'] as bool,
      password: json['password'] as String,
      phoneNumber: json['phone_number'] as String,
      imageUrl: json['image_url'] as String?,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$UserDTOImplToJson(_$UserDTOImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user_id', instance.userId);
  val['name'] = instance.name;
  val['email'] = instance.email;
  val['is_active'] = instance.isActive;
  val['password'] = instance.password;
  val['phone_number'] = instance.phoneNumber;
  writeNotNull('image_url', instance.imageUrl);
  val['categories'] = instance.categories;
  return val;
}
