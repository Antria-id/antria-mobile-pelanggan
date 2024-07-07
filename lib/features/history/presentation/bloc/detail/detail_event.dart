part of 'detail_bloc.dart';

sealed class DetailTransactionEvent extends Equatable {
  const DetailTransactionEvent();

  @override
  List<Object> get props => [];
}

final class DetailTransactionFetchData extends DetailTransactionEvent {
  final String invoice;

  const DetailTransactionFetchData({required this.invoice});

  @override
  List<Object> get props => [invoice];
}
