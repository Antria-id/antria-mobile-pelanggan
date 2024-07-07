part of 'detail_bloc.dart';

sealed class DetailTransactionState extends Equatable {
  const DetailTransactionState();

  @override
  List<Object> get props => [];
}

final class DetailTransactionInitial extends DetailTransactionState {}

final class DetailTransactionLoading extends DetailTransactionState {}

final class DetailTransactionLoaded extends DetailTransactionState {
  final DetailTransactionModel response;

  const DetailTransactionLoaded({required this.response});
}

final class DetailTransactionError extends DetailTransactionState {
  final String? message;

  const DetailTransactionError({required this.message});
}
