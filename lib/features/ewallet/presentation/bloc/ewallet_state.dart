part of 'ewallet_bloc.dart';

abstract class EwalletState extends Equatable {
  const EwalletState();  

  @override
  List<Object> get props => [];
}
class EwalletInitial extends EwalletState {}
