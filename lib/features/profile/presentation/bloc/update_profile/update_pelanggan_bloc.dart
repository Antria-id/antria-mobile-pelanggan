import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/update_pelanggan_request_model.dart';
import 'package:antria_mobile_pelanggan/features/profile/domain/usecases/update_pelanggan_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'update_pelanggan_event.dart';
part 'update_pelanggan_state.dart';

class UpdatePelangganBloc
    extends Bloc<UpdatePelangganEvent, UpdatePelangganState> {
  UpdatePelangganBloc() : super(UpdatePelangganInitial()) {
    on<UpdatePelangganEvent>((event, emit) async {
      if (event is UpdatePelangganTapped) {
        final user = event.requestUser;
        emit(UpdatePelangganLoading());
        var result = await serviceLocator<UpdatePelangganUsecase>()
            .updatePelanggan(user);
        result.fold(
          (failure) {
            emit(UpdatePelangganFailed(message: failure.message));
          },
          (data) {
            emit(
              UpdatePelangganSuccess(requestUser: user),
            );
          },
        );
      }
    });
  }
}
