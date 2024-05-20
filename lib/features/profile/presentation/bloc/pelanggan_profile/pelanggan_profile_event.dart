part of 'pelanggan_profile_bloc.dart';

@freezed
class PelangganProfileEvent with _$PelangganProfileEvent {
  const factory PelangganProfileEvent.onGetProfile() =
      GetPelangganFetchDataEvent;
}
