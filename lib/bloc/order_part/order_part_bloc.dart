import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/service/order_part_service.dart';
import 'order_part_event.dart';
import 'order_part_state.dart';

class OrderPartBloc extends Bloc<OrderPartEvent, OrderPartState> {
  final OrderPartService _orderPartService;

  OrderPartBloc(this._orderPartService) : super(const OrderPartInitial()) {
    on<FetchOrderParts>(_onFetchOrderParts);
    on<FetchOrderPart>(_onFetchOrderPart);
    on<CreateOrderPart>(_onCreateOrderPart);
    on<UpdateOrderPart>(_onUpdateOrderPart);
    on<DeleteOrderPart>(_onDeleteOrderPart);
  }

  Future<void> _onFetchOrderParts(
    FetchOrderParts event,
    Emitter<OrderPartState> emit,
  ) async {
    emit(const OrderPartLoading());
    try {
      final orderParts = await _orderPartService.getOrderParts();
      emit(OrderPartsLoaded(orderParts));
    } catch (e) {
      emit(OrderPartError(e.toString()));
    }
  }

  Future<void> _onFetchOrderPart(
    FetchOrderPart event,
    Emitter<OrderPartState> emit,
  ) async {
    emit(const OrderPartLoading());
    try {
      final orderPart = await _orderPartService.getOrderPart(event.orderPartId);
      emit(OrderPartLoaded(orderPart));
    } catch (e) {
      emit(OrderPartError(e.toString()));
    }
  }

  Future<void> _onCreateOrderPart(
    CreateOrderPart event,
    Emitter<OrderPartState> emit,
  ) async {
    emit(const OrderPartLoading());
    try {
      await _orderPartService.createOrderPart(event.orderPart);
      emit(const OrderPartOperationSuccess('Order part created successfully'));
    } catch (e) {
      emit(OrderPartError(e.toString()));
    }
  }

  Future<void> _onUpdateOrderPart(
    UpdateOrderPart event,
    Emitter<OrderPartState> emit,
  ) async {
    emit(const OrderPartLoading());
    try {
      await _orderPartService.updateOrderPart(
          event.orderPartId, event.orderPart);
      emit(const OrderPartOperationSuccess('Order part updated successfully'));
    } catch (e) {
      emit(OrderPartError(e.toString()));
    }
  }

  Future<void> _onDeleteOrderPart(
    DeleteOrderPart event,
    Emitter<OrderPartState> emit,
  ) async {
    emit(const OrderPartLoading());
    try {
      await _orderPartService.deleteOrderPart(event.orderPartId);
      emit(const OrderPartOperationSuccess('Order part deleted successfully'));
    } catch (e) {
      emit(OrderPartError(e.toString()));
    }
  }
}
