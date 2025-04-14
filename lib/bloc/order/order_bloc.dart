import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/service/order_service.dart';
import 'order_event.dart';
import 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderService _orderService;

  OrderBloc(this._orderService) : super(const OrderInitial()) {
    on<FetchOrders>(_onFetchOrders);
    on<FetchOrder>(_onFetchOrder);
    on<CreateOrder>(_onCreateOrder);
    on<UpdateOrder>(_onUpdateOrder);
    on<DeleteOrder>(_onDeleteOrder);
  }

  Future<void> _onFetchOrders(
    FetchOrders event,
    Emitter<OrderState> emit,
  ) async {
    emit(const OrderLoading());
    try {
      final orders = await _orderService.getOrders();
      emit(OrdersLoaded(orders));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }

  Future<void> _onFetchOrder(
    FetchOrder event,
    Emitter<OrderState> emit,
  ) async {
    emit(const OrderLoading());
    try {
      final order = await _orderService.getOrder(event.orderId);
      emit(OrderLoaded(order));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }

  Future<void> _onCreateOrder(
    CreateOrder event,
    Emitter<OrderState> emit,
  ) async {
    emit(const OrderLoading());
    try {
      await _orderService.createOrder(event.order);
      emit(const OrderOperationSuccess('Order created successfully'));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }

  Future<void> _onUpdateOrder(
    UpdateOrder event,
    Emitter<OrderState> emit,
  ) async {
    emit(const OrderLoading());
    try {
      await _orderService.updateOrder(event.orderId, event.order);
      emit(const OrderOperationSuccess('Order updated successfully'));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }

  Future<void> _onDeleteOrder(
    DeleteOrder event,
    Emitter<OrderState> emit,
  ) async {
    emit(const OrderLoading());
    try {
      await _orderService.deleteOrder(event.orderId);
      emit(const OrderOperationSuccess('Order deleted successfully'));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }
}
