// Simple DTO without freezed
class EmailVerificationDto {
  final String email;
  final String code;

  EmailVerificationDto({
    required this.email,
    required this.code,
  });

  factory EmailVerificationDto.fromJson(Map<String, dynamic> json) {
    return EmailVerificationDto(
      email: json['email'] as String,
      code: json['code'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'code': code,
    };
  }
}
