part of 'get_restaurant_bloc.dart';

@freezed
class GetRestaurantEvent with _$GetRestaurantEvent {
  const factory GetRestaurantEvent.ongetRestaurant() = RestaurantUserEvent;
}
