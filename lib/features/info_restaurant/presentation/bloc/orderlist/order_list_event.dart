part of 'order_list_bloc.dart';

sealed class OrderListEvent extends Equatable {
  const OrderListEvent();

  @override
  List<Object> get props => [];
}

class GetProductsInOrderListEvent extends OrderListEvent {}

class AddProductToOrderListEvent extends OrderListEvent {
  final int productId;
  final int quantity;

  const AddProductToOrderListEvent({
    required this.productId,
    required this.quantity,
  });

  @override
  List<Object> get props => [productId, quantity];
}

class IncrementQuantityEvent extends OrderListEvent {
  final int productId;
  final int quantity;

  const IncrementQuantityEvent(
      {required this.productId, required this.quantity});

  @override
  List<Object> get props => [productId, quantity];
}

class DecrementQuantityEvent extends OrderListEvent {
  final int productId;
  final int quantity;

  const DecrementQuantityEvent({
    required this.productId,
    required this.quantity,
  });

  @override
  List<Object> get props => [productId, quantity];
}

class AddPesananEvent extends OrderListEvent {
  final String invoice;
  final String payment;
  final int pelangganId;
  final String pemesanan;
  final bool takeaway;
  final int mitraId;

  const AddPesananEvent(
      {required this.invoice,
      required this.payment,
      required this.pelangganId,
      required this.pemesanan,
      required this.takeaway,
      required this.mitraId});

  @override
  List<Object> get props =>
      [invoice, payment, pelangganId, pemesanan, takeaway, mitraId];
}
