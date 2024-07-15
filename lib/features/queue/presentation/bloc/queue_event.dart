part of 'queue_bloc.dart';

sealed class QueueEvent extends Equatable {
  const QueueEvent();

  @override
  List<Object> get props => [];
}

final class QueueFetchData extends QueueEvent {
  final int mitraId;

  const QueueFetchData(this.mitraId);

  @override
  List<Object> get props => [mitraId];
}

class QueueFetchPesanan extends QueueEvent {
  final String invoiceId;

  const QueueFetchPesanan(this.invoiceId);

  @override
  List<Object> get props => [invoiceId];
}
