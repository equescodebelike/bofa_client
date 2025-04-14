import '../dto/order_part_dto.dart';
import '../service/api_client.dart';

abstract class OrderPartRepository {
  Future<List<OrderPartDTO>> getOrderParts();
  Future<OrderPartDTO> getOrderPart(int orderPartId);
  Future<void> createOrderPart(OrderPartDTO orderPart);
  Future<void> updateOrderPart(int orderPartId, OrderPartDTO orderPart);
  Future<void> deleteOrderPart(int orderPartId);
}

class OrderPartRepositoryImpl implements OrderPartRepository {
  final ApiClient _apiClient;

  OrderPartRepositoryImpl(this._apiClient);

  @override
  Future<List<OrderPartDTO>> getOrderParts() {
    return _apiClient.getOrderParts();
  }

  @override
  Future<OrderPartDTO> getOrderPart(int orderPartId) {
    return _apiClient.getOrderPart(orderPartId);
  }

  @override
  Future<void> createOrderPart(OrderPartDTO orderPart) {
    return _apiClient.createOrderPart(orderPart);
  }

  @override
  Future<void> updateOrderPart(int orderPartId, OrderPartDTO orderPart) {
    return _apiClient.updateOrderPart(orderPartId, orderPart);
  }

  @override
  Future<void> deleteOrderPart(int orderPartId) {
    return _apiClient.deleteOrderPart(orderPartId);
  }
}
