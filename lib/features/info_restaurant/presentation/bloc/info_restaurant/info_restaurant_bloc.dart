import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/models/info_restaurant_model.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/domain/usecases/info_restaurant/get_info_restaurant_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'info_restaurant_event.dart';
part 'info_restaurant_state.dart';
part 'info_restaurant_bloc.freezed.dart';

class InfoRestaurantBloc
    extends Bloc<InfoRestaurantEvent, InfoRestaurantState> {
  InfoRestaurantBloc() : super(InfoRestaurantInitialState()) {
    on<InfoRestaurantEvent>((event, emit) async {
      emit(const InfoRestaurantState.loading());
      var result = await serviceLocator<GetInfoRestaurantUsecase>()
          .getInfoRestaurant(event.mitraId);
      result.fold(
        (failure) {
          emit(InfoRestaurantState.error(failure.message));
        },
        (data) {
          emit(InfoRestaurantState.loaded(response: data));
        },
      );
    });
  }
}
