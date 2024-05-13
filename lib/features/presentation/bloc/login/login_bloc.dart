import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/data/models/request/login_request_model.dart';
import 'package:antria_mobile_pelanggan/features/domain/usecase/login/login_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginEvent>((event, emit) async {
      final user = event.user;
      emit(const LoginState.loading());
      var result = await serviceLocator<LoginUsecase>().loginUser(user);
      result.fold(
        (failure) {
          emit(LoginState.error(failure.message));
        },
        (data) {
          emit(LoginState.loaded(user: user));
        },
      );
    });
  }
}
