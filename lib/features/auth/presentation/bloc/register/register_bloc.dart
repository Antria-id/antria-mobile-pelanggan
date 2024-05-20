import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/request/register_request_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/domain/usecases/register/register_ucecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitialState()) {
    on<RegisterEvent>((event, emit) async {
      final user = event.user;
      emit(const RegisterState.loading());
      var result = await serviceLocator<RegisterUsecase>().registerUser(user);
      result.fold(
        (failure) {
          emit(RegisterState.error(failure.message));
        },
        (data) {
          emit(RegisterState.loaded(user: user));
        },
      );
    });
  }
}
