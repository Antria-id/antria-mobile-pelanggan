part of 'order_bloc.dart';

sealed class OrderTransactionEvent extends Equatable {
  const OrderTransactionEvent();

  @override
  List<Object> get props => [];
}

final class OrderTransactionFetchData extends OrderTransactionEvent {}
