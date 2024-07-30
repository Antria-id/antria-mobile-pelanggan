import 'package:antria_mobile_pelanggan/core/network/network_checker.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/home/data/models/user/user_response_model.dart';
import 'package:antria_mobile_pelanggan/features/home/domain/usecases/home/get_local_user_usecase.dart';
import 'package:antria_mobile_pelanggan/features/home/domain/usecases/home/get_remote_user_usecase.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/pelanggan_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final NetworkChecker networkChecker;

  UserBloc()
      : networkChecker = serviceLocator<NetworkChecker>(),
        super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is UserFetchData) {
        emit(UserLoading());
        bool isConnected = await networkChecker.isConnected;
        if (isConnected) {
          var result = await serviceLocator<GetUserRemoteUsecase>().getUser();
          result.fold(
            (failure) {
              emit(UserError(message: failure.message));
            },
            (data) {
              emit(UserLoaded(user: data));
            },
          );
        } else {
          var result = await serviceLocator<GetLocalUserUsecase>()
              .getUserFromLocalStorage();
          result.fold(
            (failure) {
              emit(UserError(message: failure.message));
            },
            (data) {
              emit(
                UserLocalLoaded(
                  user: result.getOrElse(() => UserModel()),
                ),
              );
            },
          );
        }
      }
    });
  }
}
