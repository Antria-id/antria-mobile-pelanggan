import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ewallet_event.dart';
part 'ewallet_state.dart';

class EwalletBloc extends Bloc<EwalletEvent, EwalletState> {
  EwalletBloc() : super(EwalletInitial()) {
    on<EwalletEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
