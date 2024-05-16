import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'success_order_event.dart';
part 'success_order_state.dart';

class SuccessOrderBloc extends Bloc<SuccessOrderEvent, SuccessOrderState> {
  SuccessOrderBloc() : super(SuccessOrderInitial()) {
    on<SuccessOrderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
