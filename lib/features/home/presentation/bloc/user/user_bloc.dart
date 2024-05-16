import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/data/models/response/user_response_model.dart';
import 'package:antria_mobile_pelanggan/features/domain/usecase/home/get_local_user_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<UserEvent>((event, emit) async {
      emit(const UserLoadingState());
      var result =
          await serviceLocator<GetLocalUserUsecase>().getUserFromLocalStorage();
      result.fold(
        (failure) {
          emit(UserState.error(failure.message));
        },
        (data) {
          emit(
            UserState.loadedState(
              user: result.getOrElse(
                () => UserModel(),
              ),
            ),
          );
        },
      );
    });
  }
}
