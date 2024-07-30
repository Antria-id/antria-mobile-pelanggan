import 'package:antria_mobile_pelanggan/core/network/network_checker.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/home/data/models/user/user_response_model.dart';
import 'package:antria_mobile_pelanggan/features/home/domain/usecases/home/get_local_user_usecase.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/pelanggan_model.dart';
import 'package:antria_mobile_pelanggan/features/profile/domain/usecases/get_pelanggan_profile_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pelanggan_profile_event.dart';
part 'pelanggan_profile_state.dart';

class PelangganProfileBloc
    extends Bloc<PelangganProfileEvent, PelangganProfileState> {
  final NetworkChecker networkChecker;
  PelangganProfileBloc()
      : networkChecker = serviceLocator<NetworkChecker>(),
        super(PelangganProfileInitial()) {
    on<PelangganProfileEvent>((event, emit) async {
      if (event is PelangganProfileFetchData) {
        emit(PelangganProfileLoading());
        bool isConnected = await networkChecker.isConnected;
        if (isConnected) {
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
        } else {
          var result = await serviceLocator<GetLocalUserUsecase>()
              .getUserFromLocalStorage();
          result.fold(
            (failure) {
              emit(PelangganProfileError(message: failure.message));
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
