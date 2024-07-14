part of 'info_restaurant_bloc.dart';

@freezed
class InfoRestaurantEvent with _$InfoRestaurantEvent {
  const factory InfoRestaurantEvent.ongetInfoRestaurant({
    required int mitraId,
  }) = InfoRestaurantUserEvent;
}
