import '../dto/order_dto.dart';
import '../repository/order_repository.dart';

class OrderService {
  final OrderRepository _repository;

  OrderService(this._repository);

  Future<List<OrderDTO>> getOrders() {
    return _repository.getOrders();
  }

  Future<OrderDTO> getOrder(int orderId) {
    return _repository.getOrder(orderId);
  }

  Future<void> createOrder(OrderDTO order) {
    return _repository.createOrder(order);
  }

  Future<void> updateOrder(int orderId, OrderDTO order) {
    return _repository.updateOrder(orderId, order);
  }

  Future<void> deleteOrder(int orderId) {
    return _repository.deleteOrder(orderId);
  }
}
