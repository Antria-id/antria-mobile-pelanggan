import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/update_pelanggan_request_mode.dart';
import 'package:antria_mobile_pelanggan/features/profile/domain/usecases/update_pelanggan_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_pelanggan_event.dart';
part 'update_pelanggan_state.dart';
part 'update_pelanggan_bloc.freezed.dart';

class UpdatePelangganBloc
    extends Bloc<UpdatePelangganEvent, UpdatePelangganState> {
  UpdatePelangganBloc() : super(const UpdatePelangganInitialState()) {
    on<UpdatePelangganEvent>((event, emit) async {
      final user = event.requestUser;
      emit(const UpdatePelangganState.loading());
      var result =
          await serviceLocator<UpdatePelangganUsecase>().updatePelanggan(user);
      result.fold(
        (failure) {
          emit(UpdatePelangganState.error(failure.message));
        },
        (data) {
          emit(
            UpdatePelangganState.loaded(requestUser: user),
          );
        },
      );
    });
  }
}
