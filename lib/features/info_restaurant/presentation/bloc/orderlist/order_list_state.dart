part of 'order_list_bloc.dart';

sealed class OrderListState extends Equatable {
  const OrderListState();

  @override
  List<Object> get props => [];
}

class OrderListInitial extends OrderListState {}

class OrderListLoading extends OrderListState {}

class OrderListLoaded extends OrderListState {
  final List<Map<String, dynamic>> products;

  const OrderListLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class OrderListError extends OrderListState {
  final String message;

  const OrderListError(this.message);

  @override
  List<Object> get props => [message];
}

class ProductAddedToOrderList extends OrderListState {}

class IncrementQuantity extends OrderListState {}

class DecrementQuantity extends OrderListState {}
