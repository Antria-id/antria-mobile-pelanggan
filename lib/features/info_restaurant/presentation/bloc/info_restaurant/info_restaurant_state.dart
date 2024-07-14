part of 'info_restaurant_bloc.dart';

@freezed
class InfoRestaurantState with _$InfoRestaurantState {
  const factory InfoRestaurantState.initial() = InfoRestaurantInitialState;
  const factory InfoRestaurantState.loading() = InfoRestaurantLoadingState;
  const factory InfoRestaurantState.error(String message) =
      InfoRestaurantErrorState;
  const factory InfoRestaurantState.loaded({
    required GetInfoRestaurantResponse response,
  }) = InfoRestaurantLoadedState;
}
