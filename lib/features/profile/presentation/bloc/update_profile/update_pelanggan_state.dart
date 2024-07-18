part of 'update_pelanggan_bloc.dart';

sealed class UpdatePelangganState extends Equatable {
  const UpdatePelangganState();

  @override
  List<Object> get props => [];
}

final class UpdatePelangganInitial extends UpdatePelangganState {}

final class UpdatePelangganLoading extends UpdatePelangganState {}

final class UpdatePelangganSuccess extends UpdatePelangganState {
  final UpdatePelangganRequestModel requestUser;

  const UpdatePelangganSuccess({required this.requestUser});
}

final class UpdatePelangganFailed extends UpdatePelangganState {
  final String? message;

  const UpdatePelangganFailed({required this.message});
}
