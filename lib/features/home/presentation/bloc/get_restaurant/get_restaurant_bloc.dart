import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/data/models/response/get_restaurant_model.dart';
import 'package:antria_mobile_pelanggan/features/domain/usecase/restaurant/get_restaurant.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_restaurant_event.dart';
part 'get_restaurant_state.dart';
part 'get_restaurant_bloc.freezed.dart';

class GetRestaurantBloc extends Bloc<GetRestaurantEvent, GetRestaurantState> {
  GetRestaurantBloc() : super(const RestaurantInitialState()) {
    on<GetRestaurantEvent>((event, emit) async {
      emit(const GetRestaurantState.loading());
      var result = await serviceLocator<GetRestaurantUsecase>().getRestaurant();
      result.fold(
        (failure) {
          emit(GetRestaurantState.error(failure.message));
        },
        (data) {
          emit(GetRestaurantState.loaded(response: data));
        },
      );
    });
  }
}
