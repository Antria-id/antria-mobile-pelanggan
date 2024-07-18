part of 'pelanggan_profile_bloc.dart';

@freezed
sealed class PelangganProfileEvent extends Equatable {
  const PelangganProfileEvent();

  @override
  List<Object> get props => [];
}

final class PelangganProfileFetchData extends PelangganProfileEvent {}
