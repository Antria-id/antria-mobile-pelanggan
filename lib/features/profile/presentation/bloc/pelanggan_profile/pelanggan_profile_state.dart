part of 'pelanggan_profile_bloc.dart';

@freezed
class PelangganProfileState with _$PelangganProfileState {
  const factory PelangganProfileState.initial() =
      PelangganProfileStateInitialState;
  const factory PelangganProfileState.loading() =
      PelangganProfileStateLoadingState;
  const factory PelangganProfileState.error(String message) =
      PelangganProfileStateErrorState;
  const factory PelangganProfileState.loadedState({
    required PelangganModel pelangganModel,
  }) = PelangganProfileStateLoadedState;
}
