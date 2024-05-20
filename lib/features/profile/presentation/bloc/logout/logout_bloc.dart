import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/home/data/models/user/user_response_model.dart';
import 'package:antria_mobile_pelanggan/features/profile/domain/usecases/logout_user_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_event.dart';
part 'logout_state.dart';
part 'logout_bloc.freezed.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(const LogoutInitialState()) {
    on<LogoutEvent>((event, emit) async {
      emit(const LogoutLoadingState());
      var result = await serviceLocator<LogoutUserUsecase>()
          .deleteUserFromLocalStorage();
      result.fold(
        (failure) {
          emit(LogoutState.error(failure.message));
        },
        (data) {
          emit(
            const LogoutState.loadedState(
              user: null,
            ),
          );
        },
      );
    });
  }
}
