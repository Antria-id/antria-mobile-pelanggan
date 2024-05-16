part of 'get_restaurant_bloc.dart';

@freezed
class GetRestaurantState with _$GetRestaurantState {
  const factory GetRestaurantState.initial() = RestaurantInitialState;
  const factory GetRestaurantState.loading() = RestaurantLoadingState;
  const factory GetRestaurantState.error(String message) = RestaurantErrorState;
  const factory GetRestaurantState.loaded({
    required List<GetRestaurantResponse> response,
  }) = RestaurantLoadedState;
}
