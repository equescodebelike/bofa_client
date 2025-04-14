import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import '../dto/product_dto.dart';
import '../dto/user_dto.dart';
import '../dto/order_dto.dart';
import '../dto/order_part_dto.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "http://localhost:8080")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  static ApiClient create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
    return ApiClient(dio);
  }

  // Product endpoints
  @GET("/products/")
  Future<List<ProductDTO>> getProducts();

  @GET("/products/{productId}")
  Future<ProductDTO> getProduct(@Path("productId") int productId);

  @POST("/products/")
  Future<void> createProduct(@Body() ProductDTO product);

  @PUT("/products/{productId}")
  Future<void> updateProduct(
      @Path("productId") int productId, @Body() ProductDTO product);

  @DELETE("/products/{productId}")
  Future<void> deleteProduct(@Path("productId") int productId);

  // User endpoints
  @GET("/users/")
  Future<List<UserDTO>> getUsers();

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
  Future<void> updateOrder(
      @Path("orderId") int orderId, @Body() OrderDTO order);

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
  Future<void> updateOrderPart(
      @Path("orderPartId") int orderPartId, @Body() OrderPartDTO orderPart);

  @DELETE("/orderparts/{orderPartId}")
  Future<void> deleteOrderPart(@Path("orderPartId") int orderPartId);
}
