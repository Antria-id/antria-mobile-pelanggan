part of 'queue_bloc.dart';

sealed class QueueState extends Equatable {
  const QueueState();

  @override
  List<Object> get props => [];
}

final class QueueInitial extends QueueState {}

final class QueueLoading extends QueueState {}

final class QueueLoaded extends QueueState {
  final List<QueueListModel> pesananList;

  const QueueLoaded({required this.pesananList});
}

final class QueueError extends QueueState {
  final String? message;

  const QueueError({required this.message});
}
