part of 'order_bloc.dart';

sealed class OrderTransactionState extends Equatable {
  const OrderTransactionState();

  @override
  List<Object> get props => [];
}

final class OrderTransactionInitial extends OrderTransactionState {}

final class OrderTransactionLoading extends OrderTransactionState {}

final class OrderTransactionLoaded extends OrderTransactionState {
  final List<OrderTransactionResponse> transactionList;

  const OrderTransactionLoaded({required this.transactionList});
}

final class OrderTransactionError extends OrderTransactionState {
  final String? message;

  const OrderTransactionError({required this.message});
}
