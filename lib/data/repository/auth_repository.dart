import 'package:bofa_client/data/dto/auth/email_auth_request_dto.dart';
import 'package:bofa_client/data/dto/auth/email_verification_dto.dart';
import 'package:bofa_client/data/dto/auth/token_response_dto.dart';
import 'package:bofa_client/data/dto/user_dto.dart';
import 'package:bofa_client/data/service/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRepository {
  Future<void> requestEmailVerification(String email);
  Future<TokenResponseDto> verifyEmailCode(String email, String code);
  Future<UserDTO> getUserData();
  Future<String> refreshToken();
  Future<void> logout();
  Future<void> deleteAccount();
  bool isAuthenticated();
  String? getAccessToken();
}

class AuthRepositoryImpl implements AuthRepository {
  final ApiClient _apiClient;
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';

  AuthRepositoryImpl(this._apiClient);

  @override
  Future<void> requestEmailVerification(String email) async {
    final request = EmailAuthRequestDto(email: email);
    await _apiClient.requestEmailVerification(request);
  }

  @override
  Future<TokenResponseDto> verifyEmailCode(String email, String code) async {
    final verification = EmailVerificationDto(email: email, code: code);
    final response = await _apiClient.verifyEmailCode(verification);
    
    // Save tokens to shared preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessTokenKey, response.accessToken);
    await prefs.setString(_refreshTokenKey, response.refreshToken);
    
    // Update cache
    _cachedAccessToken = response.accessToken;
    _cachedRefreshToken = response.refreshToken;
    _cachedAuthStatus = true;
    
    return response;
  }

  @override
  Future<UserDTO> getUserData() async {
    final token = getAccessToken();
    if (token == null) {
      throw Exception('Not authenticated');
    }
    
    return await _apiClient.getUserData();
  }

  @override
  Future<String> refreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString(_refreshTokenKey);
    
    if (refreshToken == null) {
      throw Exception('No refresh token available');
    }
    
    final response = await _apiClient.refreshToken({'refresh_token': refreshToken});
    final newAccessToken = response.accessToken;
    final newRefreshToken = response.refreshToken;
    
    // Save both tokens
    await prefs.setString(_accessTokenKey, newAccessToken);
    await prefs.setString(_refreshTokenKey, newRefreshToken);
    
    // Update cache
    _cachedAccessToken = newAccessToken;
    _cachedRefreshToken = newRefreshToken;
    _cachedAuthStatus = true;
    
    return newAccessToken;
  }

  @override
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accessTokenKey);
    await prefs.remove(_refreshTokenKey);
    
    // Update cache
    _cachedAccessToken = null;
    _cachedRefreshToken = null;
    _cachedAuthStatus = false;
  }

  @override
  Future<void> deleteAccount() async {
    final token = getAccessToken();
    if (token == null) {
      throw Exception('Not authenticated');
    }
    
    try {
      // Call API to delete account
      // await _apiClient.deleteAccount('Bearer $token');
      
      // For now, just log out the user
      await logout();
    } catch (e) {
      throw Exception('Failed to delete account: ${e.toString()}');
    }
  }

  // Cache for tokens to avoid frequent SharedPreferences access
  String? _cachedAccessToken;
  String? _cachedRefreshToken;
  bool? _cachedAuthStatus;

  @override
  bool isAuthenticated() {
    if (_cachedAuthStatus != null) {
      return _cachedAuthStatus!;
    }
    
    // We can't access SharedPreferences synchronously, so we'll return the cached value
    // or false if there's no cached value
    return false;
  }

  @override
  String? getAccessToken() {
    return _cachedAccessToken;
  }
  
  // Initialize the cache from SharedPreferences
  Future<void> initTokens() async {
    final prefs = await SharedPreferences.getInstance();
    _cachedAccessToken = prefs.getString(_accessTokenKey);
    _cachedRefreshToken = prefs.getString(_refreshTokenKey);
    _cachedAuthStatus = _cachedAccessToken != null;
    return;
  }
}
