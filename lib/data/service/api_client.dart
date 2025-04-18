import 'package:bofa_client/data/dto/product_list_dto.dart';
import 'package:bofa_client/data/dto/user_list_dto.dart';
import 'package:bofa_client/data/interceptor/jwt_interceptor.dart';
import 'package:bofa_client/data/repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart' hide Headers;
import '../dto/product_dto.dart';
import '../dto/user_dto.dart';
import '../dto/order_dto.dart';
import '../dto/order_part_dto.dart';
import '../dto/cart_dto.dart';
import '../dto/auth/email_auth_request_dto.dart';
import '../dto/auth/email_verification_dto.dart';
import '../dto/auth/token_response_dto.dart';

part 'api_client.g.dart';

// Create a configured ApiClient instance
ApiClient createApiClient(Dio dio, AuthRepository authRepository) {
  const timeout = Duration(seconds: 30);
  dio.options
    ..baseUrl = 'http://localhost:8084'
    ..contentType = Headers.jsonContentType
    ..connectTimeout = timeout
    ..receiveTimeout = timeout
    ..sendTimeout = timeout;

  // Add JWT interceptor if authRepository is provided
  dio.interceptors.add(JwtInterceptor(repository: authRepository, dio: dio));

  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ),
  );
  return ApiClient(dio);
}

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // Product endpoints
  @GET("/products/")
  Future<ProductListDto> getProducts();

  @GET("/products/{productId}")
  Future<ProductDTO> getProduct(@Path("productId") int productId);

  @POST("/products/")
  Future<void> createProduct(@Body() ProductDTO product);

  @PUT("/products/{productId}")
  Future<void> updateProduct(@Path("productId") int productId, @Body() ProductDTO product);

  @DELETE("/products/{productId}")
  Future<void> deleteProduct(@Path("productId") int productId);

  @GET("/products/user/{userId}")
  Future<ProductListDto> getProductByUserId(@Path('userId') int userId);

  // User endpoints
  @GET("/users/")
  Future<UserListDto> getUsers();

  @GET("/users/{userId}")
  Future<UserDTO> getUser(@Path("userId") int userId);

  @POST("/users/")
  Future<void> createUser(@Body() UserDTO user);

  @PUT("/users/{userId}")
  Future<void> updateUser(@Path("userId") int userId, @Body() UserDTO user);

  @DELETE("/users/{userId}")
  Future<void> deleteUser(@Path("userId") int userId);

  // Order endpoints
  @GET("/orders/")
  Future<List<OrderDTO>> getOrders();

  @GET("/orders/{orderId}")
  Future<OrderDTO> getOrder(@Path("orderId") int orderId);

  @POST("/orders/")
  Future<void> createOrder(@Body() OrderDTO order);

  @PUT("/orders/{orderId}")
  Future<void> updateOrder(@Path("orderId") int orderId, @Body() OrderDTO order);

  @DELETE("/orders/{orderId}")
  Future<void> deleteOrder(@Path("orderId") int orderId);

  // OrderPart endpoints
  @GET("/orderparts/")
  Future<List<OrderPartDTO>> getOrderParts();

  @GET("/orderparts/{orderPartId}")
  Future<OrderPartDTO> getOrderPart(@Path("orderPartId") int orderPartId);

  @POST("/orderparts/")
  Future<void> createOrderPart(@Body() OrderPartDTO orderPart);

  @PUT("/orderparts/{orderPartId}")
  Future<void> updateOrderPart(@Path("orderPartId") int orderPartId, @Body() OrderPartDTO orderPart);

  @DELETE("/orderparts/{orderPartId}")
  Future<void> deleteOrderPart(@Path("orderPartId") int orderPartId);

  // Cart endpoints
  @GET("/cart/")
  Future<CartDto> getCart();

  @POST("/cart/")
  Future<void> addToCart(@Body() Map<String, dynamic> data);

  @DELETE("/cart/item/{productId}/")
  Future<void> removeFromCart(@Path("productId") int productId);

  @PUT("/cart/item/{productId}/{size}/")
  Future<void> updateCartItemSize(@Path("productId") int productId, @Path("size") int size);

  // Auth endpoints
  @POST("/auth/email/part1/")
  Future<void> requestEmailVerification(@Body() EmailAuthRequestDto request);

  @POST("/auth/email/part2/")
  Future<TokenResponseDto> verifyEmailCode(@Body() EmailVerificationDto verification);

  @GET("/auth/user/")
  Future<UserDTO> getUserData();

  @POST("/auth/refresh/")
  Future<TokenResponseDto> refreshToken(@Body() Map<String, String> refreshToken);
}
