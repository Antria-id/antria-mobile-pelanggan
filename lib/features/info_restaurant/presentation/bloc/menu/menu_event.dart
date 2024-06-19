part of 'menu_bloc.dart';

sealed class MenuEvent extends Equatable {
  const MenuEvent();

  @override
  List<Object> get props => [];
}

final class MenuFetchData extends MenuEvent {
  final int mitraId;

  const MenuFetchData({required this.mitraId});

  @override
  List<Object> get props => [mitraId];
}
