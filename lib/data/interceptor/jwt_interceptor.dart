import 'package:bofa_client/data/repository/auth_repository.dart';
import 'package:dio/dio.dart';

/// Interceptor for working with JWT tokens updating and saving them.
/// Requires [Dio] to work.
class JwtInterceptor extends QueuedInterceptor {
  /// Create instance of [JwtInterceptor].
  JwtInterceptor({
    required this.repository,
    required Dio dio,
  }) : _dio = dio;

  final AuthRepository repository;

  /// Http client.
  final Dio _dio;

  /// Add JWT authorization token to any request if available.
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = repository.getAccessToken();
    if (token != null &&
        !options.path.contains('/auth/email/part1') &&
        !options.path.contains('/auth/email/part2') &&
        !options.path.contains('/auth/refresh')) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return super.onRequest(options, handler);
  }

  /// Update JWT token if it is outdated.
  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    print('JwtInterceptor.onError:');
    
    if ((err.response?.statusCode == 403 || err.response?.statusCode == 401) &&
        !err.requestOptions.path.contains('/auth/email/part1') &&
        !err.requestOptions.path.contains('/auth/email/part2') &&
        !err.requestOptions.path.contains('/auth/refresh')) {
      
      print('JwtInterceptor: Attempting to refresh token');
      await _refresh();
      
      if (repository.isAuthenticated()) {
        print('JwtInterceptor: Token refreshed successfully, retrying request');
        try {
          final response = await _retry(err.requestOptions);
          handler.resolve(response);
          return;
        } catch (e) {
          print('JwtInterceptor: Error retrying request: $e');
          // Continue with the error handling
        }
      } else {
        print('JwtInterceptor: Token refresh failed, not authenticated');
      }
    }
    return super.onError(err, handler);
  }

  /// Make a request to update the JWT token and save it to cache.
  Future<void> _refresh() async {
    try {
      await repository.refreshToken();
    } catch (e) {
      await repository.logout();
    }
  }

  /// Repeat the failed request.
  Future<Response<dynamic>> _retry(RequestOptions requestOptions) {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
