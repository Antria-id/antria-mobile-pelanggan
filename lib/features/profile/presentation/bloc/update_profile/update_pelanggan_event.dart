part of 'update_pelanggan_bloc.dart';

@freezed
class UpdatePelangganEvent with _$UpdatePelangganEvent {
  const factory UpdatePelangganEvent.onUpdateTapped(
          {required UpdatePelangganRequestModel requestUser}) =
      UpdatePelangganFetchDataEvent;
}
