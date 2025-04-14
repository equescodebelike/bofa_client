import '../dto/order_dto.dart';
import '../service/api_client.dart';

abstract class OrderRepository {
  Future<List<OrderDTO>> getOrders();
  Future<OrderDTO> getOrder(int orderId);
  Future<void> createOrder(OrderDTO order);
  Future<void> updateOrder(int orderId, OrderDTO order);
  Future<void> deleteOrder(int orderId);
}

class OrderRepositoryImpl implements OrderRepository {
  final ApiClient _apiClient;

  OrderRepositoryImpl(this._apiClient);

  @override
  Future<List<OrderDTO>> getOrders() {
    return _apiClient.getOrders();
  }

  @override
  Future<OrderDTO> getOrder(int orderId) {
    return _apiClient.getOrder(orderId);
  }

  @override
  Future<void> createOrder(OrderDTO order) {
    return _apiClient.createOrder(order);
  }

  @override
  Future<void> updateOrder(int orderId, OrderDTO order) {
    return _apiClient.updateOrder(orderId, order);
  }

  @override
  Future<void> deleteOrder(int orderId) {
    return _apiClient.deleteOrder(orderId);
  }
}
