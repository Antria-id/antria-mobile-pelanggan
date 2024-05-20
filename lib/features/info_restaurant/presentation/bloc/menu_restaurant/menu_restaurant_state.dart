part of 'menu_restaurant_bloc.dart';

@freezed
class MenuRestaurantState with _$MenuRestaurantState {
  const factory MenuRestaurantState.initial() = MenuRestaurantInitialState;
  const factory MenuRestaurantState.loading() = MenuRestaurantLoadingState;
  const factory MenuRestaurantState.error(String message) =
      MenuRestaurantErrorState;
  const factory MenuRestaurantState.loaded({
    required List<GetMenuResponse> response,
  }) = MenuRestaurantLoadedState;
}
