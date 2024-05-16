import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'thanks_page_event.dart';
part 'thanks_page_state.dart';

class ThanksPageBloc extends Bloc<ThanksPageEvent, ThanksPageState> {
  ThanksPageBloc() : super(ThanksPageInitial()) {
    on<ThanksPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
