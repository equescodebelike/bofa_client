import 'package:equatable/equatable.dart';
import '../../data/dto/order_part_dto.dart';

abstract class OrderPartEvent extends Equatable {
  const OrderPartEvent();

  @override
  List<Object?> get props => [];
}

class FetchOrderParts extends OrderPartEvent {
  const FetchOrderParts();
}

class FetchOrderPart extends OrderPartEvent {
  final int orderPartId;

  const FetchOrderPart(this.orderPartId);

  @override
  List<Object?> get props => [orderPartId];
}

class CreateOrderPart extends OrderPartEvent {
  final OrderPartDTO orderPart;

  const CreateOrderPart(this.orderPart);

  @override
  List<Object?> get props => [orderPart];
}

class UpdateOrderPart extends OrderPartEvent {
  final int orderPartId;
  final OrderPartDTO orderPart;

  const UpdateOrderPart(this.orderPartId, this.orderPart);

  @override
  List<Object?> get props => [orderPartId, orderPart];
}

class DeleteOrderPart extends OrderPartEvent {
  final int orderPartId;

  const DeleteOrderPart(this.orderPartId);

  @override
  List<Object?> get props => [orderPartId];
}
