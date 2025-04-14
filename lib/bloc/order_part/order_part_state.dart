import 'package:equatable/equatable.dart';
import '../../data/dto/order_part_dto.dart';

abstract class OrderPartState extends Equatable {
  const OrderPartState();

  @override
  List<Object?> get props => [];
}

class OrderPartInitial extends OrderPartState {
  const OrderPartInitial();
}

class OrderPartLoading extends OrderPartState {
  const OrderPartLoading();
}

class OrderPartsLoaded extends OrderPartState {
  final List<OrderPartDTO> orderParts;

  const OrderPartsLoaded(this.orderParts);

  @override
  List<Object?> get props => [orderParts];
}

class OrderPartLoaded extends OrderPartState {
  final OrderPartDTO orderPart;

  const OrderPartLoaded(this.orderPart);

  @override
  List<Object?> get props => [orderPart];
}

class OrderPartOperationSuccess extends OrderPartState {
  final String message;

  const OrderPartOperationSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class OrderPartError extends OrderPartState {
  final String message;

  const OrderPartError(this.message);

  @override
  List<Object?> get props => [message];
}
