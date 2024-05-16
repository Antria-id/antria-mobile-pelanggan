import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'queue_event.dart';
part 'queue_state.dart';

class QueueBloc extends Bloc<QueueEvent, QueueState> {
  QueueBloc() : super(QueueInitial()) {
    on<QueueEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
