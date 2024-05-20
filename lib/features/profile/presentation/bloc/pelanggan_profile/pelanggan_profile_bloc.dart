import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/pelanggan_model.dart';
import 'package:antria_mobile_pelanggan/features/profile/domain/usecases/get_pelanggan_profile_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pelanggan_profile_event.dart';
part 'pelanggan_profile_state.dart';
part 'pelanggan_profile_bloc.freezed.dart';

class PelangganProfileBloc
    extends Bloc<PelangganProfileEvent, PelangganProfileState> {
  PelangganProfileBloc() : super(const PelangganProfileStateInitialState()) {
    on<PelangganProfileEvent>((event, emit) async {
      emit(const PelangganProfileState.loading());
      var result =
          await serviceLocator<GetPelangganProfileUsecase>().getPelanggan();
      result.fold(
        (failure) {
          emit(PelangganProfileState.error(failure.message));
        },
        (data) {
          emit(
            PelangganProfileState.loadedState(
              pelangganModel: data,
            ),
          );
        },
      );
    });
  }
}
