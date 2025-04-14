import 'package:equatable/equatable.dart';
import '../../data/dto/order_dto.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class FetchOrders extends OrderEvent {
  const FetchOrders();
}

class FetchOrder extends OrderEvent {
  final int orderId;

  const FetchOrder(this.orderId);

  @override
  List<Object?> get props => [orderId];
}

class CreateOrder extends OrderEvent {
  final OrderDTO order;

  const CreateOrder(this.order);

  @override
  List<Object?> get props => [order];
}

class UpdateOrder extends OrderEvent {
  final int orderId;
  final OrderDTO order;

  const UpdateOrder(this.orderId, this.order);

  @override
  List<Object?> get props => [orderId, order];
}

class DeleteOrder extends OrderEvent {
  final int orderId;

  const DeleteOrder(this.orderId);

  @override
  List<Object?> get props => [orderId];
}
