import 'package:antria_mobile_pelanggan/core/network/network_checker.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/models/get_menu_model.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/domain/usecases/menu_restaurant/get_menu_restaurant_usecase.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/domain/usecases/order_list/order_list_restaurant.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final NetworkChecker networkChecker;

  MenuBloc()
      : networkChecker = serviceLocator<NetworkChecker>(),
        super(MenuInitial()) {
    on<MenuEvent>((event, emit) async {
      if (event is MenuFetchData) {
        emit(MenuLoading());
        bool isConnected = await networkChecker.isConnected;
        if (isConnected) {
          var result = await serviceLocator<GetMenuUsecase>()
              .getMenuRestaurant(event.mitraId);
          result.fold(
            (failure) {
              emit(
                MenuError(message: failure.message),
              );
            },
            (data) {
              emit(
                MenuLoaded(
                  menu: data,
                ),
              );
            },
          );
        } else {
          var result = await serviceLocator<OrderListUsecase>().getLocalMenu();
          result.fold(
            (failure) {
              emit(MenuError(message: failure.message));
            },
            (data) {
              emit(
                MenuLoaded(
                  menu: data,
                ),
              );
            },
          );
        }
      } else if (event is ClearMenu) {
        try {
          var result =
              await serviceLocator<OrderListUsecase>().deleteAllProducts();
          result.fold(
            (failure) {
              emit(MenuError(message: failure.message));
            },
            (_) {
              emit(
                MenuClear(),
              );
            },
          );
        } catch (e) {
          emit(MenuError(message: e.toString()));
        }
      }
    });
  }
}
