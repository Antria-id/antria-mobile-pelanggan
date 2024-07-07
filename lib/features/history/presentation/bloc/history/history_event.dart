part of 'history_bloc.dart';

sealed class HistoryTransactionEvent extends Equatable {
  const HistoryTransactionEvent();

  @override
  List<Object> get props => [];
}

final class HistoryTransactionFetchData extends HistoryTransactionEvent {}
