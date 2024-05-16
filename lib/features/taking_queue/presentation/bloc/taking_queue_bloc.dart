import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'taking_queue_event.dart';
part 'taking_queue_state.dart';

class TakingQueueBloc extends Bloc<TakingQueueEvent, TakingQueueState> {
  TakingQueueBloc() : super(TakingQueueInitial()) {
    on<TakingQueueEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
