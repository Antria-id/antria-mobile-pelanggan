import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_order_event.dart';
part 'detail_order_state.dart';

class DetailOrderBloc extends Bloc<DetailOrderEvent, DetailOrderState> {
  DetailOrderBloc() : super(DetailOrderInitial()) {
    on<DetailOrderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
