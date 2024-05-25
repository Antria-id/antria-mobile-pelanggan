part of 'update_pelanggan_bloc.dart';

@freezed
class UpdatePelangganState with _$UpdatePelangganState {
  const factory UpdatePelangganState.initial() = UpdatePelangganInitialState;
  const factory UpdatePelangganState.loading() = UpdatePelangganLoadingState;
  const factory UpdatePelangganState.error(String message) =
      UpdatePelangganErrorState;
  const factory UpdatePelangganState.loaded({
    required UpdatePelangganRequestModel requestUser,
  }) = UpdatePelangganLoadedState;
}
