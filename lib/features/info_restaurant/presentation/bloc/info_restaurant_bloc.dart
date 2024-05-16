import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'info_restaurant_event.dart';
part 'info_restaurant_state.dart';

class InfoRestaurantBloc extends Bloc<InfoRestaurantEvent, InfoRestaurantState> {
  InfoRestaurantBloc() : super(InfoRestaurantInitial()) {
    on<InfoRestaurantEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
