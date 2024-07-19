part of 'ewallet_bloc.dart';

sealed class EwalletEvent extends Equatable {
  const EwalletEvent();

  @override
  List<Object> get props => [];
}

final class UpdateEwalletTapped extends EwalletEvent {
  final UpdateEwalletModel updateEwallet;

  const UpdateEwalletTapped({required this.updateEwallet});

  @override
  List<Object> get props => [updateEwallet];
}
