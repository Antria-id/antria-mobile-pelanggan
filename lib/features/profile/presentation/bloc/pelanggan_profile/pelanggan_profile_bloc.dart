import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/pelanggan_model.dart';
import 'package:antria_mobile_pelanggan/features/profile/domain/usecases/get_pelanggan_profile_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pelanggan_profile_event.dart';
part 'pelanggan_profile_state.dart';

class PelangganProfileBloc
    extends Bloc<PelangganProfileEvent, PelangganProfileState> {
  PelangganProfileBloc() : super(PelangganProfileInitial()) {
    on<PelangganProfileEvent>((event, emit) async {
      if (event is PelangganProfileFetchData) {
        emit(PelangganProfileLoading());

        var result =
            await serviceLocator<GetPelangganProfileUsecase>().getPelanggan();
        result.fold(
          (failure) {
            emit(PelangganProfileError(message: failure.message));
          },
          (data) {
            emit(
              PelangganProfileLoaded(
                pelangganModel: data,
              ),
            );
          },
        );
      }
    });
  }
}
