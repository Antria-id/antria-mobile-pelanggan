part of 'pelanggan_profile_bloc.dart';

sealed class PelangganProfileState extends Equatable {
  const PelangganProfileState();

  @override
  List<Object> get props => [];
}

final class PelangganProfileInitial extends PelangganProfileState {}

final class PelangganProfileLoading extends PelangganProfileState {}

final class PelangganProfileLoaded extends PelangganProfileState {
  final PelangganModel pelangganModel;

  const PelangganProfileLoaded({required this.pelangganModel});
}

final class PelangganProfileError extends PelangganProfileState {
  final String? message;

  const PelangganProfileError({required this.message});
}
