part of 'logout_bloc.dart';

@freezed
class LogoutState with _$LogoutState {
  const factory LogoutState.initial() = LogoutInitialState;
  const factory LogoutState.loading() = LogoutLoadingState;
  const factory LogoutState.error(String message) = LogoutErrorState;
  const factory LogoutState.loadedState({
    required UserModel? user,
  }) = LogoutLoadedState;
}
