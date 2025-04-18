// Simple DTO without freezed
class EmailAuthRequestDto {
  final String email;

  EmailAuthRequestDto({
    required this.email,
  });

  factory EmailAuthRequestDto.fromJson(Map<String, dynamic> json) {
    return EmailAuthRequestDto(
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}
