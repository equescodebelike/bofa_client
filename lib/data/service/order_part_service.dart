import '../dto/order_part_dto.dart';
import '../repository/order_part_repository.dart';

class OrderPartService {
  final OrderPartRepository _repository;

  OrderPartService(this._repository);

  Future<List<OrderPartDTO>> getOrderParts() {
    return _repository.getOrderParts();
  }

  Future<OrderPartDTO> getOrderPart(int orderPartId) {
    return _repository.getOrderPart(orderPartId);
  }

  Future<void> createOrderPart(OrderPartDTO orderPart) {
    return _repository.createOrderPart(orderPart);
  }

  Future<void> updateOrderPart(int orderPartId, OrderPartDTO orderPart) {
    return _repository.updateOrderPart(orderPartId, orderPart);
  }

  Future<void> deleteOrderPart(int orderPartId) {
    return _repository.deleteOrderPart(orderPartId);
  }
}
