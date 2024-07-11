import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/domain/usecases/order_list/order_list_restaurant.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'order_list_event.dart';
part 'order_list_state.dart';

class OrderListBloc extends Bloc<OrderListEvent, OrderListState> {
  OrderListBloc() : super(OrderListInitial()) {
    on<AddProductToOrderListEvent>(_onAddProductToOrderList);
    on<GetProductsInOrderListEvent>(_onGetProductsInOrderList);
    on<IncrementQuantityEvent>(_onIncrementQuantity);
    on<DecrementQuantityEvent>(_onDecrementQuantity);
    on<AddPesananEvent>(_onAddPesanan);
  }

  Future<void> _onAddProductToOrderList(
    AddProductToOrderListEvent event,
    Emitter<OrderListState> emit,
  ) async {
    emit(OrderListLoading());
    final result = await serviceLocator<OrderListUsecase>()
        .addProduct(event.productId, event.quantity);
    result.fold(
      (failure) => emit(OrderListError(_mapFailureToMessage(failure))),
      (_) {
        emit(ProductAddedToOrderList());
        print('Product successfully added to the order list.');
      },
    );
  }

  Future<void> _onIncrementQuantity(
    IncrementQuantityEvent event,
    Emitter<OrderListState> emit,
  ) async {
    emit(OrderListLoading());
    final result = await serviceLocator<OrderListUsecase>()
        .incrementOrderQuantity(event.productId, event.quantity);
    result.fold(
      (failure) => emit(OrderListError(_mapFailureToMessage(failure))),
      (_) {
        emit(ProductAddedToOrderList());
        print('Increment quantity product update.');
      },
    );
  }

  Future<void> _onDecrementQuantity(
    DecrementQuantityEvent event,
    Emitter<OrderListState> emit,
  ) async {
    emit(OrderListLoading());
    final result = await serviceLocator<OrderListUsecase>()
        .decrementOrderQuantity(event.productId, event.quantity);
    result.fold(
      (failure) => emit(OrderListError(_mapFailureToMessage(failure))),
      (_) {
        emit(ProductAddedToOrderList());
        print('Decrement quantity product update.');
      },
    );
  }

  Future<void> _onGetProductsInOrderList(
    GetProductsInOrderListEvent event,
    Emitter<OrderListState> emit,
  ) async {
    emit(OrderListLoading());
    final result =
        await serviceLocator<OrderListUsecase>().getProductsInOrderList();
    result.fold(
      (failure) => emit(OrderListError(_mapFailureToMessage(failure))),
      (products) => emit(OrderListLoaded(products)),
    );
  }

  Future<void> _onAddPesanan(
    AddPesananEvent event,
    Emitter<OrderListState> emit,
  ) async {
    emit(OrderListLoading());
    final result = await serviceLocator<OrderListUsecase>().insertPesanan(
      event.invoice,
      event.payment,
      event.pelangganId,
      event.pemesanan,
      event.takeaway,
      event.mitraId,
    );
    result.fold(
      (failure) => emit(OrderListError(_mapFailureToMessage(failure))),
      (_) {
        emit(AddPesanan(invoice: event.invoice));
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case LocalDatabaseQueryFailure:
        return 'Database Error';
      default:
        return 'Unexpected Error';
    }
  }
}
