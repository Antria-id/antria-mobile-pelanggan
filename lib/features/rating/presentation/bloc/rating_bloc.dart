import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'rating_event.dart';
part 'rating_state.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  RatingBloc() : super(RatingInitial()) {
    on<RatingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
