// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_list_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserListDto _$UserListDtoFromJson(Map<String, dynamic> json) {
  return _UserListDto.fromJson(json);
}

/// @nodoc
mixin _$UserListDto {
  List<UserDTO> get users => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserListDtoCopyWith<UserListDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserListDtoCopyWith<$Res> {
  factory $UserListDtoCopyWith(
          UserListDto value, $Res Function(UserListDto) then) =
      _$UserListDtoCopyWithImpl<$Res, UserListDto>;
  @useResult
  $Res call({List<UserDTO> users});
}

/// @nodoc
class _$UserListDtoCopyWithImpl<$Res, $Val extends UserListDto>
    implements $UserListDtoCopyWith<$Res> {
  _$UserListDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
  }) {
    return _then(_value.copyWith(
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserListDtoImplCopyWith<$Res>
    implements $UserListDtoCopyWith<$Res> {
  factory _$$UserListDtoImplCopyWith(
          _$UserListDtoImpl value, $Res Function(_$UserListDtoImpl) then) =
      __$$UserListDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserDTO> users});
}

/// @nodoc
class __$$UserListDtoImplCopyWithImpl<$Res>
    extends _$UserListDtoCopyWithImpl<$Res, _$UserListDtoImpl>
    implements _$$UserListDtoImplCopyWith<$Res> {
  __$$UserListDtoImplCopyWithImpl(
      _$UserListDtoImpl _value, $Res Function(_$UserListDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
  }) {
    return _then(_$UserListDtoImpl(
      null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserListDtoImpl implements _UserListDto {
  _$UserListDtoImpl(final List<UserDTO> users) : _users = users;

  factory _$UserListDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserListDtoImplFromJson(json);

  final List<UserDTO> _users;
  @override
  List<UserDTO> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString() {
    return 'UserListDto(users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserListDtoImpl &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserListDtoImplCopyWith<_$UserListDtoImpl> get copyWith =>
      __$$UserListDtoImplCopyWithImpl<_$UserListDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserListDtoImplToJson(
      this,
    );
  }
}

abstract class _UserListDto implements UserListDto {
  factory _UserListDto(final List<UserDTO> users) = _$UserListDtoImpl;

  factory _UserListDto.fromJson(Map<String, dynamic> json) =
      _$UserListDtoImpl.fromJson;

  @override
  List<UserDTO> get users;
  @override
  @JsonKey(ignore: true)
  _$$UserListDtoImplCopyWith<_$UserListDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
