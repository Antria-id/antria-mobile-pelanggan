part of 'history_bloc.dart';

sealed class HistoryTransactionState extends Equatable {
  const HistoryTransactionState();

  @override
  List<Object> get props => [];
}

final class HistoryTransactionInitial extends HistoryTransactionState {}

final class HistoryTransactionLoading extends HistoryTransactionState {}

final class HistoryTransactionLoaded extends HistoryTransactionState {
  final List<HistoryTransactionResponse> transactionList;

  const HistoryTransactionLoaded({required this.transactionList});
}

final class HistoryTransactionError extends HistoryTransactionState {
  final String? message;

  const HistoryTransactionError({required this.message});
}
