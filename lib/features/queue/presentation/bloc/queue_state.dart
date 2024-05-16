part of 'queue_bloc.dart';

abstract class QueueState extends Equatable {
  const QueueState();  

  @override
  List<Object> get props => [];
}
class QueueInitial extends QueueState {}
