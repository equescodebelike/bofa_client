// Simple DTO without freezed
class TokenResponseDto {
  final String accessToken;
  final String refreshToken;

  TokenResponseDto({
    required this.accessToken,
    required this.refreshToken,
  });

  factory TokenResponseDto.fromJson(Map<String, dynamic> json) {
    return TokenResponseDto(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }
}
