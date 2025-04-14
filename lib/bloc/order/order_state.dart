import 'package:equatable/equatable.dart';
import '../../data/dto/order_dto.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object?> get props => [];
}

class OrderInitial extends OrderState {
  const OrderInitial();
}

class OrderLoading extends OrderState {
  const OrderLoading();
}

class OrdersLoaded extends OrderState {
  final List<OrderDTO> orders;

  const OrdersLoaded(this.orders);

  @override
  List<Object?> get props => [orders];
}

class OrderLoaded extends OrderState {
  final OrderDTO order;

  const OrderLoaded(this.order);

  @override
  List<Object?> get props => [order];
}

class OrderOperationSuccess extends OrderState {
  final String message;

  const OrderOperationSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class OrderError extends OrderState {
  final String message;

  const OrderError(this.message);

  @override
  List<Object?> get props => [message];
}
