part of 'ewallet_bloc.dart';

sealed class EwalletState extends Equatable {
  const EwalletState();

  @override
  List<Object> get props => [];
}

class EwalletInitial extends EwalletState {}

class EwalletLoading extends EwalletState {}

final class EwalletSuccess extends EwalletState {
  final UpdateEwalletModel updateEwallet;

  const EwalletSuccess({required this.updateEwallet});
}

class EwalletError extends EwalletState {
  final String message;

  const EwalletError(this.message);

  @override
  List<Object> get props => [message];
}

class PelangganList extends EwalletState {}
