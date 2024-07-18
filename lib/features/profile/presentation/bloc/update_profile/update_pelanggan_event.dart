part of 'update_pelanggan_bloc.dart';

sealed class UpdatePelangganEvent extends Equatable {
  const UpdatePelangganEvent();

  @override
  List<Object> get props => [];
}

final class UpdatePelangganTapped extends UpdatePelangganEvent {
  final UpdatePelangganRequestModel requestUser;

  const UpdatePelangganTapped({required this.requestUser});

  @override
  List<Object> get props => [requestUser];
}
