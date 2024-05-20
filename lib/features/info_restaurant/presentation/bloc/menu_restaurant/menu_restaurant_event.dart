part of 'menu_restaurant_bloc.dart';

@freezed
class MenuRestaurantEvent with _$MenuRestaurantEvent {
  const factory MenuRestaurantEvent.ongetMenuRestaurant({
    required int mitraId,
  }) = MenuRestaurantUserEvent;
}
