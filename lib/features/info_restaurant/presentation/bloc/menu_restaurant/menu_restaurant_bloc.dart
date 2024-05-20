import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/models/get_menu_model.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/domain/usecases/menu_restaurant/get_menu_restaurant_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_restaurant_event.dart';
part 'menu_restaurant_state.dart';
part 'menu_restaurant_bloc.freezed.dart';

class MenuRestaurantBloc
    extends Bloc<MenuRestaurantEvent, MenuRestaurantState> {
  MenuRestaurantBloc() : super(MenuRestaurantInitialState()) {
    on<MenuRestaurantEvent>((event, emit) async {
      emit(const MenuRestaurantState.loading());
      var result = await serviceLocator<MenuGetRestaurantUsecase>()
          .getMenuRestaurant(event.mitraId);
      result.fold(
        (failure) {
          emit(MenuRestaurantState.error(failure.message));
        },
        (data) {
          emit(MenuRestaurantState.loaded(response: data));
        },
      );
    });
  }
}
